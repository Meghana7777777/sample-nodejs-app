# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory within the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which the Node.js application will listen
EXPOSE 8001

# Define the command to run the Node.js application
CMD [ "npm", "start" ]
