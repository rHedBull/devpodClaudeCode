#!/bin/bash

echo "🚀 Running post-create setup..."

# Load environment variables if .env exists
if [ -f "/workspace/.env" ]; then
    echo "📋 Loading environment variables..."
    set -a
    source /workspace/.env
    set +a
fi

# Install project-specific Python requirements
if [ -f "/workspace/requirements.txt" ]; then
    echo "📦 Installing Python requirements..."
    pip install -r /workspace/requirements.txt
fi

# Install project-specific Python dev requirements
if [ -f "/workspace/requirements-dev.txt" ]; then
    echo "📦 Installing Python dev requirements..."
    pip install -r /workspace/requirements-dev.txt
fi

# Install Poetry dependencies if pyproject.toml exists
if [ -f "/workspace/pyproject.toml" ]; then
    echo "📦 Installing Poetry dependencies..."
    poetry install
fi

# Install npm dependencies if package.json exists
if [ -f "/workspace/package.json" ]; then
    echo "📦 Installing npm dependencies..."
    npm install
fi

# Setup pre-commit hooks if .pre-commit-config.yaml exists
if [ -f "/workspace/.pre-commit-config.yaml" ]; then
    echo "🔧 Setting up pre-commit hooks..."
    pre-commit install
fi

# Create Python virtual environment if it doesn't exist
if [ ! -d "/workspace/.venv" ]; then
    echo "🐍 Creating Python virtual environment..."
    python -m venv /workspace/.venv
    echo "source /workspace/.venv/bin/activate" >> ~/.bashrc
    echo "source /workspace/.venv/bin/activate" >> ~/.zshrc
fi

# Initialize Git repository if not already initialized
if [ ! -d "/workspace/.git" ]; then
    echo "📝 Initializing Git repository..."
    git init
    git config --local user.name "${GIT_USER_NAME:-Developer}"
    git config --local user.email "${GIT_USER_EMAIL:-developer@example.com}"
fi

# Create basic project structure if it doesn't exist
if [ ! -d "/workspace/src" ]; then
    echo "📁 Creating project structure..."
    mkdir -p /workspace/{src,tests,docs,data,notebooks,scripts}
    touch /workspace/src/__init__.py
    touch /workspace/tests/__init__.py
fi

# Run custom setup script if it exists
if [ -f "/workspace/.devcontainer/scripts/custom-setup.sh" ]; then
    echo "🔧 Running custom setup..."
    bash /workspace/.devcontainer/scripts/custom-setup.sh
fi

echo "✅ Post-create setup completed!"