#!/bin/bash
# Git Version Control System Cookbook
# Chapter 9 - Repo maintenance
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#
set -x

# Getting ready
# Reclone the repository if it exists
if [ -d Git-Version-Control-Cookbook-Second-Edition_hello_world_flow_model ]; then
	rm -rf Git-Version-Control-Cookbook-Second-Edition_hello_world_flow_model
fi

git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_hello_world_flow_model.git

cd Git-Version-Control-Cookbook-Second-Edition_hello_world_flow_model
git checkout develop
git reset --hard origin/develop

# How to do it

# Lets first check the object count and if we have any dangling objects
git count-objects
git fsck --unreachable
du -sh .git

# Nothing, lets us create some by removing the origin remote
git remote rm origin

# Check git fsck again
git fsck --unreachable

# Lets try to garbage collect
git gc

# check git fsck again
git count-objects
git fsck --unreachable
du -sh .git

# Run garbage collect and prune objects older than now
git gc --prune=now

# Check fsck again
git count-objects
git fsck --unreachable
du -sh .git

# Exit subdir
cd ..

set +x
