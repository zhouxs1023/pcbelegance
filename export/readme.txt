
Instructions for building/compiling PCB elegance 3.5
----------------------------------------------------


Unpack the zip file into an empty directory. ( For example c:\pcbeleg35 )

The source code for PCB elegance 3.5 can be compiled with:

 - VC2005 (Microsoft visual studio 2005)
 - VC2010 (Microsoft visual studio 2010) or its express version
 - mingw  (gcc for windows)



For VC2005 open the solution file vc2005\pcbeleg.sln.
The solution contains all the projects for pcb elegance 3.5.
When doing a rebuild (Debug/release) all executables are being made.
If you have a multi core processor than all processer
cores (including hyper treads) are being used for
compiling/building.


For VC2010 open the solution file vc2010\pcbeleg.sln,
and compiling/building is the same as for VC2005.
If you have a multi core processor than all processer
cores (including hyper treads) are being used for
compiling/building.


Using mingw (Minimalist GNU for windows):

If you want to use the mingw build system, you will need its build system.
It can be downloaded from http://www.mingw.org.
If you are not familiar with the gcc build system you might want to check
the following link:

http://www.mingw.org/wiki/Getting_Started

There are a few scripts that can be used to build the entire system:

 - build.cmd

   Assuming you have console window opened, and are in the main
   pcb elegenace directory, and have the mingw\bin directory added to your path.
   Type "build -j 4"
   All executables/libraries are being build using up to 4 processor cores.



For the mingw build environment you will have to work with the windows
command shell. The standard windows command shell (cmd.exe), has its drawbacks.
There are however replacements. Check the following link:

http://sourceforge.net  (search for console)


