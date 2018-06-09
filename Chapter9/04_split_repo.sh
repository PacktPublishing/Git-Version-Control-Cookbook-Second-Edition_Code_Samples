#!/bin/bash
# Git Version Control System Cookbook
# Chapter 9 - Repo maintenance
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

# Make local branches of all remote branches
create_local_branches () {
  set +x
	current=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
	for br in $(git branch -a | grep -v $current | grep remotes | grep -v HEAD );
	do
		git branch ${br##*/} $br;
	done
  set -x
}

set -x

# Getting ready
# Clone the jgit repository:
cwd=$(pwd)
if [ -d jgit ]; then
  rm -rf jgit
fi
git clone https://git.eclipse.org/r/jgit/jgit
cd jgit
git checkout master

# Create all branches locally
create_local_branches

# How to do it
# Check the contents of the root tree
git ls-tree --abbrev HEAD

# prepare a script to delete everything except the folders:
# org.eclipse.jgit.http.*
# Create a script for the index filter
cat << EOF >$cwd/clean-tree
#!/bin/bash

# Clean the tree for unwanted dirs and files
# \$1 Files and dirs to keep
clean-tree () {
	# Remove everything but $1 from the git index/staging area
	for f in \$(git ls-files | grep -E -v "\$1" | grep -o -E "^[^/\"]+" | sort -u); do
	  git rm -rq --cached --ignore-unmatch \$f
	  #echo -en "\nRemoving \$f\n"
	done
}

clean-tree \$1

EOF

chmod +x $cwd/clean-tree

# The dirs and files to keep in regex for grep
# We'll keep/split out folders org.eclipse.jgit.http* and files:
# LICENSE., .gitignore. README.md, .gitattributes
keep="org.eclipse.jgit.http|LICENSE|.gitignore|README.md|.gitattributes"

# Run the filter-branch - may take a while!
git filter-branch --prune-empty  --index-filter "\"$cwd/clean-tree\" \"$keep\"" --tag-name-filter cat -- --all

# Check the root tree
git ls-tree --abbrev HEAD
# also with ls
ls -la

# The original branch pointers are kept in the refs dir under refs/original:
ls -la .git/refs/original/refs/heads/

# Size before clean:
du -sh .git

# Delete original refs and remove old objects
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

git reflog expire --expire=now --all
git gc --prune=now

# Size after clean:
du -sh .git

# Exit subdir
cd ..

set +x
