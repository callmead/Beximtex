@ Echo Off
call T
Call Home
echo Processing Request Please Wait...
echo **********************************************  
echo.
mysqldump -u root -p beximtex > Backup.sql
rem mysqldump -u userName -pPasswordd [Options] DatabaseName > FileName.sql
rem if no Option is used then database create info and data both are copied
echo.
echo Database Backup File [Backup.sql] Created...
echo.
echo **********************************************
pause