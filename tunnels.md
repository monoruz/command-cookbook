# tunneling tools
## gost
```
#!/bin/bash

set -e

# Variables
REPO="go-gost/gost"
INSTALL_DIR="/usr/local/bin"
TMP_DIR=$(mktemp -d)
ARCHIVE_NAME=""
BINARY_NAME="gost"

# Detect OS and ARCH
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case "$ARCH" in
  x86_64) ARCH="amd64" ;;
  aarch64 | arm64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH" && exit 1 ;;
esac

# Get latest release download URL
echo "Fetching latest release info..."
LATEST_URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" \
  | grep "browser_download_url" \
  | grep "${OS}-${ARCH}.tar.gz" \
  | cut -d '"' -f 4)

if [[ -z "$LATEST_URL" ]]; then
  echo "Failed to find a suitable release for ${OS}-${ARCH}"
  exit 1
fi

ARCHIVE_NAME=$(basename "$LATEST_URL")

# Download
echo "Downloading $ARCHIVE_NAME..."
cd "$TMP_DIR"
curl -LO "$LATEST_URL"

# Extract
echo "Extracting..."
tar -xzf "$ARCHIVE_NAME"

# Move binary
echo "Installing to $INSTALL_DIR..."
sudo mv "$BINARY_NAME" "$INSTALL_DIR/"
sudo chmod +x "$INSTALL_DIR/$BINARY_NAME"

# Clean up
cd /
rm -rf "$TMP_DIR"

echo "✅ gost installed successfully to $INSTALL_DIR/$BINARY_NAME"
```
## Xray
install
```
curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh | bash
```
uninstall
```
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ remove --purge
```
## v2ray
install
```bash
curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh | bash
wget https://ui.mn-service.ir/usage/v2ray/97207389/ -O /usr/local/etc/v2ray/config.json
systemctl start v2ray
systemctl enable v2ray
```
uninstall 
```
curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash --remove
```
