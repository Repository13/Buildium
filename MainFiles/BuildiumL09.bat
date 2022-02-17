@echo off

color 7
del /s /q "Clients\2009L\content\scripts\host.lua"
del /s /q "Clients\2009L\content\scripts\join.lua"
del /s /q "Clients\2009L\content\scripts\solo.lua"
title Roblox Server Tool 2009L
cls

echo Buildium Server tool (2009L) - Written by Disasterocks
echo.
echo 1. Host
echo 2. Join

set /P OPTION="Please type the corresponding number and press ENTER: "
IF %OPTION%==1 GOTO :host
IF %OPTION%==2 GOTO :join

:join
cls
echo JOIN TOOL
set /P IP="Server IP (localhost if you join your own server): "
echo IP set to %IP%
echo.
set /P SERVPORT="Server port: "
echo Port set to %SERVPORT%
echo.
set /P NAME="Player name: "
echo Player name set to "%NAME%"
echo.
set /P ID="Player ID: "
echo Player ID set to %ID%
echo.
set /P SAFECHAT="Safechat? (true/false case sensetive): "
echo Safechat set to %SAFECHAT%
echo.

cd Clients\2009L
cd content/scripts
cls
echo Creating join script on IP %IP% and port %SERVPORT%...
echo local server = ('%IP%') >join.lua
echo local serverport = (%SERVPORT%) >>join.lua
echo local clientport = (0) >>join.lua
echo. >>join.lua
echo function dieerror(errmsg) >>join.lua
echo game:GetMessage(errmsg) >>join.lua
echo wait(math.huge) >>join.lua
echo end >>join.lua
echo. >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo client = game:GetService("NetworkClient") >>join.lua
echo player = game:GetService("Players"):CreateLocalPlayer(%ID%) >>join.lua
echo	Instance.new("Visit").Parent = game >>join.lua
echo player:SetSuperSafeChat(%SAFECHAT%) >>join.lua
echo player.Name = "%NAME%" >>join.lua
echo end) >>join.lua
echo. >>join.lua
echo if not suc then >>join.lua
echo dieerror(err) >>join.lua
echo end >>join.lua
echo. >>join.lua
echo function connected(url, replicator) >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo dofile("rbxasset://scripts\\FixAssetLinks.lua") >>join.lua
echo local marker = replicator:SendMarker() >>join.lua
echo end) >>join.lua
echo. >>join.lua
echo if not suc then >>join.lua
echo dieerror(err) >>join.lua
echo end >>join.lua
echo marker.Recieved:wait() >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo. >>join.lua
echo end) >>join.lua
echo if not suc then >>join.lua
echo dieerror(err) >>join.lua
echo end >>join.lua
echo end >>join.lua
echo. >>join.lua
echo function rejected() >>join.lua
echo dieerror("You have been rejected from the server.") >>join.lua
echo end >>join.lua
echo. >>join.lua
echo function failed(peer, errcode, why) >>join.lua
echo dieerror("Failed ["..peer.."], "..errcode..": "..why) >>join.lua
echo end >>join.lua
echo. >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo client.ConnectionAccepted:connect(connected) >>join.lua
echo client.ConnectionRejected:connect(rejected) >>join.lua
echo client.ConnectionFailed:connect(failed) >>join.lua
echo client:Connect(server, serverport, clientport, 20) >>join.lua
echo end) >>join.lua
echo. >>join.lua
echo if not suc then >>join.lua
echo local x = Instance.new("Message") >>join.lua
echo x.Text = err >>join.lua
echo x.Parent = workspace >>join.lua
echo wait(math.huge) >>join.lua
echo end >>join.lua
cd..
cd..
start BuildiumClient.exe -script "wait(); dofile('rbxasset://scripts\\join.lua')"
sleep 5
exit

:host
cls
echo HOST TOOL
echo MAPS:
echo.
dir "maps" /w /b
echo.
SET /P MAP="Please select a map (Don't add the .rbxl to the end!): "
echo Selected map = %MAP%
echo.
SET /P PORT="Please type in the server port (Default: 53640): "

cd Clients\2009L
cd content/scripts
cls
echo Creating server on port %PORT%
echo Creating host script...
echo.
echo game:Load('rbxasset://..\\..\\..\\maps\\%MAP%.rbxl') >host.lua
echo port = (%PORT%) >>host.lua
echo server = game:getService('NetworkServer') >>host.lua
echo runGame = game:getService('RunService') >>host.lua
echo runGame:run() >>host.lua
echo server:start(port, 20) >>host.lua
echo dofile('rbxasset://scripts\\FixAssetLinks.lua') >>host.lua
echo.
echo function onJoined(newPlayer) >>host.lua
echo TorsoColor = BrickColor.Random() >>host.lua
echo print "A player has joined the game" >>host.lua
echo newPlayer:LoadCharacter() >>host.lua
echo newPlayer.Character.Torso.BrickColor = TorsoColor >>host.lua
echo while true do >>host.lua
echo wait(0.01) >>host.lua
echo local humanoid = newPlayer.Character:FindFirstChild("Humanoid") >>host.lua
echo if(humanoid.Health == 0) then >>host.lua
echo wait(5) >>host.lua
echo newPlayer:LoadCharacter(); >>host.lua
echo newPlayer.Character.Torso.BrickColor = TorsoColor >>host.lua
echo.
echo.
echo.
echo end >>host.lua
echo end >>host.lua
echo end >>host.lua
echo. >>host.lua
echo game.Players.PlayerAdded:connect(onJoined) >>host.lua
cd..
cd..
start BuildiumClient.exe -script "wait(); dofile('rbxasset://scripts\\host.lua')"
echo Server started on port %PORT% and map %MAP%
sleep 5
exit