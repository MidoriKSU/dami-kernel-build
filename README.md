# Nezha KSU Workflow
Automated GitHub Actions pipeline for building GKI kernels targeting the **Xiaomi 17 Series (Snapdragon 8 Elite Gen 5 / SM8850)** on Android 16.
---
## 🚀 Overview
This repository provides a modular, dispatcher-based workflow that builds multiple KernelSU variants from a single trigger. Each variant is fully isolated in its own workflow file, ensuring independent maintainability, easier debugging, and seamless future scalability.
---
## 📱 Target Device Info

| Property | Value |
| :--- | :--- |
| **Device** | Xiaomi 17 Series |
| **SoC** | Snapdragon 8 Elite Gen 5 (SM8850) |
| **Android** | Android 16 |
| **Kernel** | GKI 6.12.23 |
| **Architecture** | arm64 |
| **Compiler** | LLVM Clang 19 (r536225) |
| **Rust** | 1.82.0 |

---
## 📦 Build Variants

| Variant | Source | SuSFS | Docker |
| :--- | :--- | :--- | :--- |
| `MidoriSU` | [midori01/KernelSU](https://github.com/midori01/KernelSU) | ❌ | ❌ |
| `MidoriSU-Droidspaces` | [midori01/KernelSU](https://github.com/midori01/KernelSU) | ❌ | ✅ |
| `MidoriSU-SuSFS` | [midori01/KernelSU](https://github.com/midori01/KernelSU) | ✅ | ❌ |
| `MidoriSU-SuSFS-Droidspaces` | [midori01/KernelSU](https://github.com/midori01/KernelSU) | ✅ | ✅ |
| `MidoriXX` | [MidoriKSU/KernelSU](https://github.com/MidoriKSU/KernelSU) | ❌ | ❌ |
| `MidoriXX-Droidspaces` | [MidoriKSU/KernelSU](https://github.com/MidoriKSU/KernelSU) | ❌ | ✅ |

> **💡 Tip**: Triggering the workflow with the `use_droidspaces` and `enable_susfs` options enabled will automatically leverage matrix builds to compile and release all applicable standard, `-susfs`, and `-droidspaces` variants simultaneously (up to 6 variants in a single run).
