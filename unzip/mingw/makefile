

PROJECT            = unzip
LIBNAME            = libunzip.a

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
DEFINES           +=-D USE_EF_UT_TIME
DEFINES           +=-D UNZIPLIB
DEFINES           +=-D DLL
DEFINES           +=-D WINDLL
DEFINES           +=-D _MBCS
DEFINES           +=-D WINVER=0x0501 -D _WIN32_IE=0x0500 -D _WIN32_WINNT=0x0501

#DEFINES           +=-D DEBUG_LOG

INPUTDIR           =..
OUTPUTDIR          =.

GCC_OPTIONS        = -Wall -g2 $(OPTIMIZE) $(EXTRA) $(DEFINES)

USER_MODULES      += api
USER_MODULES      += crc32
USER_MODULES      += win32\crc_i386
USER_MODULES      += crctab
USER_MODULES      += crypt
USER_MODULES      += explode
USER_MODULES      += extract
USER_MODULES      += fileio
USER_MODULES      += globals
USER_MODULES      += inflate
USER_MODULES      += list
USER_MODULES      += match
USER_MODULES      += win32\nt
USER_MODULES      += process
USER_MODULES      += unreduce
USER_MODULES      += unshrink
USER_MODULES      += win32\win32
USER_MODULES      += windll\windll
USER_MODULES      += zipinfo


USER_SOURCES       =$(USER_MODULES:%=$(INPUTDIR)\\%.c)
USER_OBJECTS       =$(USER_MODULES:%=%.o)
#USER_OBJECTS       =$(USER_MODULES:%=$(OUTPUTDIR)\\%.o)
USER_ASM           =$(USER_MODULES:%=$(OUTPUTDIR)\\%.asm)
USER_PREPRO        =$(USER_MODULES:%=$(OUTPUTDIR)\\%.pre)

all: $(OUTPUTDIR)\.depend $(OUTPUTDIR)\win32 $(OUTPUTDIR)\windll $(OUTPUTDIR)\$(LIBNAME)

$(OUTPUTDIR)\windll:
	$(SILENT)mkdir $(OUTPUTDIR)\windll

$(OUTPUTDIR)\win32:
	$(SILENT)mkdir $(OUTPUTDIR)\win32

##############################################################################
$(OUTPUTDIR)\$(LIBNAME): $(USER_OBJECTS)
	$(SILENT)echo #############################################################################
	$(SILENT)echo Create library $(LIBNAME)
	$(SILENT)$(AR) rs $(OUTPUTDIR)\$(LIBNAME) $(USER_OBJECTS)
	$(SILENT)objdump -S $(OUTPUTDIR)\$(LIBNAME) >$(OUTPUTDIR)\\$(PROJECT).asm


##############################################################################
$(USER_OBJECTS): $(@:%.o=$(INPUTDIR)\\%.c)
	$(SILENT)echo ############################################################################
	$(SILENT)echo make $(@:%.o=%.c)
	$(SILENT)type ..\..\oneline
	$(SILENT)$(GCC) $(GCC_OPTIONS) -c -o $@ $(@:%.o=$(INPUTDIR)\\%.c)

##############################################################################
clean:
	$(SILENT)del $(USER_OBJECTS)              2>NUL
	$(SILENT)del $(USER_PREPRO)               2>NUL
	$(SILENT)del $(USER_ASM)                  2>NUL
	$(SILENT)del $(OUTPUTDIR)\$(LIBNAME)      2>NUL

##############################################################################
prepro:
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO $(GCC) $(GCC_OPTIONS) -c $(INPUTDIR)\%%i.c      -E  >$(OUTPUTDIR)\%%i.pre

##############################################################################
$(OUTPUTDIR)\.depend:
	$(SILENT)del $(OUTPUTDIR)\.depend
	$(SILENT)FOR %%i IN ($(USER_MODULES)) DO $(GCC) $(GCC_OPTIONS) -M $(INPUTDIR)\%%i.c -MT $(OUTPUTDIR)\%%i.o >>$(OUTPUTDIR)\.depend

##############################################################################
asm:
	$(SILENT)FOR %%i IN ($(USER_SOURCES)) DO objdump -S $(OUTPUTDIR)\%%i.o >$(OUTPUTDIR)\%%i.asm

##############################################################################
# Include dependencies file
-include $(OUTPUTDIR)\.depend

