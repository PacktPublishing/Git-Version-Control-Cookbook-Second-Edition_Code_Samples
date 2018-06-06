#!/bin/bash
# Git Version Control System Cookbook
# Chapter 2 - Configuration
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

# Show whats is happening
set -x

# Git VCS cookbook
cwd=$(pwd)
# Chapter 2 - Configuration
# Getting ready
rm -rf Git-Version-Control-Cookbook-Second-Edition
git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition.git
cd Git-Version-Control-Cookbook-Second-Edition

# setup pull to rebase
git config pull.rebase true

# setup pull to rebase for all tracked branches
git config branch.autosetuprebase always

# setup feature/2 for pull to rebase
git config branch.feature/2.rebase true

# expiry
git config gc./refs/remote/*.reflogexpire never
git config gc./refs/remote/*.reflogexpireunreachable "2 months"

git config gc.pruneexpire 3.days.ago

# auto correct
git statis

# set auto correct
git config help.autocorrect 5

# modify a file
echo "doing some modifications..." > another-file.txt
git statis

# exit subdir
cd $cwd

set +x
