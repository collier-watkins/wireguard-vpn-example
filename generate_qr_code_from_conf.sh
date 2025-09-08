#!/bin/bash

# Check if a configuration file is provided as an argument
if [ -z "$1" ]; then
  echo "Error: Please provide a WireGuard configuration file as an argument."
  echo "Usage: $0 <config_file>"
  exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

# Check if qrencode is installed
if ! command -v qrencode &> /dev/null; then
  echo "Error: qrencode is not installed. Please install it (e.g., sudo apt install qrencode)."
  exit 1
fi

# Generate QR code for the provided configuration file
qrencode -t ansiutf8 < "$1"

if [ $? -eq 0 ]; then
  echo "QR code generated successfully for '$1'."
else
  echo "Error: Failed to generate QR code for '$1'."
  exit 1
fi
