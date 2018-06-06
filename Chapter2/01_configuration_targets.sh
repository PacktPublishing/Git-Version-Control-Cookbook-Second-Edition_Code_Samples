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

# Chapter 2 - Configuration
# Getting ready
git clone https://git.eclipse.org/r/jgit/jgit.git
cd jgit

# How to do it
# List SYSTEM configuration
echo -en "System git configuration:\n"
git config --list --system
echo -en "\n\n"

# How to do it
# List GLOBAL configuration
echo -en "User git configuration:\n"
git config --list --global
echo -en "\n\n"

# How to do it
# List REPO configuration
echo -en "repository git configuration for $(pwd):\n"
git config --list --local
echo -en "\n\n"

# Query a single key
echo -en "Query a single configuration entry on local level:\n"
git config --local user.email
echo -en "\n\n"
echo -en "Setting a new user email address on local level:\n"
git config --local user.email $USER@$USER.com
echo -en "\n\n"

# Difference between GLOBAL and LOCAL setting
echo -en "Lets see the difference between global and local for the entry:\n"
echo -en "Global: $(git config --global user.email)\n\n"
echo -en "Local:  $(git config --local user.email)\n\N"

# How it works:
echo -en "Git uses plain text files for storing the configuration\n"
echo -en "On system level /etc/gitconfig is used\n\n"
echo -en "On global level ~/.gitconfig   is used\n\n"
echo -en "On local  level .git/config    is used\n\n"

# Exit subdir
cd ..

set +x
