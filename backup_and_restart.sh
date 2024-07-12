#!/bin/bash

# Define el directorio del servidor y el mensaje del commit
SERVER_DIR="/home/ubuntu/Imagen-de-server"
COMMIT_MSG="Backup and restart at $(date)"

# Navega al directorio del servidor
cd $SERVER_DIR

# Detiene el servidor
echo "Stopping the server..."
stop

# Añade todos los cambios y realiza el commit
echo "Adding changes and committing..."
git add .
git commit -m "$COMMIT_MSG"

# Empuja los cambios al repositorio remoto
echo "Pushing changes to GitHub..."
git push origin

# Inicia el servidor
echo "Starting the server..."
java -Xmx6G -Xms1024M -jar server.jar nogui
echo "Backup and restart completed."
