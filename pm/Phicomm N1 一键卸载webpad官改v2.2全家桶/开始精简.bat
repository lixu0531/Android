@echo off                                                                        
echo                 Phicomm N1 һ��ж��webpad�ٸ�v2.2ȫ��Ͱ              
echo                           2019-1-1  by Uscm                                                                      
echo **********************************************************
echo **********************************************************
echo          �뽫���������������粢�������IP��ַ
echo .                                                                          
echo .                                                                          
echo .                                                                          





set /p ip=��������ӵ�����IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
adb root 31183118
if %ERRORLEVEL% NEQ 0 echo ���Ӳ���ʧ�ܣ���ȷ���ѿ���Զ�̵��ԣ�&&goto end
:second
echo �ȴ���������...
adb connect %ip%
if %ERRORLEVEL% NEQ 0 echo ��������ʧ�ܣ��ٴγ���...&&goto second
echo *
echo *
echo *
echo ��ʼж��ȫ��Ͱ֮�ֲ�Ͷ��
adb shell pm uninstall --user 0 com.hpplay.happyplay.aw
echo ��ʼж��ȫ��Ͱ֮��������
adb shell pm uninstall --user 0 com.dangbei.tvlauncher
echo ��ʼж��ȫ��Ͱ֮�����г�
adb shell pm uninstall --user 0 com.dangbeimarket
echo ��ʼж��ȫ��Ͱ֮����
adb shell pm uninstall --user 0 com.tv.kuaisou
echo ��ʼж��ȫ��Ͱ֮lignthome
adb shell pm uninstall --user 0 com.netxeon.lignthome
echo ��ʼж��ȫ��Ͱ֮�Դ��ļ�����
adb shell pm uninstall --user 0 com.phicomm.filemanager
echo ��ʼж��ȫ��Ͱ֮�Դ�����
adb shell pm uninstall --user 0 com.phicomm.phicalendar
echo ��ʼж��ȫ��Ͱ֮gitv
adb shell pm uninstall --user 0 com.tcl.gitv
echo ��ʼж��ȫ��Ͱ֮���Ӽ������
adb shell pm uninstall --user 0 com.fanshi.tvbrowser
echo ��ʼж��ȫ��Ͱ֮ES�ļ������
adb shell pm uninstall --user 0 com.estrongs.android.pop(ȥ������)
echo .
echo .
echo . �Ѿ�ж����ɣ���ʼ��װ���
echo . **********************************************************
echo ��ʼ��װ����TV���͹�
adb install smartyoutubetv21493438400.apk
echo ��ʼ��װ����TV���͹�
adb install smartyoutubetv21493438400.apk
echo ��ʼ��װTV���ſ�&������&��Ѷ��Ƶ&Bվ
echo ���ڰ�װ1/4
adb install 1.apk
echo ���ڰ�װ2/4
adb install 2.apk
echo ���ڰ�װ3/4
adb install 3.apk
echo ���ڰ�װ4/4
adb install 4.apk
echo . ��װ���������
:end
echo ��������˳�...
pause > nul
