#!/bin/bash
set -e

echo "🚀 Starting deployment..."
echo "🔑 Using IP: $PUBLIC_IP"

ssh -o StrictHostKeyChecking=no ubuntu@$PUBLIC_IP << EOF
  set -e
  echo "📂 Preparing release directory"

  RELEASE=\$(date +%Y%m%d-%H%M%S)
  mkdir -p /var/www/releases/\$RELEASE
  cp -r /var/www/html/* /var/www/releases/\$RELEASE/

  ln -sfn /var/www/releases/\$RELEASE /var/www/current

  echo "🔁 Reloading nginx"
  sudo systemctl reload nginx

  echo "✅ Deployment completed on EC2"
EOF

echo "🎉 Deployment finished successfully"

