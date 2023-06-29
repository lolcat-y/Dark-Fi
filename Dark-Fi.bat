@echo off

REM Script created by ovmjesus
REM Discord: ovmjesus
REM Instagram: officialovmjesus
REM GitHub: lolcat-y

netsh wlan show networks mode=Bssid > wifi_networks.txt

echo List of nearby Wi-Fi networks:
type wifi_networks.txt

set /p selected_ssid=Enter the name of the Wi-Fi network: 

netsh wlan show profile name="%selected_ssid%" key=clear > wifi_password.txt

for /f "tokens=2 delims=:" %%i in ('findstr /c:"Key Content" wifi_password.txt') do (
    set wifi_password=%%i
)

if defined wifi_password (
    echo Password for Wi-Fi network '%selected_ssid%': %wifi_password%
) else (
    echo Unable to retrieve the Wi-Fi password.
)

pause

del wifi_networks.txt
del wifi_password.txt
