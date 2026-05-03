# Nezha KSU Workflow

Automated GitHub Actions pipeline for building GKI kernels targeting the **Xiaomi Snapdragon 8 Elite Gen 5 (SM8850)** devices on Android 16.

---

## Overview

This repository provides a modular, dispatcher-based workflow that builds multiple KernelSU variants from a single trigger. Each variant is fully isolated in its own workflow file, making it easy to debug, maintain, and extend independently.

---

## Device

| Property | Value |
|----------|-------|
| Device | Xiaomi 17 Series |
| SoC | Snapdragon 8 Elite Gen 5 (SM8850) |
| Android | 16 |
| Kernel | GKI 6.12.23 |
| Architecture | arm64 |
| Compiler | LLVM Clang 19 (r536225) |
| Rust | 1.82.0 |

---

## Variants

| Variant | Source | SuSFS |
|---------|----------------|-------|
| `MidoriSU-SuSFS` | [midori01/KernelSU](https://github.com/midori01/KernelSU) | ✅ |
| `MidoriSU` | [midori01/KernelSU](https://github.com/midori01/KernelSU) | ❌ |
| `MidoriXX` | [MidoriKSU/KernelSU](https://github.com/MidoriKSU/KernelSU) | ❌ |
