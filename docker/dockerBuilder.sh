COPY $SETUP_SCRIPT .bashrc .bash_profile /home/$USERNAME

docker run -it --name my-debian-container debian-image bash

# Build Docker image
docker build -t my-debian-image .

# Run Docker container interactively
docker run -it my-debian-image bash

# Execute command inside a running container
docker exec -it <container_name_or_id> bash

# List all running containers
docker ps

# List all containers (including stopped ones)
docker ps -a

# List all Docker images
docker images

# Remove a specific container
docker rm <container_name_or_id>

# Remove a specific image
docker rmi <image_name_or_id>

# Start a stopped container
docker start <container_name_or_id>

# Stop a running container
docker stop <container_name_or_id>

# Remove all stopped containers
docker container prune

# Remove unused images
docker image prune

# Run a new container from an image
docker run -it <image_name> bash

