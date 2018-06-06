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
git format-patch -1 -o latest-commit

# Checkout the develop branch
git checkout develop

# Lets send the patches:
# get email of user
emailaddr=$(git config user.email)

# First we'll send the patch in lastest-commit on the develop branch
git send-email --to $emailaddr --from $emailaddr --force --confirm=never latest-commit/0001*

# Now lets send the patches for the missing missing commits on master
# And create a cover letter for the messages. We don't need to use
# git format-patch first, we can use git send-email directly
git send-email --to $emailaddr --from $emailaddr --cover-letter --force --confirm=never origin/master

# Exit subdir
cd ..

set +x
