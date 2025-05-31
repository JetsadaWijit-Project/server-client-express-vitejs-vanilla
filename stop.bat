echo ========================================
echo Stopping and removing old containers, images, and volumes...
echo ========================================
docker compose down --rmi all --volumes
