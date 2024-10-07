#!/bin/bash

# Get the current branch name
current_branch=$(git branch --show-current)

# Fetch the latest updates and prune stale remote-tracking branches
echo "Fetching latest changes and pruning stale remote branches..."
git fetch --prune

# Check if we are already on the develop branch
if [ "$current_branch" == "develop" ]; then
  echo "Already on develop branch. Pulling the latest changes."
else
  echo "Switching to develop branch..."
  git checkout develop
fi

# Pull the latest changes from develop
echo "Pulling latest changes from develop..."
git pull origin develop

# Switch back to the previous branch
if [ "$current_branch" != "develop" ]; then
  echo "Switching back to $current_branch..."
  git checkout "$current_branch"
fi

# Rebase the current branch onto develop
echo "Rebasing $current_branch onto develop..."
git rebase develop

echo "Rebase completed successfully!"
