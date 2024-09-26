@echo off
title [ SIGMA MENU ] 
color 0A
setlocal enabledelayedexpansion

:: ASCII Art for the Sigma symbol and a bold header
:StartMenu
cls
echo  ███████╗██╗ ██████╗ ███╗   ███╗ █████╗ 
echo  ██╔════╝██║██╔════╝ ████╗ ████║██╔══██╗
echo  ███████╗██║██║  ███╗██╔████╔██║███████║
echo  ╚════██║██║██║   ██║██║╚██╔╝██║██╔══██║
echo  ███████║██║╚██████╔╝██║ ╚═╝ ██║██║  ██║
echo  ╚══════╝╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝
echo =========================================
echo        WELCOME TO THE SIGMA MENU          
echo =========================================
echo [1] - System Information
echo [2] - Disk Usage and Health (chkdsk)
echo [3] - Network Diagnostics (ping + traceroute)
echo [4] - IP Configuration and Details
echo [5] - View Task Manager Processes
echo [6] - Clear DNS Cache
echo [7] - System Shutdown
echo [8] - Exit SIGMA Menu
echo =========================================
set /p choice="Select an option [1-8]: "

if "%choice%"=="1" goto :SystemInfo
if "%choice%"=="2" goto :DiskUsage
if "%choice%"=="3" goto :NetworkDiagnostics
if "%choice%"=="4" goto :IPConfig
if "%choice%"=="5" goto :TaskManager
if "%choice%"=="6" goto :ClearDNS
if "%choice%"=="7" goto :ShutdownSystem
if "%choice%"=="8" goto :Exit

echo Invalid option. Try again.
pause
goto :StartMenu

:SystemInfo
cls
echo === SYSTEM INFORMATION ===
systeminfo
pause
goto :StartMenu

:DiskUsage
cls
echo === DISK USAGE AND HEALTH ===
echo Checking disk health and usage...
set /p drive="Enter the drive letter to check (e.g., C): "
chkdsk %drive%:
pause
goto :StartMenu

:NetworkDiagnostics
cls
echo === NETWORK DIAGNOSTICS ===
set /p ip="Enter the IP address or domain to ping: "
ping %ip%
echo Tracing route to %ip%...
tracert %ip%
pause
goto :StartMenu

:IPConfig
cls
echo === IP CONFIGURATION ===
ipconfig /all
pause
goto :StartMenu

:TaskManager
cls
echo === TASK MANAGER PROCESSES ===
tasklist
pause
goto :StartMenu

:ClearDNS
cls
echo === CLEAR DNS CACHE ===
ipconfig /flushdns
echo DNS Cache has been cleared successfully.
pause
goto :StartMenu

:ShutdownSystem
cls
echo === SYSTEM SHUTDOWN ===
echo WARNING: This will shut down the system immediately.
set /p confirm="Are you sure you want to shut down? (Y/N): "
if /i "%confirm%"=="Y" (
    shutdown /s /f /t 0
) else (
    echo Shutdown cancelled.
)
pause
goto :StartMenu

:Exit
cls
echo Exiting the Sigma Menu. Stay focused.
pause
exit
