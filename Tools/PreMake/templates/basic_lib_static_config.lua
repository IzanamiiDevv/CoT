project_name = "MyStatic"
project(project_name)
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
    targetname "mystaticlib"

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