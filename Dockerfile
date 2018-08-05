FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    gcc \
    gdb \
    make \
    nasm \
    vim \
    tree

# Set the working directory to /sandbox
WORKDIR /sandbox

# Copy the current directory contents into the container at /sandbox
# ADD ./src /sandbox
