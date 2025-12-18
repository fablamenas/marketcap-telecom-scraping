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
git pull origin main

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

# 5. Commit and push the CSV if changed
echo "💾 Committing CSV updates..."
git add telecom_market_caps_eur_billion.csv
if git diff --cached --quiet; then
    echo "ℹ️ No changes to CSV file"
else
    git commit -m "📊 Update market cap data - $(date '+%Y-%m-%d %H:%M')"
    git push origin main
    echo "✅ CSV pushed to repository"
fi

echo "✅ Deployment Finished!"
echo "🕐 Completed at $(date)"
