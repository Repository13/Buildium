@echo off
color 8
del /s /q "Clients\2012E\content\scripts\solo.lua"
title Roblox Server Tool 2012E
cls

echo Buildium Server tool (2012E) - Written by Disasterocks
echo.
echo 1. Solo

set /P OPTION="Please type the corresponding number and press ENTER: "
IF %OPTION%==1 GOTO :solo

:solo
cls
echo JOIN TOOL
echo.
dir maps /w /b
echo.
set /P MAP="Map Name (Do not add .rbxl to the end): "
echo Map set to %MAP%.
echo.
set /P NAME="Player name: "
echo Player name set to "%NAME%"
echo.

cd Clients/2012E
cd content/scripts
cls
echo game:Load('rbxasset://..\\..\\..\\maps\\%MAP%.rbxl') >solo.lua
echo local Player = game.Players:CreateLocalPlayer(0) >>solo.lua
echo Player.Name = "%NAME%" >>solo.lua
echo dofile('rbxasset://scripts/cores/BackpackScript.lua')  >>solo.lua
echo dofile('rbxasset://scripts/cores/BackpackBuilder.lua')  >>solo.lua
echo dofile('rbxasset://scripts/cores/BackpackResizer.lua')  >>solo.lua
echo dofile('rbxasset://scripts/cores/PlayerlistScript.lua')  >>solo.lua
echo dofile('rbxasset://scripts/cores/StarterScript.lua')  >>solo.lua
echo game:Load('rbxasset://gui.rbxm') >>solo.lua
echo game:Load('rbxasset://scripts/cores/libraries.rbxm') >>solo.lua
echo game:FindFirstChild("Backpack").Parent = game.StarterGui >>solo.lua
echo game:FindFirstChild("Dialogs").Parent = game.StarterGui >>solo.lua
echo game:FindFirstChild("HealthGUI").Parent = game.StarterGui >>solo.lua
echo game:FindFirstChild("Playerlist").Parent = game.StarterGui >>solo.lua
echo game:GetService("RunService"):run() >>solo.lua
echo Player:LoadCharacter() >>solo.lua
cd..
cd..
start BuildiumClient.exe -script "wait(); dofile('rbxasset://scripts\\solo.lua')"
sleep 5
exit