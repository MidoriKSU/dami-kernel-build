#!/bin/bash
set -e

VMLINUX_DIR="$1"
EBPF_PROJ_DIR="$2"

sudo apt-get update -qq
sudo apt-get install -y --no-install-recommends git clang llvm libelf-dev zlib1g-dev make pkg-config zstd curl
git clone --recurse-submodules https://github.com/libbpf/bpftool.git /tmp/bpftool-src
make -j$(nproc) -C /tmp/bpftool-src/src
BPFTOOL="/tmp/bpftool-src/src/bpftool"
$BPFTOOL version
ZST_FILE=$(find "$VMLINUX_DIR" -type f -name "*.zst" | head -n 1)
if [ -z "$ZST_FILE" ]; then
    exit 1
fi
zstd -d "$ZST_FILE" -o /tmp/vmlinux -f
cd "$EBPF_PROJ_DIR"
mkdir -p output src
$BPFTOOL btf dump file /tmp/vmlinux format c > src/vmlinux.h
export BPFTOOL="$BPFTOOL"
bash tools/build_from_btf.sh
if [ -f hideSceneport_module.zip ]; then
    mv hideSceneport_module.zip output/ScenePortHider-eBPF.zip
elif [ -f ../hideSceneport_module.zip ]; then
    mv ../hideSceneport_module.zip output/ScenePortHider-eBPF.zip
else
    ANY_ZIP=$(find . .. -maxdepth 1 -name "*.zip" | head -n 1)
    if [ -n "$ANY_ZIP" ]; then
        mv "$ANY_ZIP" output/ScenePortHider-eBPF.zip
    else
        exit 1
    fi
fi
