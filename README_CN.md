# RecastNavigation for Unity3D

[English](README.md) | 中文

本项目将 [RecastNavigation](https://github.com/recastnavigation/recastnavigation) 接入 Unity3D，提供从导航网格生成、运行时寻路到编辑器预览的一套完整示例。

GitHub Actions 可一键构建 Windows、macOS、Linux、Android 和 iOS 平台所需的原生库；仓库同时附带 Unity 示例工程，便于直接体验和接入。

## 功能

- 支持在 Unity 中按配置生成 Recast 导航网格。
- 支持在 Unity Editor 中预览 Recast 寻路网格。
- 支持运行时动态障碍物。
- 支持基于 DetourCrowd 的动态人群避障。
- 提供 Unity 示例场景及 C++ 测试工程。
- 通过 GitHub Actions 构建多平台原生插件。

## 快速开始

1. 使用 Unity 打开 `RecastCustom/RecastUnity` 工程。
2. 在 `Assets/Examples` 中打开示例场景。
3. 示例脚本位于 `Assets/Examples/Tester`，包括基础寻路、动态障碍物和人群避障。

有关 Unity 集成、原生库和构建工程的详细目录，请参见 [RecastCustom/README.md](RecastCustom/README.md)。

## 目录说明

| 目录 | 说明 |
| --- | --- |
| `RecastCustom/NavMeshExport` | 导航网格生成与预览库，供 Unity Editor 使用。 |
| `RecastCustom/NavMeshExportTester` | `NavMeshExport` 的 C++ 测试工程。 |
| `RecastCustom/RecastDll` | RecastNavigation 运行时库，供 Unity Runtime 使用。 |
| `RecastCustom/RecastDllTester` | `RecastDll` 的 C++ 测试工程。 |
| `RecastCustom/RecastUnity` | 包含原生库与使用示例的 Unity 工程。 |
| `.github/workflows/Build_RecastDll.yaml` | 多平台原生库构建工作流。 |

## GitHub Actions

| 工作流 | 触发方式 | 用途 |
| --- | --- | --- |
| `Build.yaml` | 推送或拉取请求 | 在 Windows、macOS、Linux 上使用 Premake 和 CMake 构建项目。 |
| `Tests.yaml` | 推送或拉取请求 | 在 Windows、macOS、Linux 上构建并运行单元测试。 |
| `Docs.yaml` | 推送至 `main` 分支 | 使用 Doxygen 生成文档并部署到 `gh-pages` 分支。 |
| `Build_RecastDll.yaml` | 手动触发 | 构建 Unity 所需的多平台原生插件，并创建 GitHub Release。 |

### 发布 Unity 原生库

1. 在 GitHub 仓库的 **Actions** 页面选择 `build_recastdll` 工作流。
2. 点击 **Run workflow**，填写发布标签，例如 `v1.0.0`。
3. 工作流会构建 Windows、macOS、Linux、Android 和 iOS 库，并将结果打包为以下 Release 附件：
   - `recastdll_<tag>.tgz`：Unity 运行时使用的 RecastDll 插件。
   - `navmeshexport_<tag>.tgz`：Unity Editor 使用的 NavMeshExport 插件。

工作流使用新版 Artifact Actions；各平台任务会分别上传产物，发布任务随后合并下载并打包，以兼容 Artifact 不可变的行为。

## 许可证

Recast & Detour 使用 [zlib 许可证](License.txt)。
