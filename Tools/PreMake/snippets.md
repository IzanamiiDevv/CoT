 # 📚 Collection of Useful `premake5.lua` Snippets

This page provides a curated set of essential and commonly used code snippets for defining and configuring C/C++ projects using **Premake5**. These examples aim to simplify project setup and streamline your build configuration process.

---

# 📋 List of Snippets

---

# **Project Startup:**

### Include it in your Porject By:
```cmd
curl https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/template_1.lua > premake5.lua
```


# **Project Snippets**:

## 🛠️ Basic Executable Configuration

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

### Include it in your Porject By:
```cmd
curl https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/basic_exe_config.lua > execonf.lua
```

---

## 📦 Shared Library Configuration (with Import Library)

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
### Include it in your Porject By:
```cmd
curl https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/basic_lib_static_config.lua > staticdll.lua
```

---

## 🧩 DLL for Windows API Manual Loading

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
### Include it in your Porject By:   
```cmd
curl https://raw.githubusercontent.com/IzanamiiDevv/CoT/refs/heads/main/Tools/PreMake/templates/basic_lib_dynamic_config.lua > dynamiclib.lua
```