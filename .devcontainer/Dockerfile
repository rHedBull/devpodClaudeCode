FROM mcr.microsoft.com/devcontainers/python:3.11-bullseye

# Install Node.js 20+ (required for Claude Flow)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Install Claude Code CLI and Claude Flow
RUN npm install -g @anthropic-ai/claude-code && \
    npx claude-flow@alpha init --force

# Install Python dependencies
RUN pip install --upgrade pip python-dotenv

WORKDIR /workspace