#!/bin/bash

# Custom Setup Script Template
# This script runs after the main post-create setup
# Add your project-specific initialization here

echo "🔧 Running custom setup..."

# Example: Install additional system packages
# apt-get update && apt-get install -y package-name

# Example: Clone additional repositories
# git clone https://github.com/username/repo.git /workspace/external/repo

# Example: Download data files
# wget https://example.com/data.csv -O /workspace/data/sample.csv

# Example: Set up database
# if [ -f "/workspace/scripts/init-db.sql" ]; then
#     psql -U postgres -f /workspace/scripts/init-db.sql
# fi

# Example: Install Chrome for web scraping
# if ! command -v google-chrome &> /dev/null; then
#     wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#     sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#     apt-get update && apt-get install -y google-chrome-stable
# fi

# Example: Install specific Python packages from git
# pip install git+https://github.com/username/package.git

# Example: Set up Jupyter extensions
# jupyter contrib nbextension install --user
# jupyter nbextension enable code_prettify/code_prettify

# Example: Configure AWS CLI
# if [ -n "$AWS_ACCESS_KEY_ID" ]; then
#     aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
#     aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
#     aws configure set default.region $AWS_DEFAULT_REGION
# fi

# Example: Set up SSH keys
# if [ -f "/workspace/.ssh/id_rsa" ]; then
#     cp -r /workspace/.ssh ~/.ssh
#     chmod 700 ~/.ssh
#     chmod 600 ~/.ssh/id_rsa
#     chmod 644 ~/.ssh/id_rsa.pub
# fi

# Add your custom setup commands here

echo "✅ Custom setup completed!"