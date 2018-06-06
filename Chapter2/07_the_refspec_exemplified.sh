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
# Setup repositories

git clone --bare https://git.eclipse.org/r/jgit/jgit jgit-bare.git
git init refspec-tests
cd jgit-bare.git
# Create stable/* branches at the same ref as stable-* for namespacing example
for branch in $(git branch -a | grep "stable-"); do
	new=$(echo $branch | sed 's/-/\//')
	git branch $new $branch
done

cd $cwd
# setup the test repository
cd refspec-tests
# Add our bare jgit repository as origin
git remote add origin ../jgit-bare.git

# Change the fetch refspec of origin to only pull master
echo -en "Setting up the fetch refspec to only fetch master\n"
git config remote.origin.fetch "+refs/heads/master:refs/remotes/origin/master"

echo -en "Pulling origin (git pull)\n"
git pull


# setup a fetch refspec to fetch all the stable/* branches
echo -en "Setting up a refspec to fetch all stable/* branches\n"
git config --add remote.origin.fetch "+refs/heads/stable/*:refs/remotes/origin/stable/*"

echo "Fetching (git fetch)\n"
git fetch

# Push refspecs:
# setup a develop branch
echo -en "Creating a develop branch\n"
git checkout -b develop

# Update, add and commit a change
echo -en "Creating a commit\n"
echo "This is the developer setup, read carefully" > readme-dev.txt
git add readme-dev.txt
git commit -m "adds readme file for developers"

# Create the push refspec to push from develop to integration/master
echo -en "Creating push refspec\n\n"
git config remote.origin.push "refs/heads/develop:refs/remotes/origin/integration/master"

echo -en "Pushing\n\n"
git push

# Exit subdir
cd $cwd

set +x
