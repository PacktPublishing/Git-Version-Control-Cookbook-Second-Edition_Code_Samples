#!/bin/bash
# Git Version Control System Cookbook
# Chapter 8 - Recovering trom mistakes
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#
set -x

# Getting ready
if [ ! -d Git-Version-Control-Cookbook-Second-Edition_hello_world_cookbook ]; then
        git clone https://github.com/PacktPublishing/Git-Version-Control-Cookbook-Second-Edition_hello_world_cookbook.git
fi
cd Git-Version-Control-Cookbook-Second-Edition_hello_world_cookbook

# Checkout the master branch
git checkout master

# reset to known state
git reset --hard origin/master

# Make workdir dirty
cat << EOF > hello_world.c
#include <stdio.h>

void say_hello(void) {
	printf("hello, world\n");
}

int main(void){
	say_hello();
	return 0;
}
EOF

# How to do it
# Lets see the history of the repository
git log --oneline

# Make sure we have a clean working directory and index
git status

# Stash away uncomitted changes
git stash

# Check the status
git status

# Lets undo the latest commit
git reset --hard HEAD^

# Check history
git log --oneline

# Resurrect changes
git stash pop

# Check the hello world file
cat hello_world.c

# Exit subdir
cd ..

set +x


