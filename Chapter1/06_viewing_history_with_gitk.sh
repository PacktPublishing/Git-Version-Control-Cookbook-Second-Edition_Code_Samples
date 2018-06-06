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

# Chapter 1 - Viewing history with gitk

# Check for a gitk installation
which gitk

#Change directory to data-model repository
cd Git-Version-Control-Cookbook-Second-Edition

# Open gitk with all branches
gitk --all &

# Exit subdir
cd ..
