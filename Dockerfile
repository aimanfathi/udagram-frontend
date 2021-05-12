# Use NodeJS base image
FROM node:12

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .
RUN ionic build


# Define the Docker image's behavior at runtime
CMD ["ionic serve"]
