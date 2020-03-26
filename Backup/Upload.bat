@ echo off
call T
Call Home
echo Ready to Upload Data!
echo **********************************************  
echo.
pause
echo Uploading Data...
echo.
mysql -u root -p Beximtex < Backup.sql
echo.
echo **********************************************
pause
pause