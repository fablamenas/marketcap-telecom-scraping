#!/bin/bash
set -e

# Configuration
DEPLOY_DIR="/home/fabien/marketcap-telecom-scraping"

echo "----------------------------------------"
echo "🚀 Starting Deployment & Scraping"
echo "Target: $DEPLOY_DIR"
echo "----------------------------------------"

cd "$DEPLOY_DIR"

# 1. Update Code
echo "📥 Pulling latest code..."
git fetch origin main
git reset --hard origin/main

# 2. Setup Python environment
echo "🐍 Setting up Python environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate
pip install -q -r requirements.txt

# 3. Run the scraper
echo "📊 Running telecom market cap scraper..."
python telecom_marketcap_scraper.py

# 4. Send email with CSV attachment
echo "📧 Sending email report..."
python scripts/send_email.py

# 5. Note: CSV updates are kept local only
# (Pushing would trigger the workflow again in an infinite loop)
echo "ℹ️ CSV updated locally (not pushed to avoid workflow loop)"

echo "✅ Deployment Finished!"
echo "🕐 Completed at $(date)"
