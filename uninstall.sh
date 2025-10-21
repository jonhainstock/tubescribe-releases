#!/bin/bash

# TubeScribe Uninstall Script
# Removes all application data and the app itself

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  TubeScribe Uninstall${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Application paths
APP_PATH="/Applications/TubeScribe.app"
APP_SUPPORT_PATH="$HOME/Library/Application Support/TubeScribe"
LOG_PATH="$APP_SUPPORT_PATH/tubescribe.log"

# Check if app exists
if [ ! -d "$APP_PATH" ]; then
    echo -e "${YELLOW}⚠️  TubeScribe.app not found in /Applications${NC}"
    echo "The app may have already been removed or installed elsewhere."
else
    echo -e "Found TubeScribe at: ${BLUE}$APP_PATH${NC}"
fi

# Check if app support exists
if [ ! -d "$APP_SUPPORT_PATH" ]; then
    echo -e "${YELLOW}⚠️  No application data found${NC}"
    echo "Application Support folder already clean."
    HAS_DATA=false
else
    echo -e "Found application data at: ${BLUE}$APP_SUPPORT_PATH${NC}"
    HAS_DATA=true
fi

echo ""
echo "This will remove:"
if [ -d "$APP_PATH" ]; then
    echo "  • Application: $APP_PATH"
fi
if [ "$HAS_DATA" = true ]; then
    echo "  • Binaries: $APP_SUPPORT_PATH (yt-dlp, whisper, ffmpeg, etc.)"
    echo "  • License data: $APP_SUPPORT_PATH/license.json"
    echo "  • Logs: $APP_SUPPORT_PATH/tubescribe.log"
fi
echo ""
echo -e "${YELLOW}⚠️  This action cannot be undone!${NC}"
echo ""

# Ask for confirmation
read -p "Are you sure you want to uninstall TubeScribe? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo ""
    echo -e "${BLUE}Uninstall cancelled.${NC}"
    echo ""
    exit 0
fi

echo ""
echo -e "${YELLOW}Uninstalling TubeScribe...${NC}"
echo ""

# Kill any running instances
if pgrep -x "tubescribe" > /dev/null; then
    echo "  • Stopping TubeScribe..."
    killall TubeScribe 2>/dev/null
    sleep 1
fi

# Remove the application
if [ -d "$APP_PATH" ]; then
    echo "  • Removing application..."
    rm -rf "$APP_PATH"
    if [ $? -eq 0 ]; then
        echo -e "    ${GREEN}✓ Application removed${NC}"
    else
        echo -e "    ${RED}✗ Failed to remove application${NC}"
        echo "    You may need to run: sudo rm -rf \"$APP_PATH\""
    fi
fi

# Remove application support data
if [ "$HAS_DATA" = true ]; then
    echo "  • Removing application data..."

    # Show what's being removed
    DATA_SIZE=$(du -sh "$APP_SUPPORT_PATH" 2>/dev/null | cut -f1)
    echo "    (Removing ${DATA_SIZE} of data)"

    rm -rf "$APP_SUPPORT_PATH"
    if [ $? -eq 0 ]; then
        echo -e "    ${GREEN}✓ Application data removed${NC}"
    else
        echo -e "    ${RED}✗ Failed to remove application data${NC}"
    fi
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ TubeScribe has been uninstalled${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Thank you for using TubeScribe!"
echo ""
echo "If you encountered any issues, please let us know:"
echo "https://github.com/jonhainstock/tubescribe/issues"
echo ""
