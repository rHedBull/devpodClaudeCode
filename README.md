# Python DevPod Template

Minimal development container template for Python projects with environment variable support.

## What's Included
- Python 3.11 container (Ubuntu-based)
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

### 3. Run Your Code
```bash
python main.py
```

## Adding Dependencies
Add packages to `requirements.txt` and rebuild the container.

## Files
- `.devcontainer/` - Container configuration
- `.env.example` - Environment template (copy to `.env`)
- `main.py` - Your application entry point
- `requirements.txt` - Python dependencies

That's it! Your isolated Python environment is ready.