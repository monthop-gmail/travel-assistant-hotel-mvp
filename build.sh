#!/bin/bash
VERSION=$(git rev-parse --short HEAD)
echo "Building with version: $VERSION"

sed -i "s/VERSION_PLACEHOLDER/$VERSION/g" index.html
sed -i "s/VERSION_PLACEHOLDER/$VERSION/g" manifest.json
sed -i "s/VERSION_PLACEHOLDER/$VERSION/g" sw.js
