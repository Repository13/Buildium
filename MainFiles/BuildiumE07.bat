@echo off
color 6
del /s /q "Clients\2007E\content\scripts\host.lua"
del /s /q "Clients\2007E\content\scripts\join.lua"
del /s /q "Clients\2007E\content\scripts\solo.lua"
title Roblox Server Tool 2007E
cls

echo Buildium Server tool (2007E) - Written by Disasterocks
echo.
echo 1. Host
echo 2. Join

set /P OPTION="Please type the corresponding number and press ENTER: "
IF %OPTION%==1 GOTO :host
IF %OPTION%==2 GOTO :join

:join
cls
echo WARNING: 2007 CLIENTS ARE KNOWN TO BE VERY INSECURE!
echo ONLY PLAY ON SERVERS YOU TRUST!
pause
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

cd Clients\2007E
cd content/scripts
cls
echo local server = "%IP%" >join.lua
echo local serverport = %SERVPORT% >>join.lua
echo local clientport = 0 >>join.lua
echo local playername = "%NAME%" >>join.lua
echo.  >>join.lua
echo function dieerror(errmsg) >>join.lua
echo game:SetMessage(errmsg) >>join.lua
echo wait(math.huge) >>join.lua
echo end >>join.lua
echo.  >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo client = game:service("NetworkClient") >>join.lua
echo player = game:service("Players"):createLocalPlayer(%ID%) >>join.lua
echo player.Name = playername >>join.lua
echo game:service("Visit") >>join.lua
echo end) >>join.lua
echo.  >>join.lua
echo if not suc then >>join.lua
echo dieerror(err) >>join.lua
echo end >>join.lua
echo.  >>join.lua
echo function connected(url, replicator) >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo local marker = replicator:SendMarker() >>join.lua
echo end) >>join.lua
echo if not suc then >>join.lua
echo dieerror(err) >>join.lua
echo end >>join.lua
echo marker.Recieved:wait() >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo game:clearMessage() >>join.lua
echo end) >>join.lua
echo if not suc then >>join.lua
echo dieerror(err) >>join.lua
echo end >>join.lua
echo end >>join.lua
echo.  >>join.lua
echo function rejected() >>join.lua
echo dieerror("Rejected by the server.") >>join.lua
echo end >>join.lua
echo.  >>join.lua
echo function failed(peer, errcode, why) >>join.lua
echo dieerror("Failed [".. peer.. "], ".. errcode.. ": ".. why) >>join.lua
echo end >>join.lua
echo.  >>join.lua
echo local suc, err = pcall(function() >>join.lua
echo client.ConnectionAccepted:connect(connected) >>join.lua
echo client.ConnectionRejected:connect(rejected) >>join.lua
echo client.ConnectionFailed:connect(failed) >>join.lua
echo client:connect(server, serverport, clientport, 20) >>join.lua
echo end) >>join.lua
echo.  >>join.lua
echo if not suc then >>join.lua
echo local x = Instance.new("Message") >>join.lua
echo x.Text = err >>join.lua
echo x.Parent = workspace >>join.lua
echo wait(math.huge) >>join.lua
echo end >>join.lua
echo.  >>join.lua
echo while true do >>join.lua
echo wait(0.001) >>join.lua
echo replicator:SendMarker() >>join.lua
echo end >>join.lua
cd..
cd..
cd..
cd..
cls
Clients\2007E\BuildiumClient -script "Clients\2007E\content\scripts\join.lua"
pause
exit

:host
cls
echo WARNING: 2007 CLIENTS ARE KNOWN TO BE VERY INSECURE!
echo ONLY PLAY ON SERVERS YOU TRUST!
pause
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

cd Clients\2007E
cd content/scripts
cls
echo Port = %PORT% >host.lua
echo Server = game:service("NetworkServer") >>host.lua
echo.  >>host.lua
echo. >>host.lua
echo. >>host.lua
echo HostService = game:service("RunService")Server:start(Port,20) >>host.lua
echo game:service("RunService"):run() >>host.lua
echo. >>host.lua
echo print("Server started on port "..Port) >>host.lua
echo. >>host.lua
echo function onJoined(NewPlayer) >>host.lua
echo NewPlayer:LoadCharacter(true) >>host.lua
echo TorsoColor = BrickColor.Random() >>host.lua
echo NewPlayer.Character.Torso.BrickColor = TorsoColor >>host.lua
echo while wait() do >>host.lua
echo if NewPlayer.Character.Humanoid.Health == 0 then >>host.lua
echo wait(5) >>host.lua
echo NewPlayer:LoadCharacter(true) >>host.lua
echo NewPlayer.Character.Torso.BrickColor = TorsoColor >>host.lua
echo elseif NewPlayer.Character.Parent == nil then >>host.lua
echo wait(5) >>host.lua
echo NewPlayer:LoadCharacter(true) >>host.lua
echo NewPlayer.Character.Torso.BrickColor = TorsoColor >>host.lua
echo end >>host.lua
echo end >>host.lua
echo end >>host.lua
echo game.Players.PlayerAdded:connect(onJoined) >>host.lua
cd..
cd..
cd..
cd..
cls
Clients\2007E\BuildiumClient -script "Clients\2007E\content\scripts\host.lua" "maps\%MAP%.rbxl"
sleep 5
exit