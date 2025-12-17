#!/bin/bash
# Upload files to GitHub repository

echo "========================================"
echo "Uploading to GitHub"
echo "========================================"
echo ""

# Navigate to script directory
cd "$(dirname "$0")"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "ERROR: Git is not installed or not in PATH!"
    echo ""
    echo "Please install Git from: https://git-scm.com/download/win"
    exit 1
fi

echo "Repository: https://github.com/SerSavage/gvlegacy-character-builder.git"
echo ""

# Initialize git if not already done
if [ ! -d ".git" ]; then
    echo "[1/5] Initializing git repository..."
    git init
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to initialize git"
        exit 1
    fi
    echo "      ✓ Git initialized"
else
    echo "[1/5] Git repository already initialized"
fi

echo ""
echo "[2/5] Adding all files..."
git add .
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to add files"
    exit 1
fi
echo "      ✓ Files added"

echo ""
echo "[3/5] Creating commit..."
git commit -m "Initial commit: Gloria Victis Character Builder"
if [ $? -ne 0 ]; then
    echo "WARNING: Commit failed (might be empty or already committed)"
    echo "Continuing anyway..."
fi

echo ""
echo "[4/5] Setting remote repository..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/SerSavage/gvlegacy-character-builder.git
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to set remote"
    exit 1
fi
echo "      ✓ Remote set"

echo ""
echo "[5/5] Pushing to GitHub..."
echo "      (You may be prompted for credentials)"
echo ""
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "✓ Successfully uploaded to GitHub!"
    echo "========================================"
    echo ""
    echo "Repository: https://github.com/SerSavage/gvlegacy-character-builder"
    echo ""
else
    echo ""
    echo "========================================"
    echo "✗ Push failed"
    echo "========================================"
    echo ""
    echo "Common issues:"
    echo "  - Not authenticated with GitHub"
    echo "  - Need to use Personal Access Token instead of password"
    echo "  - Repository doesn't exist or you don't have access"
    echo ""
    echo "Solutions:"
    echo "  1. Use Personal Access Token:"
    echo "     - Go to: https://github.com/settings/tokens"
    echo "     - Create token with 'repo' scope"
    echo "     - Use token as password when prompted"
    echo "  2. Configure git credentials:"
    echo "     git config --global user.name 'Your Name'"
    echo "     git config --global user.email 'your.email@example.com'"
    echo ""
fi

