#!/bin/bash
echo "🚀 Starting X-UI on port ${PORT}..."
# تنظیم پورت در فایل کانفیگ
mkdir -p /etc/x-ui
cat > /etc/x-ui/config.json << EOF
{
  "webPort": ${PORT},
  "webBasePath": "/",
  "webListen": "0.0.0.0",
  "logLevel": "info"
}
EOF

cd /usr/local/x-ui

# تنظیم اعتبارات کاربری
./x-ui setting -username alireza -password MyNewPassword123

# اجرای X-UI
./x-ui

