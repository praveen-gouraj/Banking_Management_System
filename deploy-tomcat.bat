@echo off
setlocal enabledelayedexpansion
cd /d %~dp0
set "TOMCAT_HOME=%~1"
if not defined TOMCAT_HOME set "TOMCAT_HOME=%CATALINA_HOME%"
if not defined TOMCAT_HOME set "TOMCAT_HOME=%TOMCAT_HOME%"
if exist target\classes rmdir /s /q target\classes
if exist target\war rmdir /s /q target\war
if exist target\banking-management-system.war del /q target\banking-management-system.war

mkdir target\classes >nul 2>nul
mkdir target\war\WEB-INF\classes >nul 2>nul
mkdir target\war\WEB-INF\lib >nul 2>nul

dir /s /b src\*.java > sources.txt
javac --release 11 -cp "lib/*" -d target\classes @sources.txt
if errorlevel 1 (
    echo Build failed.
    exit /b 1
)

xcopy web\* target\war\ /E /I /Y >nul
xcopy target\classes\* target\war\WEB-INF\classes\ /E /I /Y >nul
copy /Y lib\mysql-connector-j-9.6.0.jar target\war\WEB-INF\lib\ >nul

jar --create --file target\banking-management-system.war -C target\war .
if errorlevel 1 (
    echo WAR packaging failed.
    exit /b 1
)

if not defined TOMCAT_HOME (
    echo WAR created at target\banking-management-system.war
    echo Set TOMCAT_HOME or pass your Tomcat 9 folder as the first argument to deploy automatically.
    exit /b 0
)

if not exist "%TOMCAT_HOME%\webapps" (
    echo Tomcat webapps folder not found at "%TOMCAT_HOME%\webapps".
    exit /b 1
)

copy /Y target\banking-management-system.war "%TOMCAT_HOME%\webapps\" >nul
if errorlevel 1 (
    echo Failed to copy WAR into Tomcat.
    exit /b 1
)

echo Deployed WAR to "%TOMCAT_HOME%\webapps\banking-management-system.war"
echo Restart Tomcat 9 and open http://localhost:8080/banking-management-system/
