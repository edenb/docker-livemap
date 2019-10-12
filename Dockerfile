FROM node:10.15.1

# Create a project folder for the app
RUN mkdir /project
WORKDIR /project

# Get latest version of the Livemap app
# --strip 1 removes the container folder
RUN curl -sSL https://github.com/edenb/livemap/tarball/master | tar -xvz --strip 1

# Install dependencies
RUN npm install

# Make port available from outside the container
EXPOSE 3000

# Start app
CMD ["node", "app.js"]
