# Use NodeJS base image
FROM node:12

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install -g @ionic/cli
RUN ionic init "udacity-c2-frontend" --type=angular
RUN ionic build
RUN ionic serve

# Copy app source
COPY . .

# Bind the port that the image will run on
EXPOSE 8100

# Define the Docker image's behavior at runtime
CMD ["node", "server.js"]