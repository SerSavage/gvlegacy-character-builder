@echo off
REM Upload files to GitHub repository
title Upload to GitHub
setlocal

echo ========================================
echo Uploading to GitHub
echo ========================================
echo.

REM Check if git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Git is not installed or not in PATH!
    echo.
    echo Please install Git from: https://git-scm.com/download/win
    echo Or use GitHub Desktop: https://desktop.github.com/
    echo.
    pause
    exit /b 1
)

echo Repository: https://github.com/SerSavage/gvlegacy-character-builder.git
echo.

REM Initialize git if not already done
if not exist ".git" (
    echo [1/5] Initializing git repository...
    git init
    if %errorlevel% neq 0 (
        echo ERROR: Failed to initialize git
        pause
        exit /b 1
    )
    echo       ✓ Git initialized
) else (
    echo [1/5] Git repository already initialized
)

echo.
echo [2/5] Adding all files...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files
    pause
    exit /b 1
)
echo       ✓ Files added

echo.
echo [3/5] Creating commit...
git commit -m "Initial commit: Gloria Victis Character Builder"
if %errorlevel% neq 0 (
    echo WARNING: Commit failed (might be empty or already committed)
    echo Continuing anyway...
)

echo.
echo [4/5] Setting remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/SerSavage/gvlegacy-character-builder.git
if %errorlevel% neq 0 (
    echo ERROR: Failed to set remote
    pause
    exit /b 1
)
echo       ✓ Remote set

echo.
echo [5/5] Pushing to GitHub...
echo       (You may be prompted for credentials)
echo.
git branch -M main
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ Successfully uploaded to GitHub!
    echo ========================================
    echo.
    echo Repository: https://github.com/SerSavage/gvlegacy-character-builder
    echo.
) else (
    echo.
    echo ========================================
    echo ✗ Push failed
    echo ========================================
    echo.
    echo Common issues:
    echo   - Not authenticated with GitHub
    echo   - Need to use Personal Access Token instead of password
    echo   - Repository doesn't exist or you don't have access
    echo.
    echo Solutions:
    echo   1. Use GitHub Desktop (easiest)
    echo   2. Use Personal Access Token:
    echo      - Go to: https://github.com/settings/tokens
    echo      - Create token with 'repo' scope
    echo      - Use token as password when prompted
    echo   3. Use SSH instead of HTTPS
    echo.
)

pause

