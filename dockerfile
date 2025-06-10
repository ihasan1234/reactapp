# ---- Step 1: Build React app ----
FROM node:20-alpine as builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy source code and build
COPY . .
RUN npm run build

# ---- Step 2: Output Only Build Folder ----
# This stage is optional if you're copying manually
FROM alpine AS output

WORKDIR /output
COPY --from=builder /app/build .

# No CMD needed — this is just a build artifact image