#!/bin/bash
# Git Version Control System Cookbook
# Chapter 10 - Patching and offline sharing
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

# Show whats is happening
set -x

# Getting ready

# Remove dir if it exists
rm -rf Git-Version-Control-Cookbook-Second-Edition_offline-sharing

# Clone
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_offline-sharing.git

# How to do it
cd Git-Version-Control-Cookbook-Second-Edition_offline-sharing

git checkout master

# Lets create a patch for the latest commit
git format-patch -1 -q -o latest-commit

# Checkout the develop branch
git checkout develop

# Create patches of all commits not on master
git format-patch -q -o not-on-master master

# List the content of the folder
ls -la

# Lets apply the patches:
# First we'll apply the patch in lastes-commit on the develop branch
git checkout develop
git am latest-commit/0001*

# Now lets apply the missing commits on master
git checkout master
git am not-on-master/*

git log -1 --pretty=fuller

# Checkout develop and reset to origin/develop
git checkout develop
git reset --hard origin/develop
# Apply the patch again, do not record a commit
git apply latest-commit/0001*

git status

# Exit subdir
cd ..

set +x
