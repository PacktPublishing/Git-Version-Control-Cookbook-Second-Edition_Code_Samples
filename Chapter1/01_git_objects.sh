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
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition.git
cd Git-Version-Control-Cookbook-Second-Edition

# How to do it
# Commit
echo -en "\n### The Commit Object\n"
git cat-file -p HEAD
# Tree
echo -en "\n### The Tree Object\n"
git cat-file -p 34fa038544bcd9aed660c08320214bafff94150b
# Blob (cat-me.txt)
echo -en "\n### The Blob Object\n"
git cat-file -p 92f046f17079aa82c924a9acf28d623fcb6ca727

# Try to do git cat-file on the master branch
echo -en "\n### Branches aren't really objects\n"
git cat-file master
# Try to do git cat-file on the master branch with pretty print
# It will show the same commit object as cat'ing HEAD
echo -en "\n### A branch just shows the commit it points to\n"
git cat-file -p master

# Check the content of the master branch (text file)
echo -en "\n### The content of .git/refs/heads/master \n"
cat .git/refs/heads/master
#Verify with git log
git log -1
# Check the HEAD file
echo -en "\n### The content of .git/HEAD\n"
cat .git/HEAD

# List the tags
echo -en "\n### Tags\n"
git tag
# View the v1.0 tag
echo -en "\n### The Tag Object\n"
git cat-file -p v1.0

# How it works

# Verify the commit object to the same sha-1 as in history
# (13dcada077e446d3a05ea9cdbc8ecc261a94e42d)
echo -en "\n### Verify the commit 13dcada077e446d3a05ea9cdbc8ecc261a94e42d\n"
git cat-file -p HEAD | git hash-object -t commit --stdin


# Exit subdir
cd ..

set +x
