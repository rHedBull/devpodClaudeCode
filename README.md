# Python DevPod Template

Minimal development container template for Python projects with environment variable support and Claude Code CLI pre-installed.

## What's Included
- Python 3.11 container (Ubuntu-based)
- Claude Code CLI pre-installed
- Environment variables via `.env` file
- `main.py` starter file
- Clean, minimal setup

## Quick Start

### 1. Setup Environment
```bash
cp .env.example .env
# Edit .env with your actual values
```

### 2. Start DevPod

**Option A: VS Code**
1. Open this folder in VS Code
2. Install "Dev Containers" extension if needed
3. Press `F1` → "Dev Containers: Reopen in Container"

**Option B: DevPod CLI**
```bash
devpod up . --ide vscode
```

### 3. Setup Claude Code API Key
```bash
# Add your Anthropic API key to .env file:
# ANTHROPIC_API_KEY=sk-ant-...
```

### 4. Run Your Code
```bash
python main.py
```

### 5. Use Claude Code
```bash
# Chat with Claude (uses API key from .env)
claude chat "Help me with Python code"

# Use Claude on files
claude edit main.py
```

## Adding Dependencies

**Python packages:**
- Add to `requirements.txt`, then run `pip install -r requirements.txt`

**System packages (apt):**
- Install directly: `sudo apt update && sudo apt install package-name`
- These persist until container is destroyed

**System updates:**
- Auto-updates on container rebuild (via `updateContentCommand`)
- Manual update: `sudo apt update && sudo apt upgrade`

**When to rebuild container:**
- Only when modifying the Dockerfile itself
- Not needed for installing packages

## Rebuilding the Container

**VS Code:**
- Press `F1` → "Dev Containers: Rebuild Container"
- Or click the popup when VS Code detects Dockerfile changes

**DevPod CLI:**
```bash
devpod delete <workspace-name>
devpod up . --ide vscode
```

**Docker (if using directly):**
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up
```

## Files
- `.devcontainer/` - Container configuration
- `.env.example` - Environment template (copy to `.env`)
- `main.py` - Your application entry point
- `requirements.txt` - Python dependencies

That's it! Your isolated Python environment is ready.