runcmd\runcmd -p,s,%2
cd %1\mingw
make %3 %4 %5
if errorlevel 1 goto error
cd ..\..
runcmd\runcmd -p,f,%2

goto end

:error
runcmd\runcmd -p,result_error,%2
cd ..\..
runcmd\runcmd -p,f,%2
pause

goto end

:end
@rem pause

