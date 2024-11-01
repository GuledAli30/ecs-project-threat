# Use Node.js 18 Alpine as the base image for a lightweight setup
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock to install dependencies
COPY package*.json ./
COPY yarn.lock ./

# Install app dependencies, and install serve globally
RUN yarn install --no-cache && \
    yarn global add serve

# Copy the rest of the application files into the container
COPY . .

# Expose port 3000 (or another port if you want to change it)
EXPOSE 3000

# Start the app using yarn
CMD ["yarn", "start"]
