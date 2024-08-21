# Use an official Node.js runtime as a parent image
FROM node:18-alpine AS build

# Install git to clone the repository
RUN apk add --no-cache git

# Set the working directory in the container
WORKDIR /app

# Clone the GitHub repository
RUN git clone https://github.com/Mageshpoopathi/React.git .

# Install the project dependencies
RUN npm install

# Build the React app
RUN npm run build

# Serve the app using a simple web server
RUN npm install -g serve

# Specify the command to run the app
CMD ["serve", "-s", "build"]

# Expose port 3000 to the outside world
EXPOSE 3000
