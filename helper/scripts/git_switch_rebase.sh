<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Exit the script on any error
set -e
=======
#!/bin/bash
>>>>>>> f27cb71 (Fix(Helper_scripts): few tweaks to correct the destroy flow (#36))
=======
# Exit the script on any error
set -e
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)

# Get the current branch name
current_branch=$(git branch --show-current)

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)
# Check for uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
  echo "Uncommitted changes detected. Stashing changes before switching branches..."
  git stash push -m "auto-stash before switching to develop"
  stash_applied=true
else
  stash_applied=false
fi

# Fetch the latest updates and prune stale remote-tracking branches
echo "Fetching latest changes and pruning stale remote branches..."
git fetch --prune || { echo "Failed to fetch updates"; exit 1; }

# Check if we are already on the develop branch
if [ "$current_branch" == "develop" ]; then
  echo "Already on develop branch. Pulling the latest changes..."
  git pull origin develop || { echo "Failed to pull changes on develop"; exit 1; }
else
  echo "Switching to develop branch..."
  git checkout develop || { echo "Failed to switch to develop"; exit 1; }

  # Pull the latest changes from develop
  echo "Pulling latest changes from develop..."
  git pull origin develop || { echo "Failed to pull changes from origin"; exit 1; }
fi

# Switch back to the previous branch, if it wasn't 'develop'
if [ "$current_branch" != "develop" ]; then
  echo "Switching back to $current_branch..."
  git checkout "$current_branch" || { echo "Failed to switch back to $current_branch"; exit 1; }
<<<<<<< HEAD
=======
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
>>>>>>> f27cb71 (Fix(Helper_scripts): few tweaks to correct the destroy flow (#36))
=======
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)
fi

# Rebase the current branch onto develop
echo "Rebasing $current_branch onto develop..."
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)
git rebase develop || { echo "Rebase failed"; exit 1; }

# Apply the stash if changes were stashed earlier
if [ "$stash_applied" = true ]; then
  echo "Re-applying stashed changes..."
  git stash pop || { echo "Failed to reapply stashed changes"; exit 1; }
fi
<<<<<<< HEAD
=======
git rebase develop
>>>>>>> f27cb71 (Fix(Helper_scripts): few tweaks to correct the destroy flow (#36))

echo "Rebase completed successfully!"
=======
#!/bin/bash
=======
# Exit the script on any error
set -e
>>>>>>> 8ff3581 (update(helper): Automation scripts for git rebase on develop to make developement work faster (#45))

# Get the current branch name
current_branch=$(git branch --show-current)

# Check for uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
  echo "Uncommitted changes detected. Stashing changes before switching branches..."
  git stash push -m "auto-stash before switching to develop"
  stash_applied=true
else
  stash_applied=false
fi

# Fetch the latest updates and prune stale remote-tracking branches
echo "Fetching latest changes and pruning stale remote branches..."
git fetch --prune || { echo "Failed to fetch updates"; exit 1; }

# Check if we are already on the develop branch
if [ "$current_branch" == "develop" ]; then
  echo "Already on develop branch. Pulling the latest changes..."
  git pull origin develop || { echo "Failed to pull changes on develop"; exit 1; }
else
  echo "Switching to develop branch..."
  git checkout develop || { echo "Failed to switch to develop"; exit 1; }

  # Pull the latest changes from develop
  echo "Pulling latest changes from develop..."
  git pull origin develop || { echo "Failed to pull changes from origin"; exit 1; }
fi

# Switch back to the previous branch, if it wasn't 'develop'
if [ "$current_branch" != "develop" ]; then
  echo "Switching back to $current_branch..."
  git checkout "$current_branch" || { echo "Failed to switch back to $current_branch"; exit 1; }
fi

# Rebase the current branch onto develop
echo "Rebasing $current_branch onto develop..."
git rebase develop || { echo "Rebase failed"; exit 1; }

# Apply the stash if changes were stashed earlier
if [ "$stash_applied" = true ]; then
  echo "Re-applying stashed changes..."
  git stash pop || { echo "Failed to reapply stashed changes"; exit 1; }
fi

echo "Rebase completed successfully!"
>>>>>>> 2e4e7e2 (Feat(cicd_new_design): Implement Full CI/CD Pipeline with Dynamic Environment Support and Reusable Actions (#44))
=======

echo "Rebase completed successfully!"
>>>>>>> 693547f (Feat(Docker): Implement Multi-Stage Docker Build with Cache Optimization and Dependency Management)
