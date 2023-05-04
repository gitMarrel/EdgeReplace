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
echo 1
echo %1
echo ----------------------------------------
echo 2
echo %2
echo ---------------------------------------- 
echo 3
echo %3
echo ---------------------------------------- 
echo 4
echo %4
echo ---------------------------------------- 
echo 5
echo %5
echo ---------------------------------------- 
echo 6
echo %6
echo ---------------------------------------- 


set _teststr=%4

if /i "%_teststr:~0,4%"=="http" goto paramfour 



:paramthreefour
echo 34
echo ---------------------------------------------------
set _stri="%3=%4"
set dd=":"
set _url=!_stri:microsoft-edge:=!

goto startff

:paramfour

set _stri=%4
echo %_stri%
set _url=!_stri:%%3A=:!
set _url=!_url:%%2F=/!
set _url=!_url:%%3F=\?!
set _url=!_url:%%3D=^=!
set _url=!_url:%%26=^&!
goto startff



:startff
@echo on

echo "%_url%"
start "" "C:\Program Files\Mozilla Firefox\firefox.exe" "%_url%"

rem pause
