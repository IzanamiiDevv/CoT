# 📚 **Collection of Useful `premake5.lua` Snippets**

Welcome to the **CoT Premake5 Snippet Library** — a curated collection of reusable and essential snippets to help you configure C/C++ projects using **Premake5**. These examples cover common project types including executables, static/shared libraries, and Windows API DLLs.

> 🛠️ All templates are plug-and-play. Just download, customize, and build.

---

## 📋 **Available Snippets**

* 🔹 [Single Application Starter](#-project-startup)
* 🔹 [Basic Executable](#-️-basic-executable-configuration)
* 🔹 [Shared Library (with import .a)](#-shared-library-configuration-with-import-library)
* 🔹 [Windows DLL for Manual Loading](#-dll-for-windows-api-manual-loading)

---

## 🚀 **Project Startup**

A full-featured **starter template** for a C project with platform and configuration filters already defined.

```lua
project_name = "MyProject"

workspace(project_name)
    configurations { "Release", "Debug", "PreProcess" }
    platforms { "Win32", "Win64" }
    defaultplatform "Win64"
    toolset "gcc"
    startproject(project_name)

project(project_name)
    kind "ConsoleApp"
    language "C"
    cdialect "C17"

    files { "main.c", "scr/**.c", "incl/**.h" }
    includedirs { "incl" }

    filter "platforms:Win32"
        system "windows"
        architecture "x86"

    filter "platforms:Win64"
        system "windows"
        architecture "x86_64"

    filter "configurations:Release"
        optimize "On"
        runtime "Release"
        targetdir "bin/%{cfg.platform}/Release"
        objdir "obj/%{cfg.platform}/Release"

    filter "configurations:Debug"
        symbols "On"
        runtime "Release"
        targetdir "bin/%{cfg.platform}/Release"
        objdir "obj/%{cfg.platform}/Release"
```

### 📦 Download the Template:

```sh
curl -O https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/template_1.lua
```

---

## 🛠️ **Basic Executable Configuration**

A simplified version of the startup project, useful for smaller applications or when integrating into a larger workspace.

```lua
project_name = "MyProject"

project(project_name)
    kind "ConsoleApp"
    language "C"
    cdialect "C17"

    files { "main.c", "scr/**.c", "incl/**.h" }
    includedirs { "incl" }

    filter "platforms:Win32"
        system "windows"
        architecture "x86"

    filter "platforms:Win64"
        system "windows"
        architecture "x86_64"

    filter "configurations:Release"
        optimize "On"
        runtime "Release"
        targetdir "bin/%{cfg.platform}/Release"
        objdir "obj/%{cfg.platform}/Release"

    filter "configurations:Debug"
        symbols "On"
        runtime "Release"
        targetdir "bin/%{cfg.platform}/Release"
        objdir "obj/%{cfg.platform}/Release"
```

### 📦 Download the Template:

```sh
curl -O https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/basic_exe_config.lua
```

---

## 📦 **Shared Library Configuration (with Import Library)**

Generates a `.dll` file with an accompanying `.a` import library on Windows. Useful for dynamic linking scenarios.

```lua
project_name = "MyLibShared"

project(project_name)
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
    targetname "mylibshared"

    files { "lib/error.cpp", "include/**.h" }
    includedirs { "include" }

    filter "system:windows"
        targetextension ".dll"
        linkoptions { "-Wl,--out-implib,liberror.a" }

    filter "configurations:Debug"
        symbols "On"
        runtime "Debug"
        targetdir "bin/%{cfg.platform}/Debug"
        objdir "obj/%{cfg.platform}/Debug"

    filter "configurations:Release"
        optimize "On"
        runtime "Release"
        targetdir "bin/%{cfg.platform}/Release"
        objdir "obj/%{cfg.platform}/Release"
```

### 📦 Download the Template:

```sh
curl -O https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/basic_lib_static_config.lua
```

---

## 🧩 **DLL for Windows API Manual Loading**

Ideal for plugin-based systems or when loading DLLs manually using `LoadLibrary`.

```lua
project "winapi_dll"
    kind "SharedLib"
    language "C"
    cdialect "C17"
    targetname "myplugin"

    files { "src/**.c", "include/**.h" }
    includedirs { "include" }

    filter "system:windows"
        systemversion "latest"
        defines { "WIN32_LEAN_AND_MEAN" }
        targetextension ".dll"

    filter "configurations:Debug"
        symbols "On"
        runtime "Debug"
        targetdir "bin/%{cfg.platform}/Debug"
        objdir "obj/%{cfg.platform}/Debug"

    filter "configurations:Release"
        optimize "On"
        runtime "Release"
        targetdir "bin/%{cfg.platform}/Release"
        objdir "obj/%{cfg.platform}/Release"
```

### 📦 Download the Template:

```sh
curl -O https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/basic_lib_dynamic_config.lua
```

---

## 🧠 **Tips**

* Always match your platform (`Win32`, `Win64`) with your build tools.
* You can add more `filter` sections to fine-tune builds for Linux, macOS, or custom build flags.
* Use the `startproject("YourMainApp")` inside the workspace if multiple projects exist.

---

## 🙌 **Credits & Contributions**

Created by **[@IzanamiiDevv](https://github.com/IzanamiiDevv)**
Maintained under the **[C++ of Things (CoT)](https://github.com/IzanamiiDevv/CoT)** initiative.

> Want to contribute more templates? [Open a pull request](https://github.com/IzanamiiDevv/CoT)!