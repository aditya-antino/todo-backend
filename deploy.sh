#!/bin/bash

set -e

echo "Checking prerequisites..."

if ! command -v docker &> /dev/null; then
  echo "Docker is not installed."
  exit 1
fi

if ! command -v docker compose &> /dev/null; then
  echo "Docker Compose is not installed."
  exit 1
fi

echo "Stopping old containers (keeping data)..."
docker compose down

echo "Building & launching containers..."
docker compose up --build -d

echo "Waiting for services to be healthy..."

for i in {1..10}; do
  if curl -s http://localhost > /dev/null; then
    echo "[SUCCESS] Application is live at http://localhost"
    exit 0
  fi

  echo "Still waiting for application..."
  sleep 3
done

echo "Application did not become healthy in time."
echo "Check logs using: docker compose logs"
exit 1