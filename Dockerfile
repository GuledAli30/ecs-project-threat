# This line tells Docker to use an existing image as the base environment for your app. In this case, it uses Node.js version 14. A base image is like a pre-configured system that includes the operating system and basic tools (in this case, Node.js).
FROM node:18-alpine

# sets the working directory inside the container. Any following commands (like copying files) will be run in this directory. /app is where your application files will be located inside the container
WORKDIR /app

# This command copies your package.json and package-lock.json files from your local machine to the container. These files define the dependencies your app needs.
COPY package*.json ./
COPY yarn.lock ./ 

# installs your app’s dependencies inside the container using npm install. This ensures that when the container runs, all necessary Node.js modules are available.
RUN yarn install

# This copies all the remaining files from your app’s root directory on your machine into the container’s /app directory. It ensures that your source code is available inside the container.
COPY . .

# EXPOSE informs Docker that your app will use a specific network port, in this case, 3000. This is usually the port your app listens on for incoming traffic. It doesn’t actually make the port accessible outside the container; it’s more of a hint for Docker.
EXPOSE 3000

# CMD defines the command that will be run when the container starts. In this case, it's npm start, which runs the start script from your package.json file. This starts your application inside the container.
CMD ["yarn", "start"]
