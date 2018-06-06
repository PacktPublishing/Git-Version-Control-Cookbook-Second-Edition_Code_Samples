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
rm -rf jgit
git clone https://git.eclipse.org/r/jgit/jgit.git
cd jgit

# How to do it
# List effective configuration for the current Git repository
echo -en "Effective git configuration for $(pwd)\n"
git config --list
echo -en "\n\n"

# How it works:
echo -en "The .git/config file:\n"
cat .git/config
echo -en "\n\n"

# There is more...
# Set a new email address $USER@example.com
echo -en "Setting a new user email address for this repository:\n"
echo -en "$USER@example.com\n"
git config user.email $USER@example.com
echo -en "\n\n"

echo -en "Setting a new user name for this repository:\n"
echo -en "$USER"
git config user.name $USER
echo -en "\n\n"

# We can also set a value which means nothing to git
echo -en "Set a value that has no effect on core git:\n"
git config my.own.config "whatever I need"
echo -en "\n\n"

echo -en "Lets query the value:\n"
git config my.own.config
echo -en "\n\n"

# Delete/unset a key
echo -en "Delete a configuration entry:\n"
git config --unset my.own.config
echo -en "\n\n"
echo -en "Try to list the entry:\n"
git config my.own.config
echo -en "\n\n"


# Exit subdir
cd ..

set +x
