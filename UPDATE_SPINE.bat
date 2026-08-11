@echo off

echo ====================================
echo PoseIQ Spine deployment
echo ====================================

git add .

set /p msg=Commit message: 

git commit -m "%msg%"

git push origin master

echo.
echo Deployment triggered.
pause
