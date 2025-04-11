# Specify the base image (check for the latest tag and specify if preferred)
FROM mcr.microsoft.com/playwright:v1.51.1-noble

# Set working directory (optional)
WORKDIR /app

# Install @playwright/mcp globally
# RUN npm cache clean --force # Try this if you encounter caching issues
RUN npm install -g @playwright/mcp@0.0.10

# Install Chrome browser and dependencies required by Playwright
# Although the base image should include them, explicitly install in case MCP cannot find them
RUN npm install @playwright/test && \
  npx playwright install chromium && \
  npx playwright install-deps chromium

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint
# ENTRYPOINT ["/app/entrypoint.sh", "--executable-path", "/usr/bin/google-chrome-stable"]
ENTRYPOINT ["/app/entrypoint.sh", "--executable-path", "/ms-playwright/chromium-1161/chrome-linux/chrome"]
