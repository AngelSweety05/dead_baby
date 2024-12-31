#!/bin/bash

# Check if UPSTREAM_REPO is set and clone the appropriate repository
if [ -z "$UPSTREAM_REPO" ]; then
  echo "Cloning main Repository..."
  git clone https://github.com/lazyindu/test1.git /LazyPrincess
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO..."
  git clone "$UPSTREAM_REPO" /LazyPrincess
fi

# Navigate to the LazyPrincess directory
cd /LazyPrincess || exit

# Install Python dependencies
if [ -f requirements.txt ]; then
  echo "Installing dependencies from requirements.txt..."
  pip3 install -U -r requirements.txt
else
  echo "No requirements.txt found. Skipping dependency installation."
fi

# Start the bot
echo "Starting Bot..."
exec python3 bot.py
