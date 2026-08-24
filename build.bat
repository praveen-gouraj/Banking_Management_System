@echo off
setlocal
cd /d %~dp0
dir /s /b src\*.java > sources.txt
javac -cp "lib/*" "@sources.txt"
if errorlevel 1 (
    echo Build failed.
    exit /b 1
)
echo Build successful.
exit /b 0
