#!/bin/bash
set -e

echo "🚀 Starting deployment..."

echo "🔑 Using IP: $PUBLIC_IP"

ssh -o StrictHostKeyChecking=no ubuntu@$PUBLIC_IP << 'EOF'
  set -e
  echo "📂 Moving to web root"
  cd /var/www/html

  echo "📦 Pulling latest changes"
  if [ -d ".git" ]; then
    git pull origin main
  fi

  echo "🔁 Restarting nginx"
  sudo systemctl restart nginx

  echo "✅ Deployment completed on EC2"
EOF

echo "🎉 Deployment finished successfully"

