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

# Chapter 1 - Viewing the DAG

# Change dir to data-model repository
cd Git-Version-Control-Cookbook-Second-Edition

# Reset to known state
git checkout master && git reset --hard 34acc37
#View the last 3 commits
git log -3
# View log with graphing options, Pipe through cat to disable paging
echo -en "\n### Ascii graph log\n"
git log --decorate --graph --oneline --all | cat
# Add a newline
echo -en "\n"

# Make a nice colored Ascii history graph, disable paging
echo -en "\n### Better Ascii graph log\n"
git log --all --graph --pretty=format:\
'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' | cat
# Add a newline
echo -en "\n"
# To set the alias run:
# git config –global alias.graph “log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset'”

# Exit subdir
cd ..
