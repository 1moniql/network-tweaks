@echo off
:: Check if running as admin
fsutil dirty query %systemdrive% >nul
if %errorlevel% neq 0 (
    echo This script must be run as administrator.
    pause
    exit /b
)
setlocal enableextensions
title MADE BY Sviat#2430 SPECIALLY FOR FoxOS
cd /d "%~dp0"

echo.
echo                        NOT FOR SELL OR COPYRIGHT
echo.
echo.
echo        This script improves ur network latency, hitreg and speed
echo.
for /f "tokens=*" %%i in ('powershell -Command "Get-NetAdapter | Select-Object -ExpandProperty InterfaceGuid"') do (
    reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
)
:: netsh winsock set autotuning on >nul 2>&1

netsh int ip set global neighborcachelimit=4096 >nul 2>&1
@REM netsh int ip set global routecachelimit=4096 >nul 2>&1
netsh int ip set global sourceroutingbehavior=drop >nul 2>&1
:: Security concerns
netsh int ip set global taskoffload=enabled >nul 2>&1
netsh int ip set global dhcpmediasense=disabled >nul 2>&1
netsh int ip set global mediasenseeventlog=disabled >nul 2>&1
:: netsh int ip set global mldlevel=none >nul 2>&1 @REM breaks OBS NDI
netsh int ip set global icmpredirects= disabled >nul 2>&1
:: Disable ICMP Redirects for security
:: netsh int ip set global randomizeidentifiers= disabled >nul 2>&1 less secure
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=disabled >nul 2>&1
netsh int tcp set global rsc=disabled >nul 2>&1
netsh int tcp set global maxsynretransmissions=2 >nul 2>&1
netsh int tcp set global timestamps=enabled >nul 2>&1
netsh int tcp set global ecncapability=enabled >nul 2>&1
:: netsh int tcp set global congestionprovider=ctcp >nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1

netsh interface teredo set state disabled >nul 2>&1
netsh int isatap set state disable >nul 2>&1
netsh int ipv6 isatap set state disabled >nul 2>&1
netsh int ipv6 6to4 set state disabled >nul 2>&1
netsh interface IPV6 set global randomizeidentifier=disabled >nul 2>&1
netsh interface IPV6 set privacy state=disabled >nul 2>&1
netsh int ipv6 set global dhcpmediasense=disabled >nul 2>&1
netsh int ipv6 set global icmpredirects= disabled >nul 2>&1
netsh int ipv6 set global sourceroutingbehavior=drop >nul 2>&1
:: Disables Temp Address creation

for /f "tokens=1" %%i in ('netsh int ip show interfaces ^| findstr [0-9]') do set INTERFACE=%%i >nul 2>&1
netsh int ip set interface %INTERFACE% dadtransmits=1 routerdiscovery=disabled store=persistent >nul 2>&1
netsh interface ipv4 set global loopbackworkercount=4 >nul 2>&1
:: netsh int tcp set global initialRto=2000 >nul 2>&1

netsh int tcp set heuristics disabled >nul 2>&1
netsh int tcp set heuristics wsh=disabled >nul 2>&1

netsh int tcp set security mpp=disabled >nul 2>&1
netsh int tcp set security profiles=disabled >nul 2>&1

netsh int ipv4 set dynamicport tcp start=1025 num=64511 >nul 2>&1
netsh int ipv4 set dynamicport udp start=1025 num=64511 >nul 2>&1

powershell Set-NetTCPSetting -SettingName "*" -ForceWS Disabled >nul 2>&1