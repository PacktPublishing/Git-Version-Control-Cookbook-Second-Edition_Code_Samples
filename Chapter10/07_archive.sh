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

# Lets try archiving the tree at the master branch
git archive --prefix=offline/ -o offline.zip origin/master

# Check the contents of the archive:
unzip -l offline.zip

# Match it against the tree @ origin/master
git ls-tree -l origin/master

# Archive only a subfolder
git archive --prefix=docs/ -o docs.zip origin/doc:Documentation

# Check the archive again
unzip -l docs.zip

# And the tree
git ls-tree -l origin/doc:Documentation

# Different commands, same output:
git archive --format=tar.gz HEAD > offline.tar.gz
git archive -o offline2.tar.gz HEAD

diff offline.tar.gz offline2.tar.gz

# Try to highlight the sha-id in the output
unzip -l offline.zip | egrep '^|.*1e42a2dfa3a377d412efd27a77b973c75935c62a'

# Exit subdir
cd ..

set +x
