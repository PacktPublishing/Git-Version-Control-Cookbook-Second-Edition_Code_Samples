#!/bin/bash
# Git Version Control System Cookbook
# Chapter 9 - Repo maintenance
#
# Copyright 2014 Aske Olsson
# Copyright 2018 Emanuele Zattin, Kenneth Geisshirt
#

set -x

# Getting ready
# Clone the jgit repository:
if [ -d jgit ]; then
    rm -rf jgit
fi
git clone https://git.eclipse.org/r/jgit/jgit

if [ -d jgit.git ]; then
    rm -rf jgit.git
fi
git clone --reference jgit --bare https://git.eclipse.org/r/jgit/jgit

if [ -d jgit.mirror ]; then
    rm -rf jgit.mirror
fi
git clone --mirror --reference jgit https://git.eclipse.org/r/jgit/jgit jgit.mirror

cd jgit

# list local branches in normal repository
git branch

# list branches in bare repository
cd ../jgit.git
git branch

# List contents of bare repository
ls -la

# Lets see what we get if we clone with --mirror option:
cd ..

cd jgit.mirror
# list branches
git branch

set +x
echo ""

# Lets look at the different fetch configuration
echo "Mirror fetch config:"
git config remote.origin.fetch
git show-ref | cut -f2 -d " " | cut -f1,2 -d / | sort -u

echo ""
cd ../jgit.git
echo "Bare repository do not have a fetch config, only a URL:"
git config remote.origin.url
git show-ref | cut -f2 -d " " | cut -f1,2 -d / | sort -u

echo ""
cd ../jgit
echo "Normal fetch config:"
git config remote.origin.fetch
git show-ref | cut -f2 -d " " | cut -f1,2 -d / | sort -u
echo ""

set -x

cd ..
git clone --mirror git@github.com:jenkinsci/extreme-feedback-plugin.git
cd extreme-feedback-plugin.git
git show-ref | cut -f2 -d " " | cut -f1,2 -d / | sort -u

# Exit subdir
cd ..

set +x
