FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install Git and other dependencies
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the entire project
COPY . /app/

# Make scripts executable
RUN chmod +x .github/scripts/entrypoint.sh
RUN chmod +x .github/scripts/update_readme.sh

# Set entrypoint
ENTRYPOINT [".github/scripts/entrypoint.sh"]