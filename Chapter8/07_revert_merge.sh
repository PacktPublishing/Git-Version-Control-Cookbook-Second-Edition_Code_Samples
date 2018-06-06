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

# Create the p-hello-versions branch
git branch -f feature/p-lang origin/feature/p-lang

# Checkout the develop branch
git checkout develop
git reset --hard origin/develop

# How to do it
# Try the perl hello_world
perl hello_world.pl

# Check history
git log --oneline --graph -5

# Lets check the tree:
git ls-tree --abbrev HEAD

# Revert the bad merge
git revert -m 1 --no-edit HEAD^

# Lets check the tree again:
git ls-tree --abbrev HEAD

# There is more

# Try to merge the fixed branch
git merge --no-edit -X theirs feature/p-lang
# solve the conflict
git add hello_world.pl
git commit --no-edit

# Check the tree
git ls-tree --abbrev HEAD

# hello_world.php is missing, clearly the merge didn't go as expected, undo
git reset --hard HEAD^

# Revert the revert
git revert --no-edit HEAD
		
# Try to merge again
git merge --no-edit feature/p-lang

# Check the tree
git ls-tree --abbrev HEAD

# Check that the perl version runsd
perl hello_world.pl

# Exit subdir
cd ..

set +x


