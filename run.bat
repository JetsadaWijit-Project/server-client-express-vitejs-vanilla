@echo off
:: Create logs directory if it doesn't exist
if not exist logs mkdir logs

:: Get timestamp in format yyyy-MM-dd-HH-mm-ss
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd-HH-mm-ss"') do set timestamp=%%i

:: Set log prefix path
set LOG_PREFIX=logs\%timestamp%

echo ========================================
echo Fetching latest changes from Git...
echo ========================================
git fetch

echo ========================================
echo Pulling latest changes...
echo ========================================
git pull

echo ========================================
echo Stopping and removing old containers, images, and volumes...
echo ========================================
docker compose down --rmi all --volumes

echo ========================================
echo Rebuilding and starting containers...
echo ========================================
docker compose up --build

echo ========================================
echo Opening client in Chrome...
echo ========================================
start chrome http://localhost:5173
