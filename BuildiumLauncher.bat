@echo off
title Buildium Launcher
color 3
cd MainFiles
cls

echo Welcome to the Buildium Launcher!
echo Which client would you like to use?
echo.
echo 1. 2007E (March 2007)
echo 2. 2007M (August 2007)
echo 3. 2008L (November 2008)
echo 4. 2009L (October 2009)
echo 5. 2011E (February 2011)
echo 6. 2012E (April 2012 - SOLO ONLY)
echo.
set /p VERSION="Please type the number corresponding to the version: "
if %VERSION%==1 goto :MAR07
if %VERSION%==2 goto :AUG07
if %VERSION%==3 goto :NOV08
if %VERSION%==4 goto :OCT09
if %VERSION%==5 goto :FEB11
if %VERSION%==6 goto :APR12

:MAR07
cls
BuildiumE07.bat

:AUG07
cls
BuildiumM07.bat

:NOV08
cls
BuildiumL08.bat

:OCT09
cls
BuildiumL09.bat

:FEB11
cls
BuildiumE11.bat

:APR12
cls
BuildiumE12.bat