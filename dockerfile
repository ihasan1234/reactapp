# Base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Build the React app
RUN npm run build

# Install 'serve' to serve the production build
RUN npm install -g serve

# Expose the port used by 'serve'
EXPOSE 3000

# Serve the app
CMD ["serve", "-s", "build", "-l", "3000"]
