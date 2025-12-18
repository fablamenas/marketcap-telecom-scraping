#!/bin/bash
set -e

# Configuration
DEPLOY_DIR="/home/fabien/marketcap-telecom-scraping"

echo "----------------------------------------"
echo "🚀 Starting Deployment"
echo "Target: $DEPLOY_DIR"
echo "----------------------------------------"

cd "$DEPLOY_DIR"

# 1. Update Code
echo "📥 Pulling latest code..."
git pull origin main

# 2. TODO: Add your deployment steps here
# Examples:
# - Install dependencies: pip install -r requirements.txt
# - Run migrations
# - Restart services
# - Build frontend

echo "✅ Deployment Finished!"
echo "🕐 Completed at $(date)"
