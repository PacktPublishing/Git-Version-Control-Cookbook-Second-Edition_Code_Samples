#!/bin/bash
# Git Version Control System Cookbook
# Chapter 1 - Navigating Git
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

# Show whats is happening
set -x

# Git VCS cookbook

# Chapter 1 - Extracting fixed issues

# Getting ready

#Clone the jgit repository
git clone https://git.eclipse.org/r/jgit/jgit
cd jgit
# Reset to known state
git checkout master && git reset --hard b14a939

# How to do it
git describe
# Grep for "Bug: " in commit messages from head to tag
git log --grep="Bug: " v3.1.0.201310021548-r..HEAD | cat
# Format the above
git log --grep="Bug: " v3.1.0.201310021548-r..HEAD --pretty="%h|%s%n%b" | cat

# Find and replace with grep and sed, the full command
git log --grep "Bug: " v3.1.0.201310021548-r..HEAD --pretty="%h|%s%n%b" \
| grep -E "\||Bug: " | sed -e 's/|/: /' -e 's/Bug:/Fixes-bug:/'

# Just the bug ids
git log  v3.1.0.201310021548-r..HEAD | grep "Bug: "

# Commit ids and subject, not bug id
git log --grep "Bug: " --oneline  v3.1.0.201310021548-r..HEAD

# Exit subdir
cd ..
