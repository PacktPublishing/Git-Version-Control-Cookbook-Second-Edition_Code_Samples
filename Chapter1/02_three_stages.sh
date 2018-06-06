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

# Chapter 1 - Git's Objects
# Getting ready
rm -rf Git-Version-Control-Cookbook-Second-Edition
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition.git
cd Git-Version-Control-Cookbook-Second-Edition

# How to do it
# Change a file a bit
echo "Another line" >> another-file.txt
git status
git add another-file.txt
git status

# Change the file again
echo "Whoops almost forgot this" >> another-file.txt
git status
git add another-file.txt
git status
git commit -m "Another change to another file"

#
git cat-file -p HEAD
git cat-file -p HEAD^{tree}

git cat-file -p HEAD~1^{tree}

git fsck --dangling

sha=$(git fsck --dangling | cut -f 3 -d " ")

git cat-file -p $sha

# Exit subdir
cd ..

set +x
