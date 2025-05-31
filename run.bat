@echo off
echo Fetching latest changes from Git...
git fetch

echo Pulling latest changes...
git pull

echo Rebuilding and starting Docker Compose services...
docker compose down --rmi all --volumes
docker compose up --build
