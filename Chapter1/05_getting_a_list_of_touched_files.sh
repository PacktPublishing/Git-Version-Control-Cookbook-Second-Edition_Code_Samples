#!/bin/bash
# Git Version Control System Cookbook
# Chapter 1 - Navigating Git
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

# Show whats is happening
set -x

# Git VCS cookbook

# Chapter 1 - Getting a list of touched files

# Getting ready

# Change directory to jgit repository
cd jgit
# Reset to known state
git checkout master && git reset --hard b14a939

# List all changed files since last release (v3.1.0.201310021548-r)
echo -en "\n### All touched files:\n"
git diff --name-only v3.1.0.201310021548-r..HEAD | cat

# Add a newline for beautification
echo -en "\n### List only deleted files:\n"
# List only deleted files since last release
git diff --name-only --diff-filter=D  v3.1.0.201310021548-r..HEAD | cat

# Exit subdir
cd ..
