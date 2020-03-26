@ echo Off
Call Home
echo Loading, Please Wait...
echo **********************************************  
echo.
rem Add all jars...
for %%i in (".\lib\*.jar") do call "CP.bat" %%i
CLS
java frmSplash
echo.
echo **********************************************
Pause