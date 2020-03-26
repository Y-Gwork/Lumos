require 'Scripts/premake-ios'
require 'Scripts/premake-defines'
require 'Scripts/premake-common'

workspace "Lumos"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Production"
	}

	startproject "Sandbox"

	location "build"

	targetdir ("bin/%{cfg.longname}/")
	objdir ("bin-int/%{cfg.longname}/obj/")

	group "Dependencies"
		require("Dependencies/Box2D/premake5")
		require("Dependencies/lua/premake5")
		require("Dependencies/imgui/premake5")
		filter "system:not ios"
			require("Dependencies/glfw/premake5")
		filter()
	group ""

	require("Lumos/premake5")
	require("Sandbox/premake5")

	filter()

newaction
{
	trigger     = "clean",
	description = "clean the software",
	execute     = function ()
		print("clean the build...")
		os.rmdir("./build")
		os.rmdir("./bin")
		os.rmdir("./bin-int")
		print("done.")
	end
}