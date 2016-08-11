
copy /y vc2010\release\design.exe       files
copy /y vc2010\release\geom.exe         files
copy /y vc2010\release\libman.exe       files
copy /y vc2010\release\pcb.exe          files
copy /y vc2010\release\sch.exe          files
copy /y vc2010\release\uninstall.exe    files


cd files
..\zip -r ..\pcb_eleg35.zip .
rem ..\zip -fr ..\pcb_eleg35.zip .
cd ..
vc2010\Release\zip2exe.exe pcb_eleg35.exe pcb_eleg35.zip vc2010\Release\install_pcb_elegance.exe


