project_name = "MyDynamic"
project "winapi_dll"
    kind "SharedLib"
    language "C"
    cdialect "C17"
    targetname "mydynamiclib"

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