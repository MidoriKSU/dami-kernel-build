<div align="center">

# 🌀 Nezha KSU Workflow

![Android](https://img.shields.io/badge/Android-16-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![Kernel](https://img.shields.io/badge/Kernel-GKI_6.12.23-2F363D?style=for-the-badge&logo=linux&logoColor=white)
![Architecture](https://img.shields.io/badge/Arch-arm64--v8a-blue?style=for-the-badge)

*Automated GitHub Actions pipeline for building GKI kernels targeting the **Xiaomi 17 Series (Snapdragon 8 Elite Gen 5 / SM8850)**.*

</div>

---

## 🚀 Overview
This repository provides a highly modular, dispatcher-based workflow that builds multiple **KernelSU** variants from a single trigger. Each variant is fully isolated in its own workflow file, ensuring independent maintainability, simplified debugging, and seamless future scalability.

---

## 📱 Target Device Info

| Property | Specification |
| :--- | :--- |
| **Device** | Xiaomi 17 Series |
| **SoC** | Snapdragon 8 Elite Gen 5 (`SM8850`) |
| **Android** | Android 16 |
| **Kernel** | GKI `6.12.23` |
| **Architecture** | `arm64-v8a` |
| **Compiler** | LLVM Clang 19 (`r536225`) |
| **Rust** | `1.82.0` |

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

> [!TIP]
> **Matrix Build Magic:** Triggering the workflow with both `use_droidspaces` and `enable_susfs` options enabled will automatically leverage GitHub Actions matrix builds to compile and release all applicable standard, `-susfs`, and `-droidspaces` variants simultaneously (up to 6 variants in a single run!).