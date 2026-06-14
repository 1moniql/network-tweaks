@echo off
:: Check if running as admin
fsutil dirty query %systemdrive% >nul
if %errorlevel% neq 0 (
    echo This script must be run as administrator.
    pause
    exit /b
)
:: NETSH winsock set autotuning off
NETSH interface teredo set state disabled
NETSH interface 6to4 set state disabled
NETSH int isatap set state disable
NETSH int ip set global taskoffload=disabled
NETSH int tcp set global chimney=enabled
NETSH int tcp set global timestamps=disabled
NETSH int tcp set heuristics disabled
NETSH int tcp set security mpp=disabled
NETSH int tcp set security profiles=enabled
NETSH int tcp set global congestionprovider=default
NETSH int tcp set global autotuninglevel=normal
NETSH int tcp set global ecncapability=disabled
NETSH int tcp set global rss=enabled
NETSH int tcp set global dca=enabled
NETSH int tcp set global netdma=enabled

netsh int ip reset 
netsh winsock reset 

powershell Set-NetTCPSetting -SettingName "*" -ForceWS Enabled

for /f "usebackq delims=" %%i in (`
  powershell -NoProfile -Command "Get-NetAdapter | Select-Object -ExpandProperty InterfaceGuid"
`) do (
  reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /f >nul 2>&1
  reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /f >nul 2>&1
  reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /f >nul 2>&1
)
