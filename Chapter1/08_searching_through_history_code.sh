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

# Chapter 1 - Searching through history code

#Change directory to jgit repository
cd jgit
# Reset to known state
git checkout master && git reset --hard b14a939

# Find all commits that has "isOutdated" in its patch-set
echo -en "### -G option to git log outputs\n"
git log -G"isOutdated" --oneline

# Add a newline for beautification
echo -en "\n"
echo -en "### -S option to git log outputs\n"
# Find all commits that has "isOutdated" in its patch-set but disregard commits
# where the number of occurrences isn't changed
git log -S"isOutdated" --oneline

# Look closer at the commit not included in the -S output:
git show c9c57d3 | grep -C4 "isOutdated"


# Add a newline for beautification
echo -en "\n\n"
# Exit subdir
cd ..
