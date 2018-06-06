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

# Check the history
git log --oneline

# revert the second commit
git revert 8609e8 --no-edit

# Check the history again
git log --oneline

# Exit subdir
cd ..

set +x


