#!/bin/bash
# Git Version Control System Cookbook
# Chapter 9 - Repo maintenance
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#
set -x

# Getting ready
if [ -d hello_world_flow_model_remote ]; then
	rm -rf hello_world_flow_model_remote
fi
git clone --bare https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_hello_world_flow_model.git hello_world_flow_model_remote

if [ -d hello_world_flow_model ]; then
	rm -rf hello_world_flow_model
fi
	
# Create a local clone of the repository just cloned:
git clone hello_world_flow_model_remote hello_world_flow_model

cd hello_world_flow_model_remote
git branch -D feature/continents 
git branch -D feature/printing 
git branch -D release/1.0 
cd ..

# How to do it
cd hello_world_flow_model
git checkout develop
git reset --hard origin/develop

# Lets check all our branches
git branch -a

# Nothing happens when we do git fetch nor git pull
git fetch
git pull
# Show the branches
git branch -a

# Pass the --prune option to git fetch
git fetch --prune
# Show the branches
git branch -a

# Can also be done via 
# git pull --prune
# git remote update --prune

# Exit subdir
cd ..

set +x


