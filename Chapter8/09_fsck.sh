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

# Find unreachable objects
git fsck --unreachable
objects=$(git fsck --unreachable) 2>/dev/null

# Show the objects
while read line; do
	git show ${line##* }
done <<< "$objects"

# Exit subdir
cd ..

set +x


