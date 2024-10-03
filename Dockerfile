# Use the official Ubuntu image as a base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install basic utilities
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    vim \
    git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for our application
RUN mkdir -p /usr/src/app

# Set the working directory
WORKDIR /usr/src/app

# Copy a sample script to the container
COPY script.sh .

# Make the script executable (but do not run it)
RUN chmod 700 script.sh

# The default command can be a shell to allow interactive usage
CMD ["/bin/bash"]
