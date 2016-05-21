
PROJECT            = pcb

SILENT             =@
#SILENT             =

GCC                = mingw32-gcc
AR                 = ar

OPTIMIZE           =-O2
OPTIMIZE          +=-maccumulate-outgoing-args
#OPTIMIZE          +=-mtune=core2
OPTIMIZE          +=-mtune=pentium
OPTIMIZE          +=-mfpmath=both
OPTIMIZE          +=-msse2
#OPTIMIZE          +=-mfused-madd
#OPTIMIZE          +=-mssse3
#OPTIMIZE          +=-msse4.2

OPTIMIZE          +=-mstackrealign

EXTRA             +=-Wno-unused-but-set-variable
EXTRA             +=-Wno-unused-variable

##############################################################################
#Defines

DEFINES           +=-D GCC_COMP
DEFINES           +=-D UC
DEFINES           +=-D WIN32
DEFINES           +=-D WINVER=0x0501 -D _WIN32_IE=0x0500 -D _WIN32_WINNT=0x0501

GCC_OPTIONS        =-Wall -g2 $(OPTIMIZE) $(EXTRA) $(DEFINES)

##############################################################################
#Include directories

GCC_OPTIONS       +=-I ..\..\functionsc
GCC_OPTIONS       +=-I ..\..\zlib

INPUTDIR           =..
RESOURCEDIR        =..\resource
OUTPUTDIR          =.

##############################################################################
#Library names

LIBRARIES         +=-lfunctionsc

#Windows library names
LIBRARIES         +=-lkernel32
LIBRARIES         +=-luser32
LIBRARIES         +=-lgdi32
LIBRARIES         +=-lcomdlg32
LIBRARIES         +=-lwin32k
LIBRARIES         +=-lwininet
LIBRARIES         +=-lshell32
LIBRARIES         +=-lcomctl32
LIBRARIES         +=-ladvapi32
LIBRARIES         +=-lzlib
LIBRARIES         +=-lhtmlhelp

#Library paths
LIBRARIES_DIR     +=-L ..\..\functionsc\mingw
LIBRARIES_DIR     +=-L ..\..\zlib\mingw

##############################################################################
#Source files

USER_MODULES      +=calc
USER_MODULES      +=calc2
USER_MODULES      +=calc3
USER_MODULES      +=calc4
USER_MODULES      +=calcdef
USER_MODULES      +=calcdiag
USER_MODULES      +=calcrect
USER_MODULES      +=command
USER_MODULES      +=dialogs
USER_MODULES      +=draw
USER_MODULES      +=draw2
USER_MODULES      +=draw3
USER_MODULES      +=dxf
USER_MODULES      +=edif
USER_MODULES      +=edit
USER_MODULES      +=edit2
USER_MODULES      +=files
USER_MODULES      +=font
USER_MODULES      +=gateswap
USER_MODULES      +=geomsave
USER_MODULES      +=gerber
USER_MODULES      +=gerber2
USER_MODULES      +=gerber3
USER_MODULES      +=graphics
USER_MODULES      +=help
USER_MODULES      +=import
USER_MODULES      +=InputGerber
USER_MODULES      +=insdel
USER_MODULES      +=mainloop
USER_MODULES      +=memory
USER_MODULES      +=menus
USER_MODULES      +=move2
USER_MODULES      +=move3
USER_MODULES      +=movecomp
USER_MODULES      +=nets
USER_MODULES      +=nets2
USER_MODULES      +=odb
USER_MODULES      +=odb2
#USER_MODULES      +=own_zlib
USER_MODULES      +=paint
USER_MODULES      +=pcb
USER_MODULES      +=plot
USER_MODULES      +=polygon
USER_MODULES      +=print
USER_MODULES      +=qspline
USER_MODULES      +=rules
USER_MODULES      +=select
USER_MODULES      +=select2
USER_MODULES      +=select3
USER_MODULES      +=select4
USER_MODULES      +=settings
USER_MODULES      +=tar
USER_MODULES      +=toets
USER_MODULES      +=trace2
USER_MODULES      +=trace3
USER_MODULES      +=trace4
USER_MODULES      +=trace5
USER_MODULES      +=trace6
USER_MODULES      +=uservar

