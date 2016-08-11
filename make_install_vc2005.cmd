
copy /y design\vc2005\release\design.exe    files
copy /y geom\vc2005\release\geom.exe        files
copy /y libman\vc2005\release\libman.exe    files
copy /y pcb\vc2005\release\pcb.exe          files
copy /y sch\vc2005\release\sch.exe          files
copy /y uninstall\vc2005\release\uninstall.exe files


cd files
..\zip -r ..\pcb_eleg35.zip .
rem ..\zip -fr ..\pcb_eleg35.zip .
cd ..
rem zip2exe\vc2005\Release\zip2exe.exe pcb_eleg35.exe pcb_eleg35.zip install_pcb_elegance\vc2005\Release\install_pcb_elegance.exe
zip2exe\vc2005\Release\zip2exe.exe pcb_eleg35.exe pcb_eleg35.zip install_pcb_elegance\vc2005\debug\install_pcb_elegance.exe


