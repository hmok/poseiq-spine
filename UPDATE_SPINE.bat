@echo off
title PoseIQ Spine Deployment

echo ====================================
echo PoseIQ Spine deployment
echo ====================================
echo.

git add .

set /p msg=Commit message: 

if "%msg%"=="" set msg=Update PoseIQ Spine

git commit -m "%msg%"

if errorlevel 1 (
    echo.
    echo Nothing to commit, or commit failed.
)

git push origin master

if errorlevel 1 (
    echo.
    echo ERROR: Push failed.
    pause
    exit /b 1
)

echo.
echo ====================================
echo Deployment triggered successfully.
echo ====================================
pause