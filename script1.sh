#!/bin/bash

set -e  # Exit immediately on error
echo "🔧 Starting script1.sh..."

# Decompress recovery image if .lz4 is present
if [ -f recovery.img.lz4 ]; then
    echo "📦 Found recovery.img.lz4, decompressing..."
    lz4 -B6 --content-size -f recovery.img.lz4 recovery.img
else
    echo "ℹ️ No recovery.img.lz4 found. Skipping decompression."
fi

# Use full image for patching (commented logic can be restored if needed)
if [ -f recovery.img ]; then
    cp recovery.img r.img
    echo "✅ Copied recovery.img to r.img"
else
    echo "❌ recovery.img not found!"
    exit 1
fi

# Generate AVB private key if not already present
if [ ! -f phh.pem ]; then
    echo "🔐 Generating AVB private key (phh.pem)..."
    openssl genrsa -f4 -out phh.pem 4096
else
    echo "✅ AVB key already exists (phh.pem)"
fi

echo "✅ script1.sh completed."
