@echo off
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" REM","","runas",1)(window.close)&&exit

echo ����ִ����...
:: (һ)ϵͳ����ѡ�� ::
:: �ػ�ǿɱ��̨���̷���
:: ��������

:: (��)UI Tweaks ::
:: �޸� win10 �߿�Ϊ0��AeroLite �Զ�����ʽ����Ҫ��
REM To use the default window border width again, set BorderWidth to -15 and PaddedBorderWidth to -60.
REM reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics"  /v "PaddedBorderWidth"  /d "0"  /t "REG_DWORD"  /f >NUL
REM reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics"  /v "BorderWidth"  /d "0"  /t "REG_DWORD"  /f >NUL

:: �������Դ���������̷��� ::
REM reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "DesktopProcess" /d "0x0000001" /t "REG_DWORD" /f >NUL

:: ��ʼ�˵���ʾ����ɫ
REM reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /d "0x0000001" /t "REG_DWORD" /f >NUL

:: ���� explorer
REM taskkill /f /im explorer.exe >NUL
REM start %systemroot%\explorer >NUL

:: (��)Application Tweaks ::
:: ECHO ȥ����װexe�ļ�ʱ�İ�ȫ����
REM reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Associations /v ModRiskFileTypes /t REG_SZ /d .exe;.bat;.vbs /f
REM gpupdate /force

:: (��)�����Ż� ::
:: �������÷��� ::

:: С���̿���
REM [HKEY_CURRENT_USER\Control Panel\Keyboard]
REM "InitialKeyboardIndicators"="80000002"

:: ;����Դ����������ʱ���Զ�������Դ������
REM [HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon]
REM "AutoRestartShell"=dword:00000001

:: �ر���ƵԤ��
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.avi\-ShellEx\{3D1975AF-0FC3-463d-8965-4DC6B5A840F4}]
REM @=""
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.wmv\-ShellEx\{3D1975AF-0FC3-463d-8965-4DC6B5A840F4}]
REM @=""
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.mpg\-ShellEx\{3D1975AF-0FC3-463d-8965-4DC6B5A840F4}]
REM @=""
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.mpeg\-ShellEx\{3D1975AF-0FC3-463d-8965-4DC6B5A840F4}]
REM @=""

:: �ر�����Ԥ��
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.mp3\-ShellEx\{e357fccd-a995-4576-b01f-234630154e96}]
REM @="{9DBD2C50-62AD-11D0-B806-00C04FD706EC}"
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.mp3\-ShellEx\{BB2E617C-0920-11D1-9A0B-00C04FC2D6C1}]
REM @="{9DBD2C50-62AD-11D0-B806-00C04FD706EC}"
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.flac\-ShellEx\{e357fccd-a995-4576-b01f-234630154e96}]
REM ;@="{9DBD2C50-62AD-11D0-B806-00C04FD706EC}"
REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.flac\-ShellEx\{BB2E617C-0920-11D1-9A0B-00C04FC2D6C1}]
REM @="{9DBD2C50-62AD-11D0-B806-00C04FD706EC}"
 

:: A0953C92-50DC-43bf-BE83-3742FED03C9C ��Ƶ
:: 374DE290-123F-4565-9164-39C4925E467B ����
:: B4BFCC3A-DB2C-424C-B029-7FE99A87C641 ����
:: A8CDFF1C-4878-43be-B5FD-F8091C1C60D0 �ĵ�
:: 3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA ͼƬ
:: 1CF1260C-4DD0-4ebb-811F-33C572699FDE ����
REM reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f >nul 2>nul
REM reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f >nul 2>nul
REM reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f >nul 2>nul

:: �Ѿ����ù���
REM reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Scruel" /v "optimize" /t REG_SZ /d "1" /f >nul
echo ��ϣ�
echo.
REM pause