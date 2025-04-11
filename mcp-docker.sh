#!/bin/bash

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected macOS: Using host network mode with no port mapping or volume mounts"
  # Use both files, but override with macOS-specific settings
  docker compose -f docker-compose.yml -f docker-compose.macos.yml "$@"
else
  echo "Detected non-macOS environment: Using standard configuration"
  docker compose "$@"
fi