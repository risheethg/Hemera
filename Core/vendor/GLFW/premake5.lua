project "GLFW"
	kind "StaticLib"
	language "C"
	warnings "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	-- Common files for all platforms
	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c", "src/init.c", "src/input.c", "src/monitor.c",
		"src/null_init.c", "src/null_joystick.c", "src/null_monitor.c", "src/null_window.c",
		"src/platform.c", "src/vulkan.c", "src/window.c"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "on"
		files { "src/win32*.c", "src/wgl_context.c", "src/egl_context.c", "src/osmesa_context.c" }
		defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }

	filter "system:linux"
		pic "On"
		files { "src/x11*.c", "src/xkb_unicode.c", "src/posix*.c", "src/glx_context.c", "src/egl_context.c", "src/osmesa_context.c", "src/linux_joystick.c" }
		defines { "_GLFW_X11" }

	filter "system:macosx"
		pic "On"
		files { "src/cocoa*.m", "src/cocoa_time.c", "src/nsgl_context.m", "src/posix_thread.c", "src/posix_module.c", "src/osmesa_context.c", "src/egl_context.c" }
		defines { "_GLFW_COCOA" }
		xcodebuildsettings { MACOSX_DEPLOYMENT_TARGET = "11.0" }
		links { "Cocoa", "IOKit", "CoreFoundation" }

	filter {} -- reset filter
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		runtime "Release"
		optimize "speed"