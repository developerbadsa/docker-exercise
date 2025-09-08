# Use official Node.js image
FROM node:18-alpine

WORKDIR /app

# Copy dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Build production
RUN npm run build

# Expose app port
EXPOSE 4173

# Run Vite's production preview server
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "4173"]
