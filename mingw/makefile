
PROJECT            = sch

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

GCC_OPTIONS        =-Wall -g2 $(OPTIMIZE) $(EXTRA) $(DEFINES)

##############################################################################
#Include directories

GCC_OPTIONS       +=-I ..\..\functionsc

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
LIBRARIES         +=-lhtmlhelp

#Library paths
LIBRARIES_DIR     +=-L ..\..\functionsc\mingw

##############################################################################
#Source files

USER_MODULES      +=calc
USER_MODULES      +=calc2
USER_MODULES      +=calcdef
USER_MODULES      +=calcrect
USER_MODULES      +=change
USER_MODULES      +=check
USER_MODULES      +=command
USER_MODULES      +=dialogs
USER_MODULES      +=draw
USER_MODULES      +=draw2
USER_MODULES      +=draw3
USER_MODULES      +=dxf
USER_MODULES      +=edit
USER_MODULES      +=edit2
USER_MODULES      +=files
USER_MODULES      +=graphics
USER_MODULES      +=help
USER_MODULES      +=inscomp
USER_MODULES      +=insdel
USER_MODULES      +=mainloop
USER_MODULES      +=memory
USER_MODULES      +=menus
USER_MODULES      +=messages
USER_MODULES      +=move2
USER_MODULES      +=movecomp
USER_MODULES      +=print
USER_MODULES      +=property
USER_MODULES      +=sch
USER_MODULES      +=select
USER_MODULES      +=toets
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
				 ..\..\functionsc\mingw\libfunctionsc.a

	$(SILENT)echo #############################################################################
	$(SILENT)echo Link $(PROJECT).exe
	$(SILENT)type ..\..\oneline
	$(SILENT)$(GCC) $(GCC_OPTIONS) $(LIBRARIES_DIR) -mwindows -o $(PROJECT).exe \
   $(USER_OBJECTS) $(PROJECT)res.o $(LIBRARIES) -Xlinker -M  >$(PROJECT).map
#	objdump -S $(PROJECT).exe >$(PROJECT)_exe.asm
	$(SILENT)copy /Y $(PROJECT).exe $(PROJECT)_debug.exe >NUL
	$(SILENT)strip $(PROJECT).exe

##############################################################################
$(USER_OBJECTS): $(@:%.o=$(INPUTDIR)\\%.c)
	$(SILENT)echo ############################################################################
	$(SILENT)echo make $(@:%.o=%.c)
	$(SILENT)type ..\..\oneline
	$(SILENT)$(GCC) $(GCC_OPTIONS) -c -o $@ $(@:%.o=$(INPUTDIR)\\%.c)

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

