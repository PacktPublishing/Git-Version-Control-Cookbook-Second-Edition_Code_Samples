#!/bin/bash
# Git Version Control System Cookbook
# Chapter 2 - Configuration
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

# Show whats is happening
set -x

rm -rf Git-Version-Control-Cookbook-Second-Edition
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition.git
cd Git-Version-Control-Cookbook-Second-Edition

# Git VCS cookbook
cwd=$(pwd)
# Chapter 2 - Configuration
# Getting ready

# create .git_template folder
mkdir -p .git_template

# create hooks and exclude file dirs
mkdir -p .git_template/hooks
mkdir -p .git_template/info

# Copy sample hooks from git installation
# For home brew users: /usr/local/Cellar/git/2.9.0/share/git-core
if [ -d /usr/share/git-core/templates/hooks ]; then
	cp /usr/share/git-core/templates/hooks/* .git_template/hooks
else
	echo -en "Default git hooks not found in /usr/share/git-core/templates/hooks\n"
	echo -en "Continuing without default hooks!\n"
fi

# Create commit message hook:
cat <<EOF >.git_template/hooks/commit-msg
#!/bin/sh
echo "\nHi from the template commit-msg hook" >> .git/COMMIT_EDITMSG
EOF

# Executable
chmod +x .git_template/hooks/commit-msg

# Exclude file to exclude all *.txt files
echo *.txt >.git_template/info/exclude

# Create a new git repository with the template option on the command line
# Could also have been set as a global user config with:
git config --global init.templatedir $(pwd)/.git_template
git init template-example
# Unset the template dir
git config --global --unset init.templatedir
cd template-example

# How to do it˝ Set the template dir to be used

echo "this is a readme file" > README.txt

echo -en "Created a readme file, checking with git status:\n"
git status

# Try another file
echo "something to commit" > somefile
echo -en "Created another file, checking with git status:\n"
git status

# Add and commit the file
git add somefile
export EDITOR=cat
git commit -m "Committed something"

# Check with gl log
git log -1 | cat


# Exit subdir
cd ..

set +x
