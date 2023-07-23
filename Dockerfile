# Docker file gives the instrcutions to the image to creage the image, then from that image we can create a container

# First instruction for the image
FROM node

# Create directory first because travis does not contain the directory
RUN mkdir /usr/src/app

# Creating a work directory
WORKDIR /usr/src/app

# Create environment path
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# Copy package*.json to the main directory
COPY package*.json /usr/src/app

# Run NPM install (Install all dependencies)
RUN npm install

# Asking Docker to copy the directory from here to the actual directory of the container
COPY . /usr/src/app

# Exposing the port
EXPOSE 4000

# Run command
CMD ["npm", "start"]