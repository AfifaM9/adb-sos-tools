# adb-sos-tools

A collection of utility scripts designed to simplify Android Debug Bridge (ADB) operations across different platforms.

## Repository Structure

The tools in this repository are separated by operating system targets:
*   `linux/` - Native shell scripts for Linux and macOS environments (executable, extensionless).
*   `windows/` - Batch command scripts (`.bat`) for Windows environments.

## Feature Overview

Each tool is designed to provide parity between environments:
*   **Case-Insensitive Inputs:** Arguments are safely normalized so variations like `BOOTLOADER` or `bootloader` execute identically.
*   **Parameter Aliasing:** Common alternatives (e.g., using `fastboot` as a shorthand alias for `bootloader`) are natively caught and handled.

## Getting Started

### Prerequisites
Make sure you have `adb` installed and configured in your system path, and that **USB Debugging** is enabled on your target Android device.

## Usage

### Linux / macOS
Before executing scripts in the Linux directory, ensure they have execute permissions:
```bash
chmod +x linux/*
```
Run any utility by targeting the script and passing the required mode:
```bash
./linux/<script_name> <mode>
```

### Windows
Run the corresponding batch utility directly from your command line:
```cmd
.\windows\<script_name>.bat <mode>
```
