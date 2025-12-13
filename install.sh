#!/usr/bin/env bash
# Φ-Resonance Grid Installer
# Installs the safe scanner from GitHub

set -euo pipefail

# Output colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}🌌 Starting Φ-Resonance Grid Installation...${NC}"

# 1. Prerequisite Check
echo "Checking for Python3..."
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: Python3 is required but not found.${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Python3 found.${NC}"

# 2. Set Install Directory
INSTALL_DIR="${HOME}/.local/bin"
echo -e "Installing the tool to: ${YELLOW}${INSTALL_DIR}${NC}"
mkdir -p "${INSTALL_DIR}"

# 3. Download the CORRECT Tool: 'phi-scan-safe'
TOOL_NAME="phi-scan-safe" # <-- CRITICAL: Matches your file in tools/
TOOL_URL="https://raw.githubusercontent.com/Phi75-arch/Phi-Resonance-Grid-/main/tools/${TOOL_NAME}"

echo "Downloading the Φ-Resonance scanner..."
if curl -fsSL "$TOOL_URL" -o "${INSTALL_DIR}/${TOOL_NAME}"; then
    chmod +x "${INSTALL_DIR}/${TOOL_NAME}"
    echo -e "${GREEN}✓ Tool '${TOOL_NAME}' downloaded successfully.${NC}"
else
    echo -e "${RED}Error: Failed to download '${TOOL_NAME}'.${NC}"
    echo "  Please check that the file exists at: $TOOL_URL"
    exit 1
fi

# 4. Update User's PATH
SHELL_RC="${HOME}/.bashrc"
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    echo "export PATH=\"\$PATH:${INSTALL_DIR}\"" >> "$SHELL_RC"
    echo -e "${YELLOW}✓ Added ${INSTALL_DIR} to your PATH in ${SHELL_RC}.${NC}"
    echo -e "${YELLOW}  Run 'source ${SHELL_RC}' or restart your terminal.${NC}"
else
    echo -e "${GREEN}✓ Your PATH is already set up.${NC}"
fi

# 5. Success Message
echo -e "\n${GREEN}✅ Installation complete!${NC}"
echo -e "Type the following command to use the scanner:"
echo -e "  ${YELLOW}phi-scan-safe <your_python_file.py>${NC}"
echo -e "\n🌿 Breathe. Code. Resonate."
