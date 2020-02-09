@echo off
title MIUI终极卸载
color 2f
mode con lines=30 cols=68
REM ________________________________________________________________

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (

    echo 请求管理员权限...

    goto UACPrompt

) else ( goto gotAdmin )

:UACPrompt

    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"

    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
exit /B

:gotAdmin

    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
	goto A

REM ________________________________________________________________


:A
Rem 删除临时文件
del %TempFile_Name% 1>nul 2>nul
CLS
cd /d %~dp0
ECHO. ==============================================================
ECHO  MIUI 部分内置是可以卸载的(比如游戏，邮件等)，有些是可以卸载的，但有些不能。
echo.
echo  注意：卸载自愿，后果自负。
ECHO.
ECHO. 首先我们需要重启adb服务。
ECHO.
ECHO. 请退出手机助手类软件，然后按任意键继续。
ECHO. ==============================================================
ECHO.
PAUSE>NUL
cls
ECHO. ====================================================
ECHO.
ECHO. 正在尝试重启ADB服务~
ECHO.
ECHO. ====================================================
ECHO.
echo.
adb kill-server
ping 127.0.0.1 /n 2 >nul
adb start-server
cls
ECHO.
ECHO  ==============================================================
ECHO.
echo  重启服务完毕，请确保下方设备列表中有你的设备。按任意键继续……
ECHO.
ECHO  ==============================================================
ECHO.
echo 设备列表：
adb devices
echo.
PAUSE >nul
cls
color 3f
echo.
echo.
echo ====================命令执行结果==================
echo.
adb shell pm uninstall --user 0 com.miui.compass
echo.
echo ==================================================
echo.
echo.
echo 如果看见 Success 字样即为成功。
echo.
echo 然后尽情享受吧~
echo.
echo 按下任意键退出
pause>nul
