#!/bin/bash

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install necessary packages
echo "Installing Git, Curl, and Cargo..."
sudo apt install -y git curl cargo

# Install Rust via rustup
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Add Rust target for ARM (Android's architecture)
echo "Adding Rust target for ARM (aarch64-linux-android)..."
rustup target add aarch64-linux-android

# Install additional build dependencies
echo "Installing build tools and CMake..."
sudo apt update
sudo apt install -y build-essential cmake

# Additional dependencies for building Shaicoin
echo "Installing additional dependencies for Shaicoin build..."
sudo apt install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libevent-dev libboost-dev libsqlite3-dev

# Clone the Shaicoin repository
echo "Cloning Shaicoin repository..."
git clone https://github.com/shaicoin/shaicoin.git

# Enter the cloned Shaicoin directory
cd shaicoin

# Prepare and build the project
echo "Preparing the build environment..."
./autogen.sh
./configure

# Set the number of cores for parallel compilation
echo "Enter the number of processor cores to use for compilation (e.g., 4):"
read proc

echo "Building Shaicoin using $proc threads..."
make -j $proc

# Run Shaicoin daemon
echo "Starting Shaicoin daemon..."
cd src
./shaicoind
