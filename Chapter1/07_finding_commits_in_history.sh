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

# Chapter 1 - Finding commits in history

#Change directory to jgit repository
cd jgit

# Search the commits for Performance in the commit message
git log --grep "Performance" --oneline --all

# Search the commits for performance in the commit message
git log --grep "performance" --oneline --all | cat


# Open gitk, all branches
gitk --all &

# Exit subdir
cd ..
