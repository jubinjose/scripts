echo off
set output=Done!
pushd
cd c:\windows\system32\inetsrv\

rem start  - Check if Admin access
net session >nul 2>&1
if %errorLevel% == 0 (
    appcmd.exe list wp
) else (
    set output=NO Administrative permissions
)
rem end  - Check if Admin access

popd
echo %output%
pause