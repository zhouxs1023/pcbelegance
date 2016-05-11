
PROJECT = debugmem

GCC = mingw32-gcc

#CPU_VERSION = pentium
#CPU_VERSION = core2

OPTIMIZE    =

OPTIMIZE    +=-maccumulate-outgoing-args
OPTIMIZE    +=-mtune=core2
OPTIMIZE    +=-mfpmath=both
OPTIMIZE    +=-msse2
#OPTIMIZE    +=-mfused-madd
#OPTIMIZE    +=-mssse3
#OPTIMIZE    +=-msse4.2

#EXTRA       +=-Wunused-but-set-variable
#EXTRA       +=-Wno-unused-variable

DEFINES     +=-D GCC_COMP
DEFINES     +=-D UC
DEFINES     +=-D WIN32
#DEFINES     +=-D KEY

GCC_OPTIONS = -Wall -O3 -g2 $(OPTIMIZE) $(EXTRA) $(DEFINES)

GCC_OPTIONS += -I ..\functionsc

LIBRARIES         +=-lfunctionsc

LIBRARIES         +=-lkernel32
LIBRARIES         +=-luser32
LIBRARIES         +=-lgdi32
LIBRARIES         +=-lcomdlg32
LIBRARIES         +=-lwin32k
LIBRARIES         +=-lwininet
LIBRARIES         +=-lshell32
LIBRARIES         +=-lcomctl32
LIBRARIES         +=-ladvapi32


LIBRARIES_DIR     +=-L ..\functionsc\mingw


USER_SOURCES +=      debugmem


USER_OBJECTS            =$(USER_SOURCES:%=%.o)

all: $(PROJECT).exe .depend


$(PROJECT).exe : $(USER_OBJECTS) ..\functionsc\mingw\libfunctionsc.a

	@echo #############################################################################
	@echo Link
	@echo
	$(GCC) $(GCC_OPTIONS) $(LIBRARIES_DIR) -mconsole -o $(PROJECT).exe \
    $(USER_OBJECTS) $(LIBRARIES) -Xlinker -M  >$(PROJECT).map
#	objdump -S $(PROJECT).exe >$(PROJECT).asm
	objdump -S debugmem.exe >debugmem.asm
	strip $(PROJECT).exe

$(USER_OBJECTS): $(@:%.o=%.c)
	$(GCC) $(GCC_OPTIONS) -c -o $@ $(@:%.o=%.c)

##############################################################################
clean:
	del $(USER_OBJECTS)

##############################################################################
prepro:
	$(GCC) $(GCC_OPTIONS) -c       debugmem.c      -E  >      debugmem.pre

##############################################################################
.depend: makefile
	del .depend
	$(GCC) $(GCC_OPTIONS) -M       debugmem.c -MT       debugmem.o >> .depend

##############################################################################
# Include dependencies file
-include .depend

