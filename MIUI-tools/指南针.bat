@echo off
title MIUI�ռ�ж��
color 2f
mode con lines=30 cols=68
REM ________________________________________________________________

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (

    echo �������ԱȨ��...

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
Rem ɾ����ʱ�ļ�
del %TempFile_Name% 1>nul 2>nul
CLS
cd /d %~dp0
ECHO. ==============================================================
ECHO  MIUI ���������ǿ���ж�ص�(������Ϸ���ʼ���)����Щ�ǿ���ж�صģ�����Щ���ܡ�
echo.
echo  ע�⣺ж����Ը������Ը���
ECHO.
ECHO. ����������Ҫ����adb����
ECHO.
ECHO. ���˳��ֻ������������Ȼ�������������
ECHO. ==============================================================
ECHO.
PAUSE>NUL
cls
ECHO. ====================================================
ECHO.
ECHO. ���ڳ�������ADB����~
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
echo  ����������ϣ���ȷ���·��豸�б���������豸�����������������
ECHO.
ECHO  ==============================================================
ECHO.
echo �豸�б�
adb devices
echo.
PAUSE >nul
cls
color 3f
echo.
echo.
echo ====================����ִ�н��==================
echo.
adb shell pm uninstall --user 0 com.miui.compass
echo.
echo ==================================================
echo.
echo.
echo ������� Success ������Ϊ�ɹ���
echo.
echo Ȼ�������ܰ�~
echo.
echo ����������˳�
pause>nul
