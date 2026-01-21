# Use lightweight Node image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files first (layer caching)
COPY package*.json ./

# Install only production deps
RUN npm install --only=production

# Copy rest of the source code
COPY . .

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose app port
EXPOSE 5000

# Start the app
CMD ["node", "src/server.js"]
