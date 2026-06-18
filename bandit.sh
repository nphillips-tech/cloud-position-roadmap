#!/bin/bash

# Clear the screen for a clean interface
clear
echo "========================================="
echo "   OVERTHEWIRE BANDIT SSH AUTOMATOR      "
echo "========================================="
echo ""

# Prompt the user for the level number
echo -n "Enter the Bandit level number you want to join (e.g., 00, 06, 10): "
read LEVEL

# Dynamically construct the username
USERNAME="bandit$LEVEL"

echo ""
echo "Connecting to $USERNAME..."
echo "----------------------------------------="

# Execute the SSH command dynamically
ssh "$USERNAME@bandit.labs.overthewire.org" -p 2220
