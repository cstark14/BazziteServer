#!/bin/bash

set -e

echo "-- Bazzite Integration Server Installer --"

# Ensure we are in the repo root
cd "$(dirname "$0")"
repo_dir="$(pwd)"
escaped_repo_dir="${repo_dir//&/\\&}"

echo "Removing any existing virtual environment"
rm -rf venv

echo "Creating virtual environment"
python3 -m venv venv
source venv/bin/activate

echo "Upgrading packaging tools"
python -m pip install --upgrade pip setuptools wheel

echo "Installing Python dependencies"
python -m pip install -r requirements.txt

echo "Setting up user systemd service"
mkdir -p ~/.config/systemd/user
sed "s|__REPO_DIR__|$escaped_repo_dir|g" systemd/bazzite-server.service.user > ~/.config/systemd/user/bazzite-server.service

echo "Reloading user systemd daemon"
systemctl --user daemon-reload

echo "Enabling and starting service"
systemctl --user enable --now bazzite-server

echo "Done!"
echo "To check status: systemctl --user status bazzite-server"
echo "To see logs: journalctl --user -u bazzite-server -f"
