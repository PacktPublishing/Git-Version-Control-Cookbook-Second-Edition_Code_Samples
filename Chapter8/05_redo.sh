#!/bin/bash
# Git Version Control System Cookbook
# Chapter 8 - Recovering trom mistakes
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#
set -x

# Getting ready
if [ ! -d Git-Version-Control-Cookbook-Second-Edition_hello_world_cookbook ]; then
        git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_hello_world_cookbook.git
fi
cd Git-Version-Control-Cookbook-Second-Edition_hello_world_cookbook

# Checkout the master branch
git checkout master

# reset to known state
git reset --hard origin/master

# How to do it
# Lets see the latest commit
git log -1

# Make sure we have a clean working directory and index
git status

# Redo the latest commit with a new commit message
echo -e "Adds Java version of 'hello world'\n\nAlso includes a makefile\n\nFixes: RD-31415" | git commit --amend -F - 

# Check the latest commit again
git log -1

# Check the commit object of the previous commit:
git cat-file -p 9e695a0

# Check the commit object of the current HEAD/commit:
git cat-file -p HEAD

### There is more !!!

echo "This is the readme file" > README.md

# Add the file
git add README.md

# Check status
git status

git commit --amend --no-edit

# Exit subdir
cd ..

set +x


