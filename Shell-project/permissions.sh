#!/bin/bash

echo "Updating permissions..."

chmod -R 755 website

# Make all shell scripts executable
find . -name "*.sh" -exec chmod +x {} \;

echo "Permissions updated successfully"