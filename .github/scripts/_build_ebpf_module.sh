#!/bin/bash
set -euo pipefail

VMLINUX_DIR="$1"
EBPF_PROJ_DIR="$2"

# Install build deps
sudo apt-get update -qq
sudo apt-get install -y --no-install-recommends git clang llvm libelf-dev zlib1g-dev make pkg-config zstd curl

# Build bpftool
git clone --recurse-submodules https://github.com/libbpf/bpftool.git /tmp/bpftool-src
make -j$(nproc) -C /tmp/bpftool-src/src
BPFTOOL="/tmp/bpftool-src/src/bpftool"
$BPFTOOL version

# Find vmlinux
ZST_FILE=$(find "$VMLINUX_DIR" -type f -name "*.zst" | head -n 1)
if [ -z "$ZST_FILE" ]; then
    echo "No vmlinux.zst found in $VMLINUX_DIR" >&2
    exit 1
fi
zstd -d "$ZST_FILE" -o /tmp/vmlinux -f

# Generate vmlinux.h and build eBPF module
cd "$EBPF_PROJ_DIR"
mkdir -p output src
$BPFTOOL btf dump file /tmp/vmlinux format c > src/vmlinux.h
export BPFTOOL="$BPFTOOL"
bash tools/build_from_btf.sh

# Collect output zip
ZIP=$(find . .. -maxdepth 1 -name "*.zip" | head -n 1)
if [ -z "$ZIP" ]; then
    echo "No output zip found" >&2
    exit 1
fi
mv "$ZIP" output/ScenePortHider-eBPF.zip
