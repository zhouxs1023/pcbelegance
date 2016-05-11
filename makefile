
PROJECT            = runcmd

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
DEFINES           +=-D SPM

GCC_OPTIONS        =-Wall -g2 $(OPTIMIZE) $(EXTRA) $(DEFINES)

##############################################################################
#Include directories

GCC_OPTIONS       +=-I ..\functionsc

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
#LIBRARIES         +=-lhtmlhelp

##############################################################################
#Library paths
LIBRARIES_DIR     +=-L ..\functionsc\mingw

##############################################################################
#Source files

USER_MODULES      +=runcmd

##############################################################################

USER_SOURCES        =$(USER_MODULES:%=%.c)
USER_OBJECTS        =$(USER_MODULES:%=%.o)
USER_ASM            =$(USER_MODULES:%=%.asm)
USER_PREPRO         =$(USER_MODULES:%=%.pre)

##############################################################################


all: $(PROJECT).exe .depend


##############################################################################
$(PROJECT).exe : $(USER_OBJECTS)                           \
				 ..\functionsc\mingw\libfunctionsc.a

	$(SILENT)echo #############################################################################
	$(SILENT)echo Link $(PROJECT).exe
	$(SILENT)type ..\oneline
	$(SILENT)$(GCC) $(GCC_OPTIONS) $(LIBRARIES_DIR) -mwindows -o $(PROJECT).exe \
   $(USER_OBJECTS) $(LIBRARIES) -Xlinker -M  >$(PROJECT).map
#	objdump -S $(PROJECT).exe >$(PROJECT)_exe.asm
	$(SILENT)copy /Y $(PROJECT).exe $(PROJECT)_debug.exe >NUL
	$(SILENT)strip $(PROJECT).exe

##############################################################################
$(USER_OBJECTS): $(@:%.o=$(INPUTDIR)\\%.c)
	$(SILENT)echo ############################################################################
	$(SILENT)echo make $(@:%.o=%.c)
	$(SILENT)type ..\oneline
	$(SILENT)$(GCC) $(GCC_OPTIONS) -c -o $@ $(@:%.o=%.c)

##############################################################################
clean:
	$(SILENT)del $(USER_OBJECTS)                          2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT).exe              2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT)_debug.exe        2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT).map              2>NUL
	$(SILENT)del $(USER_PREPRO)                           2>NUL
	$(SILENT)del $(USER_ASM)                              2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT)_exe.asm          2>NUL

##############################################################################
prepro:
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO $(GCC) $(GCC_OPTIONS) -c %%i.c -E | ..\remove_empty_lines  >%%i.pre

##############################################################################
.depend:
	$(SILENT)del .depend
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO $(GCC) $(GCC_OPTIONS) -M %%i.c -MT %%i.o >>.depend

##############################################################################
asm:
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO objdump -S %%i.o >%%i.asm

##############################################################################
exeasm:
	$(SILENT)$(GCC) $(GCC_OPTIONS) $(LIBRARIES_DIR) -mwindows -o $(PROJECT)_temp.exe  \
	$(USER_OBJECTS)  $(LIBRARIES)
	$(SILENT)objdump -S $(OUTPUTDIR)\$(PROJECT)_temp.exe >$(OUTPUTDIR)\$(PROJECT)_exe.asm
	$(SILENT)del $(OUTPUTDIR)\$(PROJECT)_temp.exe

##############################################################################
# Include dependencies file
-include .depend

