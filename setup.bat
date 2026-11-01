@echo off
title Setting Up ZPanel Environment
color 0b

echo [1/4] Creating ZPanel directory structure in Documents...

:: Navigate to Documents and create directories
cd /d "%USERPROFILE%\Documents"
if not exist "ZPanel" mkdir "ZPanel"
cd "ZPanel"

if not exist "Assets" mkdir "Assets"
if not exist "cache" mkdir "cache"
if not exist "dlls" mkdir "dlls"
if not exist "downloads" mkdir "downloads"
if not exist "files" mkdir "files"

echo [2/4] Writing .installed file...
(
    echo installed=2026-11-01T00:34:49
    echo images=1
    echo path=C:\Users\Jackson\Documents\ZPanel
) > ".installed"

echo [3/4] Writing folders.txt inside files folder...
(
    echo ZPanel folder map
    echo Assets\Images  = artwork shipped inside the exe
    echo downloads      = installed games
    echo dlls / files   = loader support files
    echo cache          = partial downloads (safe to delete)
    echo images         = 1
) > "files\folders.txt"

echo [4/4] Downloading EmberLoop.png into Assets folder...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/PEPSI-SYS/Images/main/EmberLoop.png' -OutFile 'Assets\EmberLoop.png'"

echo.
echo ========================================================
echo Setup complete! Everything is configured in your ZPanel.
echo ========================================================
pause