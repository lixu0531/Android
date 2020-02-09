@echo off                                                                        
echo                 Phicomm N1 一键卸载webpad官改v2.2全家桶              
echo                           2019-1-1  by Uscm                                                                      
echo **********************************************************
echo **********************************************************
echo          请将盒子连接有线网络并获得内网IP地址
echo .                                                                          
echo .                                                                          
echo .                                                                          





set /p ip=请输入盒子的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
adb root 31183118
if %ERRORLEVEL% NEQ 0 echo 连接测试失败！请确保已开启远程调试！&&goto end
:second
echo 等待二次连接...
adb connect %ip%
if %ERRORLEVEL% NEQ 0 echo 二次连接失败！再次尝试...&&goto second
echo *
echo *
echo *
echo 开始卸载全家桶之乐播投屏
adb shell pm uninstall --user 0 com.hpplay.happyplay.aw
echo 开始卸载全家桶之当贝桌面
adb shell pm uninstall --user 0 com.dangbei.tvlauncher
echo 开始卸载全家桶之当贝市场
adb shell pm uninstall --user 0 com.dangbeimarket
echo 开始卸载全家桶之快搜
adb shell pm uninstall --user 0 com.tv.kuaisou
echo 开始卸载全家桶之lignthome
adb shell pm uninstall --user 0 com.netxeon.lignthome
echo 开始卸载全家桶之自带文件管理
adb shell pm uninstall --user 0 com.phicomm.filemanager
echo 开始卸载全家桶之自带日历
adb shell pm uninstall --user 0 com.phicomm.phicalendar
echo 开始卸载全家桶之gitv
adb shell pm uninstall --user 0 com.tcl.gitv
echo 开始卸载全家桶之电视家浏览器
adb shell pm uninstall --user 0 com.fanshi.tvbrowser
echo 开始卸载全家桶之ES文件浏览器
adb shell pm uninstall --user 0 com.estrongs.android.pop(去掉汉字)
echo .
echo .
echo . 已经卸载完成，开始安装软件
echo . **********************************************************
echo 开始安装免框架TV版油管
adb install smartyoutubetv21493438400.apk
echo 开始安装免框架TV版油管
adb install smartyoutubetv21493438400.apk
echo 开始安装TV版优酷&爱奇艺&腾讯视频&B站
echo 正在安装1/4
adb install 1.apk
echo 正在安装2/4
adb install 2.apk
echo 正在安装3/4
adb install 3.apk
echo 正在安装4/4
adb install 4.apk
echo . 安装完成啦啦！
:end
echo 按任意键退出...
pause > nul
