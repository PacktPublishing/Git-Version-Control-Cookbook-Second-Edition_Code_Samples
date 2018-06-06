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
git checkout develop
git checkout master

# Lets see the commit on master not on develop
git log develop..master

# Lets create a patch for the latest commit
git format-patch -1 -o latest-commit

cat latest-commit/0001*

# Create patches for the latest 3 commits
git format-patch -3 -o latest-commits
ls -la latest-commits

# Exit subdir
cd ..

set +x
