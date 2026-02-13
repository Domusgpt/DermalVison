#!/bin/bash

# DermalVision Environment Setup Script
# Use this script to bootstrap the development environment in a new cloud terminal.

set -e

echo "=== DermalVision Setup ==="

# 1. Install Flutter if not present
if ! command -v flutter &> /dev/null; then
    echo "Flutter not found. Installing..."
    # Download Flutter SDK (stable)
    if [ ! -d "$HOME/flutter" ]; then
        git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
    fi
    export PATH="$PATH:$HOME/flutter/bin"

    # Add to shell config if not present
    if ! grep -q "flutter/bin" "$HOME/.bashrc"; then
        echo 'export PATH="$PATH:$HOME/flutter/bin"' >> $HOME/.bashrc
    fi

    flutter doctor
else
    echo "Flutter is already installed."
fi

# 2. Check for project directory
if [ -d "dermalvision" ]; then
    echo "Project directory 'dermalvision' found."
    cd dermalvision
else
    echo "Error: 'dermalvision' directory not found. Please ensure you are in the root of the repository."
    exit 1
fi

# 3. Install dependencies
echo "Installing dependencies..."
flutter pub get

# 4. Generate code
echo "Generating code (Riverpod/Freezed)..."
dart run build_runner build --delete-conflicting-outputs

echo "=== Setup Complete ==="
echo "You can now run: cd dermalvision && flutter run"
