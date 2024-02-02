# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=PickupCoil - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to PickupCoil - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "PickupCoil - Win32 Release" && "$(CFG)" !=\
 "PickupCoil - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "PickupCoil.mak" CFG="PickupCoil - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "PickupCoil - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "PickupCoil - Win32 Debug" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "PickupCoil - Win32 Debug"
RSC=rc.exe
F90=fl32.exe

!IF  "$(CFG)" == "PickupCoil - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\PickupCoil.exe" "$(OUTDIR)\PickupCoil.bsc"

CLEAN : 
	-@erase ".\Release\PickupCoil.exe"
	-@erase ".\Release\Main.obj"
	-@erase ".\Release\PickupCoil.bsc"
	-@erase ".\Release\Main.sbr"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /WX /FR /Zi /I "Release/" /c /nologo
F90_PROJ=/Ox /WX /FR"Release/" /Zi /I "Release/" /c /nologo /Fo"Release/"\
 /Fd"Release/PickupCoil.pdb" 
F90_OBJS=.\Release/
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/PickupCoil.bsc" 
BSC32_SBRS= \
	"$(INTDIR)/Main.sbr"

"$(OUTDIR)\PickupCoil.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/PickupCoil.pdb" /machine:I386 /out:"$(OUTDIR)/PickupCoil.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Main.obj"

"$(OUTDIR)\PickupCoil.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "PickupCoil - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\PickupCoil.exe" "$(OUTDIR)\PickupCoil.bsc"

CLEAN : 
	-@erase ".\Debug\PickupCoil.exe"
	-@erase ".\Debug\Main.obj"
	-@erase ".\Debug\PickupCoil.ilk"
	-@erase ".\Debug\PickupCoil.pdb"
	-@erase ".\Debug\PickupCoil.bsc"
	-@erase ".\Debug\Main.sbr"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Ox /WX /FR /Zi /I "Debug/" /c /nologo
F90_PROJ=/Ox /WX /FR"Debug/" /Zi /I "Debug/" /c /nologo /Fo"Debug/"\
 /Fd"Debug/PickupCoil.pdb" 
F90_OBJS=.\Debug/
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/PickupCoil.bsc" 
BSC32_SBRS= \
	"$(INTDIR)/Main.sbr"

"$(OUTDIR)\PickupCoil.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/PickupCoil.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/PickupCoil.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Main.obj"

"$(OUTDIR)\PickupCoil.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.for{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f90{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "PickupCoil - Win32 Release"
# Name "PickupCoil - Win32 Debug"

!IF  "$(CFG)" == "PickupCoil - Win32 Release"

!ELSEIF  "$(CFG)" == "PickupCoil - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\Main.for

"$(INTDIR)\Main.obj" : $(SOURCE) "$(INTDIR)"

"$(INTDIR)\Main.sbr" : $(SOURCE) "$(INTDIR)"


# End Source File
# End Target
# End Project
################################################################################
