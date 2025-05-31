@echo off

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
