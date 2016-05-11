

PROJECT            = zlib
LIBNAME            = libzlib.a

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
DEFINES           +=-D WIN32
DEFINES           +=-D HAVE_MEMCPY
#DEFINES           +=-D DEBUG_LOG

INPUTDIR           =..
OUTPUTDIR          =.

GCC_OPTIONS        = -Wall -g2 $(OPTIMIZE) $(EXTRA) $(DEFINES)

USER_MODULES      += adler32
USER_MODULES      += compress
USER_MODULES      += crc32
USER_MODULES      += deflate
USER_MODULES      += gzio
USER_MODULES      += infblock
USER_MODULES      += infcodes
USER_MODULES      += inffast
USER_MODULES      += inflate
USER_MODULES      += inftrees
USER_MODULES      += infutil
USER_MODULES      += trees
USER_MODULES      += uncompr
USER_MODULES      += zutil


USER_SOURCES       =$(USER_MODULES:%=$(INPUTDIR)\\%.c)
USER_OBJECTS       =$(USER_MODULES:%=%.o)
#USER_OBJECTS       =$(USER_MODULES:%=$(OUTPUTDIR)\\%.o)
USER_ASM           =$(USER_MODULES:%=$(OUTPUTDIR)\\%.asm)
USER_PREPRO        =$(USER_MODULES:%=$(OUTPUTDIR)\\%.pre)

all: $(OUTPUTDIR)\.depend $(OUTPUTDIR)\$(LIBNAME)

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

