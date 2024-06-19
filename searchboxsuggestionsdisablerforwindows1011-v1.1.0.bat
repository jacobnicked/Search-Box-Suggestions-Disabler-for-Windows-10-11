@echo off
set "params=%*"
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
title Search Box Suggestions Disabler for Windows 10/11 - v1.1.0
echo ==============================================================
echo = Search Box Suggestions Disabler for Windows 10/11 - v1.1.0 =
echo ==============================================================
echo =                    Made by Jacob Nicked                    =
echo ==============================================================
echo -
echo Hello, %username%! 
echo -
echo The tool modifies the Windows registry, which means the OS will be modified. 
echo It should not break your PC, but if this happens so, I am NOT responsible for that - you use the tool for your own responsibility.
echo Make sure to run the tool as administrator.
echo -
echo Type 'yes' to disable the search box suggestions from web.
echo Type 'no' to enable the search box suggestions from web.
echo Type 'exit' to close the program.
echo -
echo Type the answer:
set/p "answer="

if %answer%==yes goto yes
if %answer%==exit goto exit
if %answer%==no goto no

	:yes
	echo -
    reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
    reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v ShowRunAsDifferentUserInStart /t REG_DWORD /d 1 /f
	echo -
    echo Disabled the web suggestions successfully. Restart File Explorer or your PC. Press any key to exit.
	pause > nul
	exit

	:exit 
	exit

	:no
	echo -
    reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 0 /f
	echo -
    echo Enabled the web suggestions successfully. Restart File Explorer or your PC. Press any key to exit.
	pause > nul
	exit