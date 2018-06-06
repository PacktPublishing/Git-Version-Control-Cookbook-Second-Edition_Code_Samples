#!/bin/bash
# Git Version Control System Cookbook
# Chapter 2 - Configuration
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

# Show whats is happening
set -x

# Git VCS cookbook

# Chapter 2 - Configuration
# Getting ready
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition.git
cd Git-Version-Control-Cookbook-Second-Edition

# Prepare commit message template:
cat << EOF > .gitcommitmsg.txt
Short description of commit

Longer explanation of the motivation for the change

Fixes-Bug: Enter bug-id or delete line
Implements-Requirement: Enter requirement-id or delete line
EOF

# How to do it
# Set the template to be used
echo -en "Set template to be used just for this repo:\n"
git config commit.template .gitcommitmsg.txt
echo -en "\n\n"


# Modyfi and add a file
echo -en "\nAnother line in the file\n" >> another-file.txt
git add another-file.txt
echo -en "\n\n"

git commit
res=$?
if [ $res -ne 0 ]; then
	echo -en "Commit wasn't successful, please try again...\n"
	echo -en "\n\n"
fi
# Exit subdir
cd ..

set +x
