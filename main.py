#!/usr/bin/env python3
"""
Main application file
"""

import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

def main():
    """Main function"""
    app_name = os.getenv("APP_NAME", "Default App")
    app_env = os.getenv("APP_ENV", "development")
    debug = os.getenv("DEBUG", "false").lower() == "true"
    
    print(f"Starting {app_name}")
    print(f"Environment: {app_env}")
    print(f"Debug mode: {debug}")
    
    # Your application logic here
    print("\nApplication is running...")
    
if __name__ == "__main__":
    main()