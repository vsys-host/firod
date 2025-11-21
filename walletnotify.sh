#!/bin/bash

TXID="$1"
CRYPTO="FIRO"

curl -X POST -H "X-Shkeeper-Backend-Key: ${SHKEEPER_BACKEND_KEY}" "http://shkeeper:5000/api/v1/walletnotify/${CRYPTO}/${TXID}"
curl -X POST -H "X-Shkeeper-Backend-Key: ${SHKEEPER_BACKEND_KEY}" "http://shkeeper:5000/api/v1/walletnotify/${CRYPTO}-SPARK/${TXID}"
exit 0
