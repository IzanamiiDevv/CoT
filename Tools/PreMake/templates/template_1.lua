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