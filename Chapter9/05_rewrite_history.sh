#!/bin/bash
# Git Version Control System Cookbook
# Chapter 9 - Repo maintenance
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

set -x

# Getting ready
# Clone the jgit repository:
if [ -d Git-Version-Control-Cookbook-Second-Edition_Remove-Credentials ]; then
    rm -rf Git-Version-Control-Cookbook-Second-Edition_Remove-Credentials
fi
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_Remove-Credentials.git
cd Git-Version-Control-Cookbook-Second-Edition_Remove-Credentials
git checkout master

# How to do it
# Check the contents of .credentials
cat .credentials

# Run the filter-branch
git filter-branch --prune-empty  --tree-filter "test -f .credentials && sed -i '' 's/^\(.*=\).*$/\1/' .credentials || true " -- --all

# Check the contents of .credentials
cat .credentials

# Delete original refs and remove old objects
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

git reflog expire --expire=now --all
git gc --prune=now

set +x
# Exit subdir
cd ..

set +x
