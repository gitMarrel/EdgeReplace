rem   EdgeReplace-Script
rem   Copyright (C) 2023  Marcel Krepinsky
rem   This program is free software: you can redistribute it and/or modify
rem   it under the terms of the GNU Affero General Public License as published
rem   by the Free Software Foundation, either version 3 of the License, or
rem   (at your option) any later version.
rem 
rem   This program is distributed in the hope that it will be useful,
rem   but WITHOUT ANY WARRANTY; without even the implied warranty of
rem   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem   GNU Affero General Public License for more details.
rem 
rem   You should have received a copy of the GNU Affero General Public License
rem   along with this program.  If not, see <https://www.gnu.org/licenses/>.
rem -------------------------------------------------------------------------


@echo off
setlocal enabledelayedexpansion

:: Output Paramneters for Debugging/Development purposes
echo 1 %1
echo ----------------------------------------
echo 2 %2
echo ---------------------------------------- 
echo 3 %3
echo ---------------------------------------- 
echo 4 %4
echo ---------------------------------------- 
echo 5 %5
echo ---------------------------------------- 
echo 6 %6
echo ---------------------------------------- 


:: Depending of how edge gets called (Link/Startmenu or F1-Help) there are two different ways the parameters can be arranged.
:: This tests for an "http" at the start of Parameter 4 to distinguish the two variants.
set _teststr=%4
if /i "%_teststr:~0,4%"=="http" goto paramfour 



:paramthreefour
:: This is how the F1-help calls Edge
:: Parameter 3 contains the base url and parameter 4 the LinkId
:: Just remove the "microsoft-edge:"-prefix and put an equals  between %3 and %4 to get the final link
echo Variant: Param34
echo ---------------------------------------------------
set _stri="%3=%4"
set _url=!_stri:microsoft-edge:=!

goto startff

:paramfour
:: This is how the start menu or the new (horrible) Outlook links operate.
:: Here the entire URL can be found in parameter 3, you just have to reverse the escaping, which is not easily possible in batch, but can be done using powershell.
echo Variant: Param3
echo ---------------------------------------------------

set _stri=%4

for /f "delims=" %%a in ('powershell -Executionpolicy Bypass -Command "[System.Net.WebUtility]::UrlDecode('%_stri%')"') DO set "_url=%%a"

goto startff



:startff
@echo on

echo "%_url%"
start "" "C:\Program Files\Mozilla Firefox\firefox.exe" "%_url%"

:: Uncomment the "pause" to leave the cmd window open and see how the parameters are put together
:: pause