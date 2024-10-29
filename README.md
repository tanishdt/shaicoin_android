# Shaicoin Android Setup

This repository provides an automated setup script for mining Shaicoin on an Android device using UserLAnd. The `setup.sh` script installs all necessary dependencies, sets up Rust for ARM architecture, clones the Shaicoin repository, compiles it, and runs the Shaicoin daemon.

## Prerequisites

- UserLAnd app installed on your Android device
- Sufficient storage space and processing power for compiling and mining

## Getting Started

1. **Clone this repository**:

   ```bash
   git clone https://github.com/tanishdt/shaicoin_android.git
   cd shaicoin_android
   ```

2. **Make the Setup Script Executable**:

   ```bash
   chmod +x setup.sh
   ```

3. **Run the Setup Script**:

   ```bash
   ./setup.sh
   ```

4. **Follow Prompts**:

   - Enter the number of processor cores to use for compiling (e.g., 4 for a quad-core device).
   - The script will handle the entire installation, setup, and initial run of the Shaicoin daemon.

## Script Details

The `setup.sh` script performs the following steps:

- Updates and upgrades system packages.
- Installs essential packages, including Git, Curl, Rust, and other dependencies.
- Adds the ARM target for Rust (aarch64-linux-android).
- Clones the official Shaicoin repository.
- Compiles the Shaicoin project.
- Runs the Shaicoin daemon (`shaicoind`).

## Troubleshooting

- **Permission Errors**: Ensure the script has executable permissions (`chmod +x setup.sh`).
- **Low Memory**: Compilation may be resource-intensive; close other apps and processes if possible.
- **Rust or Cargo Not Found**: Source Rust by running `source $HOME/.cargo/env` before running the script.
