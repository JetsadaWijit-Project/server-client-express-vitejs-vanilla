@echo off
:: Create logs directory if it doesn't exist
if not exist logs mkdir logs

:: Get timestamp in format yyyy-MM-dd-HH-mm-ss
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd-HH-mm-ss"') do set timestamp=%%i

:: Set log file path
set LOG_FILE=logs\%timestamp%-docker.log

echo ========================================
echo Fetching latest changes from Git...
echo ========================================
git fetch
git pull

echo ========================================
echo Stopping and removing old containers, images, and volumes...
echo ========================================
docker compose down --rmi all --volumes

echo ========================================
echo Rebuilding and starting containers in background...
echo Log output: %LOG_FILE%
echo ========================================
docker compose up --build > "%LOG_FILE%" 2>&1

echo ========================================
echo Waiting for containers to start...
echo ========================================
timeout /t 5 > NUL

echo ========================================
echo Opening client in Chrome...
echo ========================================
start chrome http://localhost:5173

echo ========================================
echo All done!
echo ========================================
