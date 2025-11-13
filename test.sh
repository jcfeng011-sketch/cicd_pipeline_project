#!/bin/bash

# Test script for Jenkins CI/CD pipeline
# Runs unit tests for the calculator

set -e  # Exit on any error

echo "========================================="
echo "Running Tests"
echo "========================================="

# Run unit tests with verbose output
echo "Running unit tests..."
python3 -m pytest test.py -v

echo ""
echo "========================================="
echo "All tests passed!"
echo "========================================="
