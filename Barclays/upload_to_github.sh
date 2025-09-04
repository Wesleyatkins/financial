#!/bin/bash

# GitHub Upload Script for Barclays Equity Research Report
# Created: September 4, 2025

echo "🚀 Starting Barclays Report GitHub Upload Process..."
echo ""

# Set variables
REPO_DIR="$HOME/financial"  # Adjust this path if your repo is elsewhere
SOURCE_DIR="/Users/wesleyatkins/Sync/!Brain/Oracle/1-PROJECTS/EQUITY-RESEARCH-ANALYST/BARCLAYS"
TARGET_DIR="Barclays"

# Check if repo directory exists
if [ ! -d "$REPO_DIR" ]; then
    echo "📁 Repository not found at $REPO_DIR"
    echo "Cloning repository..."
    cd "$HOME"
    git clone https://github.com/Wesleyatkins/financial.git
    cd financial
else
    echo "✅ Repository found at $REPO_DIR"
    cd "$REPO_DIR"
    echo "📥 Pulling latest changes..."
    git pull origin main
fi

# Create Barclays directory
echo ""
echo "📂 Creating Barclays directory..."
mkdir -p "$TARGET_DIR"

# Copy all markdown files
echo "📋 Copying research files..."
cp "$SOURCE_DIR"/*.md "$TARGET_DIR/"

# List files to confirm
echo ""
echo "📊 Files copied to Barclays folder:"
ls -1 "$TARGET_DIR"/*.md | xargs -n 1 basename

# Count files
FILE_COUNT=$(ls -1 "$TARGET_DIR"/*.md | wc -l)
echo ""
echo "✅ Total files: $FILE_COUNT"

# Git operations
echo ""
echo "🔧 Preparing Git commit..."
git add "$TARGET_DIR/"

# Show status
echo ""
echo "📝 Git status:"
git status --short

# Commit
echo ""
echo "💾 Creating commit..."
git commit -m "Add Barclays PLC institutional equity research report

- Comprehensive 17-file analysis suite
- Investment rating: BUY
- Price target: 420 GBP (+14.4%)
- 131 verified sources
- Analysis date: September 4, 2025
- Author: Wesley Atkins
- Methodology: Oracle Trinity Equity Research Framework"

# Push to GitHub
echo ""
echo "🌐 Pushing to GitHub..."
git push origin main

echo ""
echo "✨ Upload complete! Your Barclays research report is now on GitHub."
echo "🔗 View at: https://github.com/Wesleyatkins/financial/tree/main/Barclays"