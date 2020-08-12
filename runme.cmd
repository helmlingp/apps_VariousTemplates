@echo off
SETLOCAL
set ppkg=3e2d9b01-299a-4b53-a99a-2c30a4b3c82b.ppkg
set unattend=unattend_cn947_fulcrum.xml

mkdir c:\temp
cd /d %~dp0
copy %ppkg% c:\temp
copy %unattend% c:\temp
copy VMwareWS1ProvisioningTool.exe c:\temp
copy VMwareWS1ProvisioningTool.exe.config c:\temp

cd /d c:\temp
VMwareWS1ProvisioningTool.exe -a full -p %ppkg% -u %unattend% -q

:NOTCOMPLETE
REM Check if SYSPREP has completed successfully
SETLOCAL ENABLEEXTENSIONS
IF ERRORLEVEL 1 ECHO Unable to enable extensions

for /f "tokens=3 delims=, " %%i in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\State /v ImageState') do set status=%%i
IF DEFINED status (IF %status%==IMAGE_STATE_COMPLETE goto END)
ENDLOCAL

ping 127.0.0.1 -n 5 -w 10000 > nul
goto NOTCOMPLETE
:END

ENDLOCAL
