@ echo off
call Home
echo Starting Server, Please Wait...
echo **********************************************  
echo.
start rmiregistry
java Server
echo.
echo **********************************************
Pause
