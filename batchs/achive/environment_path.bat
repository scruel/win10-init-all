@echo off
setlocal enabledelayedexpansion
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit
REM C:\ProgramData\Oracle\Java\javapath;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\system32\Wbem;%SystemRoot%\system32\WindowsPowerShell\v1.0\;C:\Program Files\Bandizip\;%LOCALAPPDATA%\Microsoft\WindowsApps

echo ���û�������...
REM ��ȡPath��������
set "SystemPath="
for /f "skip=1 tokens=* delims=" %%a in ('wmic ENVIRONMENT where "name='PATH' and username='<system>'" get VariableValue ') do (
	set SystemPath=%%a
	GOTO SystemPathGo
)
:SystemPathGo
set CheckPath=!SystemPath:%%={percent}!

REM �趨 JDK ����
setx /M JAVA_HOME "C:\Program Files\Java\jdk-9" > NUL

set result=1
call:checkReg "%JAVA_HOME%\bin"
call:checkReg "%%%%JAVA_HOME%%%%\bin"

echo %result%
pause
if "%result%"=="1" (
  echo �趨 JDK ��������...
	pause
  set SystemPath=%%JAVA_HOME%%\bin;%SystemPath%
	pause
  setx /M PATH "!SystemPath!" > NUL
)

pause
set ENVIRONMENT_HOME=K:\Program\Development\environment
setx /M ENVIRONMENT_HOME "%ENVIRONMENT_HOME%"> NUL
REM �趨 Tomcat ·��
setx /M CATALINA_HOME "%%ENVIRONMENT_HOME%%\webDev\apache-tomcat-8.5.5" > NUL

set result=1
set MY_PATH=gradle\bin
call:checkReg "%ENVIRONMENT_HOME%\%MY_PATH%"
call:checkReg "%%%%ENVIRONMENT_HOME%%%%\%MY_PATH%"
if %result%==1 (
  echo �趨 Gradle ��������...
  set SystemPath=%%ENVIRONMENT_HOME%%\%MY_PATH%;%SystemPath%
  setx /M PATH "!SystemPath!" > NUL
)

set result=1
set MY_PATH=webDev\mysql-5.7.13-winx64\bin
call:checkReg "%ENVIRONMENT_HOME%\%MY_PATH%"
call:checkReg "%%%%ENVIRONMENT_HOME%%%%\%MY_PATH%"
if %result%==1 (
  echo �趨 mysql ��������...
  set SystemPath=%%ENVIRONMENT_HOME%%\%MY_PATH%;%SystemPath%
  setx /M PATH "!SystemPath!" > NUL
)

set result=1
set MY_PATH=PortableGit\bin
call:checkReg "%ENVIRONMENT_HOME%\%MY_PATH%"
call:checkReg "%%%%ENVIRONMENT_HOME%%%%\%MY_PATH%"
if %result%==1 (
  echo �趨 Git ��������...
  set SystemPath=%%ENVIRONMENT_HOME%%\%MY_PATH%;%SystemPath%
  setx /M PATH "!SystemPath!" > NUL
)

set result=1
set MY_PATH=PortableGit\mingw64\libexec
call:checkReg "%ENVIRONMENT_HOME%\%MY_PATH%"
call:checkReg "%%%%ENVIRONMENT_HOME%%%%\%MY_PATH%"
if %result%==1 (
  echo �趨 Git mingw ��������...
  set SystemPath=%%ENVIRONMENT_HOME%%\%MY_PATH%;%SystemPath%
  setx /M PATH "!SystemPath!" > NUL
)

set result=1
set MY_PATH=apache-maven-3.3.9\bin
call:checkReg "%ENVIRONMENT_HOME%\%MY_PATH%"
call:checkReg "%%%%ENVIRONMENT_HOME%%%%\%MY_PATH%"
if %result%==1 (
  echo �趨 Maven ��������...
  set SystemPath=%%ENVIRONMENT_HOME%%\%MY_PATH%;%SystemPath%
  setx /M PATH "!SystemPath!" > NUL
)

set result=1
set MY_PATH=solr-6.6.0\bin
call:checkReg "%ENVIRONMENT_HOME%\%MY_PATH%"
call:checkReg "%%%%ENVIRONMENT_HOME%%%%\%MY_PATH%"
if %result%==1 (
  echo �趨 Solr ��������...
  set SystemPath=%%ENVIRONMENT_HOME%%\%MY_PATH%;%SystemPath%
  setx /M PATH "!SystemPath!" > NUL
)
REM echo.
REM echo ���������趨���.
REM pause


::--------------------------------------------------------  
::-- Function section starts below here  
::--------------------------------------------------------  
:checkReg
	set LocalVar=%~1
	set LocalVar=!LocalVar:%%={percent}!
	set LocalVar=%LocalVar:\=\\%
	:: echo %LocalVar%
	:: echo %CheckPath%
	echo.%CheckPath% | findstr /r /ic:";%LocalVar%\\*;" >NUL
	if %result%==1 set result=%errorlevel%
	
	echo.%CheckPath% | findstr /r /ic:"^%LocalVar%\\*;" >NUL
	if %result%==1 set result=%errorlevel%
	
	echo.%CheckPath% | findstr /r /ic:";%LocalVar%\\*$" >NUL
	if %result%==1 set result=%errorlevel%
goto :eof

