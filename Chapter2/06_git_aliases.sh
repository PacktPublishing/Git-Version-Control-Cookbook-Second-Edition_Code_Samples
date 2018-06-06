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
cwd=$(pwd)
# Chapter 2 - Configuration
# Getting ready
rm -rf jgit
git clone https://git.eclipse.org/r/jgit/jgit
cd jgit

# Set a bunch of aliases
git config alias.co checkout
git config alias.br branch
git config alias.ci commit
git config alias.st status

git st

# create a unstage alias
git config alias.unstage 'reset HEAD --'

# edit README-md file
echo "This needs to be in the README file" >> README.md

# Status add and statud
git st
git add README.md
git st

#unstage the file & status
git unstage README.md
git st

# alias for long listing each commit - lines added and removed
git config alias.ll "log --pretty=format:\"%C(yellow)%h%Cred%d %Creset%s %Cgreen(%cr) %C(bold blue)<%an>%Creset\" --numstat"
# List the last 3 commits
git ll -3

# Add edit conflicted to gitconfig
if [ -z "$(git alias.editconflicted)"]; then
	git config alias.editconflicted '!f() {git ls-files --unmerged | cut -f2 | sort -u ; }; $EDITOR `f`'
fi

# Clean up
git reset --hard origin/master

# Create two branches:
git branch A 03f78fc
git branch B 9891497
git checkout A
git merge B

# Show status
git st

old_editor=$EDITOR
export EDITOR=cat

echo -en "EDITOR set to cat, now running git editconflicted...\n"
git editconflicted

# Create an alias to add the conflicted
if [ -z "$(git alias.addconflicted)"]; then
	git config alias.addconflicted '!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`'
fi

echo -en "\n\nAdding the conflicted files git addconflicted\n"
echo -en "WITH CONFLICT MARKERS - just for the purpose of the example\n\n"

git addconflicted
git st

# Exit subdir
cd $cwd

set +x
