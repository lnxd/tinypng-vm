FROM server.findlay.cloud:5000/ubuntu-vm:20.04

# Install default apps
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nano sudo build-essential curl

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# Install tinypng-cli
RUN npm install -g tinypng-cli

# Clean up apt
RUN apt-get clean all

# Set environment variables.
ENV HOME /home/docker

# Define working directory.
WORKDIR /home/docker

# Define default command.
CMD ["bash"]