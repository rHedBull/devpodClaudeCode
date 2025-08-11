#!/bin/bash

echo "🚀 Running post-start setup..."

# Load environment variables
if [ -f "/workspace/.env" ]; then
    set -a
    source /workspace/.env
    set +a
    echo "✅ Environment variables loaded"
fi

# Activate Python virtual environment if it exists
if [ -d "/workspace/.venv" ]; then
    source /workspace/.venv/bin/activate
    echo "✅ Python virtual environment activated"
fi

# Display system information
echo ""
echo "📊 System Information:"
echo "  Python: $(python --version)"
echo "  Node: $(node --version)"
echo "  npm: $(npm --version)"
echo "  Git: $(git --version)"
echo ""

# Display workspace information
echo "📁 Workspace: /workspace"
echo "👤 User: $(whoami)"
echo ""

# Run health checks
if [ -f "/workspace/.devcontainer/scripts/health-check.sh" ]; then
    bash /workspace/.devcontainer/scripts/health-check.sh
fi

echo "✅ Container is ready for development!"