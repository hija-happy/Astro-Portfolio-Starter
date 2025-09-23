#!/bin/bash

# Exit on error
set -e

# Check if URL is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <remote-repo-url>"
  exit 1
fi

REMOTE_URL=$1

# Initialize git repo if not already
git init

# Stage everything
git add .

# Commit with message (skip if no changes)
git commit -m "initial commit" || echo "Nothing to commit"

# Reset remote origin (safe for re-use)
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"

# Rename branch to main
git branch -M main

# Push to GitHub
git push -u origin main
