#!/bin/bash

# To create .pem from .p12
# openssl pkcs12 -in pushcert.p12 -out pushcert.pem -nodes -clcerts

DEVICE_ID=""
CERTIFICATE_PATH=".pem"
APP_ID=com.semenyutin.TGWatchOS.watchkitapp

curl -v \
-d '{"aps":{"alert":{"body":"Test message","title":"Optional title","subtitle":"Optional subtitle"},"category":"myCategory","thread-id":"5280"}}' \
-H "apns-topic: $APP_ID" \
-H "apns-priority: 10" \
-H "apns-push-type: alert" \
--http2 \
--cert "$CERTIFICATE_PATH" \
"https://api.development.push.apple.com/3/device/$DEVICE_ID"