##############################################################################

USER_SOURCES        =$(USER_MODULES:%=$(INPUTDIR)\\%.c)
USER_OBJECTS        =$(USER_MODULES:%=%.o)
USER_ASM            =$(USER_MODULES:%=$(OUTPUTDIR)\\%.asm)
USER_PREPRO         =$(USER_MODULES:%=$(OUTPUTDIR)\\%.pre)

##############################################################################


all: .depend $(PROJECT).exe


##############################################################################
$(PROJECT).exe : $(USER_OBJECTS)                           \
				 $(OUTPUTDIR)\$(PROJECT)res.o              \
				 ..\..\functionsc\mingw\libfunctionsc.a    \
				 ..\..\zlib\mingw\libzlib.a

	$(SILENT)echo #############################################################################
	$(SILENT)echo Link $(PROJECT).exe
	$(SILENT)type ..\..\oneline
	$(SILENT)$(GCC) $(GCC_OPTIONS) $(LIBRARIES_DIR) -mwindows -o $(PROJECT).exe \
   $(USER_OBJECTS) $(PROJECT)res.o $(LIBRARIES) $(LINK_OPTIONS)              \
   -Xlinker -M  >$(PROJECT).map
#	objdump -S $(PROJECT).exe >$(PROJECT)_exe.asm
	$(SILENT)copy /Y $(PROJECT).exe $(PROJECT)_debug.exe >NUL
	$(SILENT)strip $(PROJECT).exe

##############################################################################
$(USER_OBJECTS): $(@:%.o=$(INPUTDIR)\\%.c)
	$(SILENT)echo ############################################################################
	$(SILENT)echo make $(@:%.o=%.c)
	$(SILENT)type ..\..\oneline
	$(SILENT)$(GCC) $(GCC_OPTIONS) -fdata-sections -ffunction-sections -c -o $@ $(@:%.o=$(INPUTDIR)\\%.c)

##############################################################################
$(OUTPUTDIR)\$(PROJECT).res: $(RESOURCEDIR)\$(PROJECT).rc
	$(SILENT)echo ############################################################################
	$(SILENT)type ..\..\oneline
	$(SILENT)windres -v -O res $(RESOURCEDIR)\$(PROJECT).rc $(OUTPUTDIR)\$(PROJECT).res

##############################################################################
$(OUTPUTDIR)\$(PROJECT)res.o: $(OUTPUTDIR)\$(PROJECT).res
	$(SILENT)echo ############################################################################
	$(SILENT)type ..\..\oneline
	$(SILENT)windres -J res -O coff $(OUTPUTDIR)\$(PROJECT).res $(OUTPUTDIR)\$(PROJECT)res.o

##############################################################################
clean:
	$(SILENT)del $(USER_OBJECTS)                          2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT).exe              2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT)_debug.exe        2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT)res.o             2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT).res              2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT).map              2>NUL
	$(SILENT)del $(USER_PREPRO)                           2>NUL
	$(SILENT)del $(USER_ASM)                              2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT)_exe.asm          2>NUL

##############################################################################
prepro:
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO $(GCC) $(GCC_OPTIONS) -c $(INPUTDIR)\%%i.c -E | ..\..\remove_empty_lines  >$(OUTPUTDIR)\%%i.pre

##############################################################################
.depend:
	$(SILENT)del .depend
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO $(GCC) $(GCC_OPTIONS) -M $(INPUTDIR)\%%i.c -MT $(OUTPUTDIR)\%%i.o >>.depend

##############################################################################
asm:
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO objdump -S $(OUTPUTDIR)\%%i.o >$(OUTPUTDIR)\%%i.asm

##############################################################################
exeasm:
	$(SILENT)$(GCC) $(GCC_OPTIONS) $(LIBRARIES_DIR) -mwindows -o $(OUTPUTDIR)\$(PROJECT)_temp.exe  \
	$(SILENT)$(USER_OBJECTS) $(PROJECT)res.o $(LIBRARIES)
	$(SILENT)objdump -S $(OUTPUTDIR)\$(PROJECT)_temp.exe >$(OUTPUTDIR)\$(PROJECT)_exe.asm
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT)_temp.exe

##############################################################################
# Include dependencies file
-include .depend

