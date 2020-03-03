#!/bin/bash
set -e

# Deploy app
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
cat <<EOF > /etc/systemd/system/puma.service
[Unit]
Description=Puma Server
After=network.target

[Service]
Type=simple
User=appuser
WorkingDirectory=/home/appuser/reddit
ExecStart=/bin/bash -lc 'puma'
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable puma
