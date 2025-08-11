#!/bin/bash

echo "🏥 Running health checks..."

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if a command exists
check_command() {
    if command -v $1 &> /dev/null; then
        echo -e "${GREEN}✅ $1 is installed${NC}"
        return 0
    else
        echo -e "${RED}❌ $1 is not installed${NC}"
        return 1
    fi
}

# Function to check Python package
check_python_package() {
    if python -c "import $1" 2>/dev/null; then
        echo -e "${GREEN}✅ Python package '$1' is installed${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠️  Python package '$1' is not installed${NC}"
        return 1
    fi
}

# Function to check directory exists
check_directory() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✅ Directory $1 exists${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠️  Directory $1 does not exist${NC}"
        return 1
    fi
}

# Function to check file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✅ File $1 exists${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠️  File $1 does not exist${NC}"
        return 1
    fi
}

echo ""
echo "🔧 System Tools:"
check_command python
check_command pip
check_command git
check_command node
check_command npm
check_command docker

echo ""
echo "📦 Core Python Packages:"
check_python_package fastapi
check_python_package pandas
check_python_package numpy
check_python_package pytest
check_python_package black
check_python_package jupyter

echo ""
echo "📁 Project Structure:"
check_directory /workspace
check_directory /workspace/src
check_directory /workspace/tests
check_directory /workspace/docs
check_file /workspace/.env
check_file /workspace/requirements.txt

echo ""
echo "🔍 Environment Variables:"
if [ -n "$WORKSPACE_FOLDER" ]; then
    echo -e "${GREEN}✅ WORKSPACE_FOLDER is set: $WORKSPACE_FOLDER${NC}"
else
    echo -e "${YELLOW}⚠️  WORKSPACE_FOLDER is not set${NC}"
fi

if [ -n "$PYTHONPATH" ]; then
    echo -e "${GREEN}✅ PYTHONPATH is set: $PYTHONPATH${NC}"
else
    echo -e "${YELLOW}⚠️  PYTHONPATH is not set${NC}"
fi

echo ""
echo "💾 Disk Space:"
df -h /workspace | tail -1 | awk '{print "  Available: " $4 " / " $2 " (" $5 " used)"}'

echo ""
echo "🏥 Health check complete!"