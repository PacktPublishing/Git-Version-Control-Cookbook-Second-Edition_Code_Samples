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
if [ -d Git-Version-Control-Cookbook-Second-Edition_Super ]; then
    rm -rf Git-Version-Control-Cookbook-Second-Edition_Super
fi
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_Super.git

cd Git-Version-Control-Cookbook-Second-Edition_Super

# Add the lib_a as a submodule
git submodule add https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_lib_a.git lib_a

# Check git status
git status

# Check the contents of .gitmodules and the lib_a file
cat .gitmodules
# check the lib_a file as git sees it
git diff --cached lib_a

# Commit the added submodule
git commit -m "Adds lib_a as a submodule"

# Lets try to update the submodule to the develop branch
cd lib_a
git checkout develop
cd ..

git status

# Lets update the submodule
git submodule update

cd lib_a
# Check the submodule
git status

# We are on a detached head lets checkout the develop branch again
git checkout develop
cd ..

git status
git add lib_a

git commit -m "Updated lib_a to newest version"

# Update to follow the develop branch:
git config -f .gitmodules submodule.lib_a.branch stable
cat .gitmodules
git add .gitmodules

git commit -m "Make lib_a module track its stable branch"

git submodule update --remote
git status

cd ..

# Clone a repository containing submodules
rm -rf super_clone

git clone Git-Version-Control-Cookbook-Second-Edition_Super super_clone
cd super_clone
git submodule init
git submodule update --remote


# Exit subdir
cd ..

set +x
