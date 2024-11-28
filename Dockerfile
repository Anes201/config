# Use the official Debian base image
FROM debian:latest

# Set environment variables (optional)
ENV DEBIAN_FRONTEND=noninteractive

# Define the username as an argument
ARG USERNAME=myuser

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    vim \
    git \
    ruby-full \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    python-dev \
    python3-pip \
    python-pip \
    python-setuptools \
    libldns-dev \
    libpcap-dev \
    ffuf \
    nmap \
    sublist3r \
    sqlmap \
    wireshark \
    proxychains4 \
    tor \
    tldr \
    jq \
    && apt-get clean

# Create a new user with the defined username (optional)
RUN useradd -m -s /bin/bash $USERNAME \
    && echo "$USERNAME:password" | chpasswd \
    && adduser $USERNAME sudo

# Set up the user's home directory
USER root
WORKDIR /home/$USERNAME

# Create a tools directory
RUN mkdir /home/$USERNAME/tools

# Copy the bash script into the container
COPY bb_setup.sh /home/$USERNAME/bb_setup.sh

# Make the script executable (root user to run chmod)
RUN chmod +x /home/$USERNAME/bb_setup.sh

# Switch to the non-root user
USER $USERNAME

# Run the bash script to install the tools
RUN /home/$USERNAME/bb_setup.sh

# Expose any necessary ports (optional)

# Set the default command to run when the container starts (optional)
CMD ["bash"]

