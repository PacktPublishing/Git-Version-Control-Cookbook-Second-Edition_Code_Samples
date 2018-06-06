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

# check out branches
git checkout develop
git checkout master

# Create initial bundle, with only the master branch as history
git bundle create myrepo.bundle master

# Verify the bundle
git bundle verify myrepo.bundle

# Tag the commit so we know which commit we used as HEAD for next time we need
# to create a bundle
git tag bundleForOtherRepo master

# Create a new bundle with the diff in history from bundleForOtherRepo to tip
# of develop
git bundle create myrepo.bundle bundleForOtherRepo..develop

# Verify it and see which commit needs to be in repository for the bundle to work
git bundle verify myrepo.bundle

# View history
git log --oneline --graph --decorate develop master

# Exit subdir
cd ..

set +x
