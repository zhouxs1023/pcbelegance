

@set BUILDPATH=%CD%
@set BUILDCMD=%BUILDPATH%\runcmd\build_mingw_module.cmd

@IF "%1" == "clean" goto clean

@rem ***************************************************************************************************


@runcmd\runcmd %BUILDPATH%\runcmd\pstart.cmd

@runcmd\runcmd %BUILDCMD%       functionsc                1     %1 %2 %3
@runcmd\runcmd %BUILDCMD%       zlib                      4     %1 %2 %3
@runcmd\runcmd %BUILDCMD%       unzip                     2     %1 %2 %3

@runcmd\runcmd -p,w,1,300
@runcmd\runcmd -p,check_error,7

@if errorlevel 1 goto error

@runcmd\runcmd %BUILDCMD%       design                    8     %1 %2 %3
@runcmd\runcmd %BUILDCMD%       geom                      16    %1 %2 %3
@runcmd\runcmd %BUILDCMD%       sch                       32    %1 %2 %3

@runcmd\runcmd -p,w,4,300
@runcmd\runcmd -p,check_error,63
@if errorlevel 1 goto error

@runcmd\runcmd %BUILDCMD%       pcb                       64    %1 %2 %3
@runcmd\runcmd %BUILDCMD%       libman                    128   %1 %2 %3
@runcmd\runcmd %BUILDCMD%       uninstall                 256   %1 %2 %3
@runcmd\runcmd %BUILDCMD%       zip2exe                   512   %1 %2 %3

@runcmd\runcmd -p,w,2,300
@runcmd\runcmd -p,check_error,1023
@if errorlevel 1 goto error

@runcmd\runcmd %BUILDCMD%       install_pcb_elegance      1024  %1 %2 %3

@runcmd\runcmd -p,w,2047,300
@runcmd\runcmd -p,check_error,2047
@if errorlevel 1 goto error

@rem ***************************************************************************************************

@goto stop

:error
@echo "There was an error"
@runcmd\runcmd -p,stop

@goto end

:stop
@runcmd\runcmd -p,stop
@type buildtime.txt

@goto end

@rem ***************************************************************************************************

:clean

cd functionsc\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd unzip\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd zlib\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd design\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd geom\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd libman\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd zip2exe\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd install_pcb_elegance\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd uninstall\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd pcb\mingw
make %1 %2 %3 %4 %5
cd ..\..
cd sch\mingw
make %1 %2 %3 %4 %5
cd ..\..

@rem ***************************************************************************************************

:end


