
copy /y design\mingw\design.exe    files
copy /y geom\mingw\geom.exe        files
copy /y libman\mingw\libman.exe    files
copy /y pcb\mingw\pcb.exe          files
copy /y sch\mingw\sch.exe          files
copy /y uninstall\mingw\uninstall.exe files


cd files
..\zip -r ..\pcb_eleg35.zip .
..\zip -r ..\pcb_eleg35_system.zip *.exe *.txt *.chm *.hlp
rem ..\zip -fr ..\pcb_eleg35.zip .
cd ..
zip2exe\mingw\zip2exe.exe pcb_eleg35.exe pcb_eleg35.zip install_pcb_elegance\mingw\install_pcb_elegance.exe


