project_name = "MyProject"
workspace(project_name)
    configurations { "Release", "Debug", "PreProcess" }
    platforms { "Win32", "Win64" }
    defaultplatform "Win64"
    toolset "gcc"
    startproject(project_name)