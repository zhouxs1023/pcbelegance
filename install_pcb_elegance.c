/*
 * PCB elegance (Open source tools for making printed circuit boards)
 *
 * Copyright (C) 2012  Herman Morsink Vollenbroek
 *
 * File: install_pcb_elegance.c 
 *
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
/*******************************************************************************************/


#ifdef GCC_COMP
#define  WINVER   0x0500
#endif

#include "types.h"
#include "time.h"
#include "unzipexe.h"
#include "files2.h"
#include "direct.h"
#include "resource.h"
#include "shlobj.h"
#include "shlwapi.h"
#include "params.h"
#include "utf8.h"
#include "locale.h"
#include "own_process.h"

#define ZipIdentString         "PCBEL4vkdK24mX8a7"
#define BUF_SIZE               256*1024
#define MEMORYMAPPEDSTRING     "MMFILE_PCB_ELEGANCE"

#define ENGLISH                0
#define GERMAN                 1
#define NEDERLANDS             2

typedef struct {
          char Ident[16];
          char ExtractDir[64];
          char Command[128];
          char Message[256];
          char Dummy[64];
          int32 Options;
          int32 ZipFileStart;
          uint32 Crc;
        } ZipIdentRecord;


USERFUNCTIONS               UserFunctions;
DCL                         DCLinfo;
char                        Buf[BUF_SIZE],
                            DialogTextLine[MAX_LENGTH_STRING],EditFile[MAX_LENGTH_STRING],
                            NewDir[MAX_LENGTH_STRING],CurrentDir[MAX_LENGTH_STRING],
                            WindowStr[MAX_LENGTH_STRING],TempDir[MAX_LENGTH_STRING],CpuVendor[40],
                            ExecutableName[MAX_LENGTH_STRING],ZipName[MAX_LENGTH_STRING],
                            InstallDir[MAX_LENGTH_STRING],ProjectDir[MAX_LENGTH_STRING],
                            MyDocumentsDir[MAX_LENGTH_STRING],
                            NewArgv[40][MAX_LENGTH_STRING],ProgramFilesDir[MAX_LENGTH_STRING],
                            ApplicationDataDir[MAX_LENGTH_STRING],
                            VersionStr[MAX_LENGTH_STRING],InstallDirStr[MAX_LENGTH_STRING],
                            ProjectDirStr[MAX_LENGTH_STRING],StartupDir[MAX_LENGTH_STRING];
HCURSOR                     SystemCursor;
HWND                        INSTALLWindow;
WNDCLASS                    INSTALLClass;
char                        INSTALLClassName[]="INSTALL";
HDC                         DialogDisplay,OutputDisplay;
HFONT                       TextFont;
int32                       DrawWindowMinX,DrawWindowMinY,DrawWindowMaxX,DrawWindowMaxY,
                            MessageHeight,TimerValue,ExitValue,StandardInstallDir,
                            ClientWindowDivX,ClientWindowDivY,ClientStartX,ClientStartY,
                            Created,Painting,DCInUse,MouseChanged,Focused,
                            LeftButtonPressed,RightButtonPressed,ok,
                            LeftButtonDoublePressed,ShortInstallation,StartSetup,EndSetup,
                            FirstPaint=1,
                            FirstDraw=1,
                            NrParams,FoundInstallation,
                            WindowWidth,WindowHeight,MousePosX,MousePosY,WindowStyle,
                            ScrollSize,ScrollSizeDrawing,ScrollEndOfWindow,
                            FlagSSE2;


STARTUPINFO                 StartupInfo;
PAINTSTRUCT                 PS;
RECT                        RealWindow,ClientRect,UpdateRect;
HRGN                        EditingRegion;
LPSTR                       MessagePtr;
UINT                        TimerObject,ClipID3;
UINT                        TimerIdentifier=0x1d56b24e;
UINT                        StartUpMessage;

unsigned char               crc32_table[256];

// ********************************************************************************************************
// ********************************************************************************************************

int WINAPI DisplayBuf(LPSTR, unsigned long);
int WINAPI GetReplaceDlgRetVal(LPSTR);
int WINAPI password(LPSTR, int, LPCSTR, LPCSTR);
int32 UnzipPcbElegance(int32 mode);
void WINAPI ReceiveDllMessage(unsigned long, unsigned long, unsigned,
                              unsigned, unsigned, unsigned, unsigned, unsigned,
                              char, LPSTR, LPSTR, unsigned long, char);



LRESULT FAR PASCAL INSTALLWinProc(HWND Window,UINT Message,WPARAM WParam,LPARAM LParam);

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

#if 0

void DecodeParameters()

{
  char  str[MAX_LENGTH_STRING],str2[MAX_LENGTH_STRING],str3[MAX_LENGTH_STRING],
        FileStr[MAX_LENGTH_STRING],*Path,*FileName,*Extension;
  int32 cnt,cnt2,cnt3,lengte,first,res,LengthString,OptionFound,pos;

  pos=0;
  lengte=1000;

  for (cnt=0;cnt<NrParams;cnt++) {
    if (Parameters[cnt].Option[0]!=0) {
      if (strnicmp(Parameters[cnt].Option,"a",lengte)==0) {
//        PaintIntro=0;
      }
      if (strnicmp(Parameters[cnt].Option,"e",lengte)==0) {
//        strcpy(ExePath,(LPSTR)&Parameters[cnt].Parameter[pos]);
      }
      if (strnicmp(Parameters[cnt].Option,"o",lengte)==0) {
//        ProjectActive=1;
      }
      if (strnicmp(Parameters[cnt].Option,"u",lengte)==0) {
//        strcpy(ProjectPath,(LPSTR)&Parameters[cnt].Parameter[pos]);
      }
      if (strnicmp(Parameters[cnt].Option,"x",lengte)==0) {
//        strcpy(DesignFile,(LPSTR)&Parameters[cnt].Parameter[pos]);
      }
    } else {
      if (GetFullPathName(Parameters[cnt].Parameter,250,EditFile,&FileName)==0) {
        MessageBox(INSTALLWindow,str,"Error in opening file",MB_APPLMODAL|MB_OK);
        EditFile[0]=0;
      }
    }
  }
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckIfAdministrator()

{
  char  str[MAX_LENGTH_STRING];
  int32 res,KeyInfo,b;
  HKEY  NewKey,Key;

  SID_IDENTIFIER_AUTHORITY NtAuthority = SECURITY_NT_AUTHORITY;
  PSID AdministratorsGroup;

  b = AllocateAndInitializeSid(
      &NtAuthority,
      2,
      SECURITY_BUILTIN_DOMAIN_RID,
      DOMAIN_ALIAS_RID_ADMINS,
      0, 0, 0, 0, 0, 0,
      &AdministratorsGroup);

  if (b) {
    if (!CheckTokenMembership( NULL, AdministratorsGroup, &b)) {
      b = 0;
    }
    FreeSid(AdministratorsGroup);
  }
  return(b);
}

#endif

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

int32    CALLBACK MessageDialog2(HWND Dialog,UINT Message,WPARAM WParam,LPARAM LParam)

{
  int32   about,x,y,y2,y3;
  HGLOBAL LicenceGlobal;
  LPSTR   LicenceText;
  HRSRC   LicenceResourceHandle;
  RECT    DialogWindowRect,MainWindowRect;
  char    str[800];

  about = 1;
  switch ( Message ) {
    case WM_INITDIALOG:
      SetWindowText(Dialog,"Exit setup");
      strcpy(str,"Please read the following Licence Agreement.\r\n");
      strcat(str,"Press the  PAGE DOWN key to see the rest of the agreement.");
      SendDlgItemMessageOwn(Dialog,IDC_STATIC1,  WM_SETTEXT,0,(LPARAM)str);
      strcpy(str,"Do you accept all the terms of the preceding Licence Agreement ?\r\n");
      strcat(str,"If you choose No, Setup will close.\r\n");
      strcat(str,"To proceed with the installation, you have to accept this agreement.");
      SendDlgItemMessageOwn(Dialog,IDC_STATIC2,  WM_SETTEXT,0,(LPARAM)str);
      SendDlgItemMessageOwn(Dialog,ID_EXIT_SETUP,WM_SETTEXT,0,(LPARAM)"Exit Setup");
      SendDlgItemMessageOwn(Dialog,IDBACK,       WM_SETTEXT,0,(LPARAM)"< Back");
      SendDlgItemMessageOwn(Dialog,IDYES,        WM_SETTEXT,0,(LPARAM)"Yes");
      SendDlgItemMessageOwn(Dialog,IDNO,         WM_SETTEXT,0,(LPARAM)"No");

      LicenceResourceHandle=FindResource(NULL,MAKEINTRESOURCE(IDR_LICENCE),"LICENCE");
      LicenceGlobal=LoadResource(NULL,LicenceResourceHandle);
      LicenceText=LockResource(LicenceGlobal);
      x=GetSystemMetrics(SM_CXMAXIMIZED)/2;
      y=GetSystemMetrics(SM_CYMAXIMIZED)/2;

      GetWindowRect(Dialog,&DialogWindowRect);
      x-=(DialogWindowRect.right-DialogWindowRect.left)/2;
      y-=(DialogWindowRect.bottom-DialogWindowRect.top)/2;
      MoveWindow(Dialog,x,y,
                 DialogWindowRect.right-DialogWindowRect.left,
                 DialogWindowRect.bottom-DialogWindowRect.top,1);
      SendDlgItemMessage(Dialog,ID_MESSAGE_EDIT1,WM_SETTEXT,0,(LPARAM)LicenceText);
      return about;
    case WM_MOVE:
      break;
    case WM_COMMAND:
      switch (LOWORD(WParam)) {
        case IDYES:
        case IDNO:
        case IDBACK:
          EndDialog(Dialog,LOWORD(WParam));
          return about;
      }
      break;
  }
  about = 0;
  return about;
}

int32 MessageDialog(LPSTR Message)

{
  int32   res,first;

  MessagePtr=Message;
  res=DialogBox(INSTALLClass.hInstance,MAKEINTRESOURCE(IDD_MESSAGE_DIALOG), INSTALLWindow, (DLGPROC)MessageDialog2);

  return res;
}


// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************


int32    CALLBACK QuitDialog2(HWND Dialog,UINT Message,WPARAM WParam,LPARAM LParam)

{
  int32   about,x,y;
  char    str[MAX_LENGTH_STRING];
  RECT    DialogWindowRect,MainWindowRect;

  about = 1;
  switch ( Message ) {
    case WM_INITDIALOG:
      SetWindowText(Dialog,"Exit setup");
      strcpy(str,"Setup is not complete. If you quit the Setup program now, the program will not be installed.");
      SendDlgItemMessage(Dialog,IDC_STATIC1,  WM_SETTEXT,0,(LPARAM)str);
      strcpy(str,"You may run the Setup program at a later time to complete the installation.");
      SendDlgItemMessage(Dialog,IDC_STATIC2,  WM_SETTEXT,0,(LPARAM)str);
      strcpy(str,"To continue, click Back. If you really want to quit click Exit Setup.");
      SendDlgItemMessage(Dialog,IDC_STATIC3,  WM_SETTEXT,0,(LPARAM)str);
      SendDlgItemMessage(Dialog,ID_EXIT_SETUP,WM_SETTEXT,0,(LPARAM)"Exit Setup");
      SendDlgItemMessage(Dialog,IDBACK,       WM_SETTEXT,0,(LPARAM)"< Back");
      x=GetSystemMetrics(SM_CXMAXIMIZED)/2;
      y=GetSystemMetrics(SM_CYMAXIMIZED)/2;

      GetWindowRect(Dialog,&DialogWindowRect);
      x-=(DialogWindowRect.right-DialogWindowRect.left)/2;
      y-=(DialogWindowRect.bottom-DialogWindowRect.top)/2;
      MoveWindow(Dialog,x,y,
                 DialogWindowRect.right-DialogWindowRect.left,
                 DialogWindowRect.bottom-DialogWindowRect.top,1);

      return about;
    case WM_MOVE:
      break;
    case WM_COMMAND:
      switch (LOWORD(WParam)) {
        case IDBACK:
          EndDialog(Dialog, IDBACK);
          return about;
        case ID_EXIT_SETUP:
          EndDialog(Dialog, ID_EXIT_SETUP);
          return about;
      }
      break;
  }
  about = 0;
  return about;
}

int32 QuitDialog()

{
  int32   res,first,Length;

  res=DialogBox(INSTALLClass.hInstance,MAKEINTRESOURCE(IDD_DIALOG_QUIT), INSTALLWindow, (DLGPROC)QuitDialog2);

  return res;
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 WINAPI GetReplaceDlgRetVal(LPSTR filename)
{
/* This is where you will decide if you want to replace, rename etc existing
   files.
 */
  return 1;
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

/* This is a very stripped down version of what is done in Wiz. Essentially
   what this function is for is to do a listing of an archive contents. It
   is actually never called in this example, but a dummy procedure had to
   be put in, so this was used.
 */
void WINAPI ReceiveDllMessage(unsigned long ucsize, unsigned long csiz,
                              unsigned cfactor,unsigned mo, unsigned dy,
                              unsigned yr, unsigned hh, unsigned mm,
                              char c, LPSTR filename, LPSTR methbuf,
                              unsigned long crc, char fCrypt)
{
  char psLBEntry[_MAX_PATH];
  char LongHdrStats[] =  "%7lu  %7lu %4s  %02u-%02u-%02u  %02u:%02u  %c%s";
  char CompFactorStr[] = "%c%d%%";
  char CompFactor100[] = "100%%";
  char szCompFactor[10];
  char sgn;

  if (csiz > ucsize) {
    sgn = '-';
  } else {
    sgn = ' ';
  }
  if (cfactor == 100) {
    lstrcpy(szCompFactor, CompFactor100);
  } else {
    sprintf(szCompFactor, CompFactorStr, sgn, cfactor);
            wsprintf(psLBEntry, LongHdrStats,
            ucsize, csiz, szCompFactor, mo, dy, yr, hh, mm, c, filename);
  }
  printf("%s\n", psLBEntry);
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

/* Password entry routine - see password.c in the wiz directory for how
   this is actually implemented in WiZ. If you have an encrypted file,
   this will probably give you great pain.
 */
int32 WINAPI password(LPSTR p, int32 n, LPCSTR m, LPCSTR name)
{
  return 1;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

/* Dummy "print" routine that simply outputs what is sent from the dll */
int32 WINAPI DisplayBuf(LPSTR buf, unsigned long size)
{
  printf("%s", (char *)buf);
  return (int)(unsigned int) size;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

#if 0


int32 GetDirectory(LPSTR Dir)

{
  char  str[MAX_LENGTH_STRING],str2[MAX_LENGTH_STRING],str3[MAX_LENGTH_STRING],
        str4[MAX_LENGTH_STRING],str5[MAX_LENGTH_STRING];
  int32 cnt,cnt2,res;
  BROWSEINFO DirectoryInfo;
  LPITEMIDLIST DirPointer;
  ITEMIDLIST *ItemIDList;
  SHITEMID *PShellItemId;
  char  ShellItemIdBuf[256];
  HRESULT hres;
  LPITEMIDLIST *ppidl;
  IShellFolder *psf;

  memset(&DirectoryInfo,0,sizeof(DirectoryInfo));
  DirectoryInfo.hwndOwner=NULL;
  str3[0]=0;
  DirectoryInfo.pszDisplayName=str3;
  DirectoryInfo.lpszTitle="Select directory";
  DirectoryInfo.ulFlags=BIF_RETURNONLYFSDIRS;
  DirPointer=SHBrowseForFolder(&DirectoryInfo);

  return SHGetPathFromIDList(DirPointer,Dir);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CALLBACK TextInputDialog2(HWND Dialog,WORD Message,WORD WParam,int32 LParam)

{
  int32   about,res2,TextChanged,niks,cnt,res,x,y;
  WORD    *Lengte;
  char    str[MAX_LENGTH_STRING],sel2[MAX_LENGTH_STRING],NewDir[MAX_PATH];
  RECT    DialogWindowRect,MainWindowRect;
  about = 1;

  switch ( Message ) {
    case WM_INITDIALOG:
      SetWindowText(Dialog,"Installation PCB elegance");
      SendDlgItemMessage(Dialog,IDC_STATIC1 ,WM_SETTEXT,0,(LPARAM)"Install directory");
      SendDlgItemMessage(Dialog,IDOK        ,WM_SETTEXT,0,(LPARAM)"OK");
      SendDlgItemMessage(Dialog,IDCANCEL    ,WM_SETTEXT,0,(LPARAM)"Cancel");
      GetWindowRect(Dialog,&DialogWindowRect);
      SendDlgItemMessage(Dialog,IDC_EDIT1,WM_SETTEXT,0,(LPARAM)&DialogTextLine);
      return about;
    case WM_MOVE:
      break;
    case WM_COMMAND:
      switch (WParam) {
        case IDOK:
          TextChanged=0;
          memset(DialogTextLine,0,200);
          if ((res=SendDlgItemMessage(Dialog,IDC_EDIT1,WM_GETTEXT,180,(LPARAM)DialogTextLine))==0) {
            memset(DialogTextLine,0,200);
          }
          EndDialog(Dialog, 1);
          return about;
        case IDC_BUTTON1:
          NewDir[0]=0;
          if ((GetDirectory(NewDir))
             &&
             (NewDir[0]!=0)) {
            memset(DialogTextLine,0,sizeof(DialogTextLine));
            strncpy(DialogTextLine,NewDir,199);
            SendDlgItemMessage(Dialog,IDC_EDIT1,WM_SETTEXT,0,(LPARAM)&DialogTextLine);
          }
          break;
        case IDCANCEL:
          memset(DialogTextLine,0,200);
          EndDialog(Dialog, 2);
          return about;
      }
    break;
  }
  about = 0;
  return about;
}


int32 TextInputDialog(LPSTR TextLine,int32 Mode)

{
  FARPROC AboutProc;
  int32   res;

//  DialogMode=Mode;
  strcpy(DialogTextLine,TextLine);
  res=DialogBox(INSTALLClass.hInstance,MAKEINTRESOURCE(IDD_TEXTINPUT_DIALOG), INSTALLWindow, (DLGPROC)TextInputDialog2);
  strcpy(TextLine,DialogTextLine);
  return res;
}

#endif

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CALLBACK InstallationDialog(HWND Dialog,WORD Message,WORD WParam,int32 LParam)

{
  int32   about,res2,TextChanged,niks,cnt,res,x,y;
  WORD    *Lengte;
  char    str[MAX_LENGTH_STRING],sel2[MAX_LENGTH_STRING],NewDir[MAX_PATH];
  RECT    DialogWindowRect,MainWindowRect;
  about = 1;

  switch ( Message ) {
    case WM_INITDIALOG:
/*
      if (!FoundInstallation) {
        SetWindowText(Dialog,"Installation PCB elegance");
      } else {
        SetWindowText(Dialog,"Updating PCB elegance");
      }
*/
      SetWindowText(Dialog,"Installation PCB elegance");
      SendDlgItemMessage(Dialog,IDC_STATIC1 ,WM_SETTEXT,0,(LPARAM)"Install directories");
      SendDlgItemMessage(Dialog,IDC_STATIC2 ,WM_SETTEXT,0,(LPARAM)"Main directory");
      SendDlgItemMessage(Dialog,IDC_STATIC3 ,WM_SETTEXT,0,(LPARAM)"Project directory");
      SendDlgItemMessage(Dialog,IDC_STATIC4 ,WM_SETTEXT,0,(LPARAM)"Project directory");
      SendDlgItemMessage(Dialog,IDC_RADIO1  ,WM_SETTEXT,0,(LPARAM)"Standard windows install directory");
      SendDlgItemMessage(Dialog,IDOK        ,WM_SETTEXT,0,(LPARAM)"OK");
      SendDlgItemMessage(Dialog,IDCANCEL    ,WM_SETTEXT,0,(LPARAM)"Cancel");
      x=GetSystemMetrics(SM_CXMAXIMIZED)/2;
      y=GetSystemMetrics(SM_CYMAXIMIZED)/2;

      GetWindowRect(Dialog,&DialogWindowRect);
      x-=(DialogWindowRect.right-DialogWindowRect.left)/2;
      y-=(DialogWindowRect.bottom-DialogWindowRect.top)/2;
      if (StandardInstallDir) {
        SendDlgItemMessage(Dialog,IDC_RADIO1,BM_SETCHECK,BST_CHECKED,0);
      } else {
        SendDlgItemMessage(Dialog,IDC_RADIO2,BM_SETCHECK,BST_CHECKED,0);
      }
      SendDlgItemMessage(Dialog,IDC_EDIT1,WM_SETTEXT,0,(LPARAM)&ProjectDir);
      SendDlgItemMessage(Dialog,IDC_EDIT2,WM_SETTEXT,0,(LPARAM)&ProjectDir);
      SendDlgItemMessage(Dialog,IDC_EDIT3,WM_SETTEXT,0,(LPARAM)&ProjectDir);
      MoveWindow(Dialog,x,y,
                 DialogWindowRect.right-DialogWindowRect.left,
                 DialogWindowRect.bottom-DialogWindowRect.top,1);
      return about;
    case WM_MOVE:
      break;
    case WM_COMMAND:
      switch (WParam) {
        case IDOK:
          TextChanged=0;
          if (SendDlgItemMessage(Dialog,IDC_RADIO1,BM_GETCHECK,1,0)==BST_CHECKED) {
            StandardInstallDir=1;
            memset(ProjectDir,0,200);
            if ((res=SendDlgItemMessage(Dialog,IDC_EDIT3,WM_GETTEXT,180,(LPARAM)ProjectDir))==0) {
              memset(ProjectDir,0,200);
            }
            if (ProjectDir[0]==0) {
              sprintf(str,"Wrong directory names");
              MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
              return about;
            }
            EndDialog(Dialog, 1);
          } else {
            memset(InstallDir,0,200);
            if ((res=SendDlgItemMessage(Dialog,IDC_EDIT1,WM_GETTEXT,180,(LPARAM)InstallDir))==0) {
              memset(InstallDir,0,200);
            }
            memset(ProjectDir,0,200);
            if ((res=SendDlgItemMessage(Dialog,IDC_EDIT2,WM_GETTEXT,180,(LPARAM)ProjectDir))==0) {
              memset(ProjectDir,0,200);
            }
            if ((InstallDir[0]==0)
               ||
               (ProjectDir[0]==0)) {
              sprintf(str,"Wrong directory names");
              MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
              return about;
            }
            StandardInstallDir=0;
//  SHGetFolderPath(NULL,CSIDL_APPDATA,NULL,SHGFP_TYPE_CURRENT,ProjectInstallDir);
            EndDialog(Dialog, 2);
          }
          return about;
        case IDCANCEL:
          memset(DialogTextLine,0,200);
          EndDialog(Dialog, 10);
          return about;
      }
    break;
  }
  about = 0;
  return about;
}

// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************

HRESULT CreateLink(int Folder,LPCSTR Executable, LPSTR Directory, LPSTR LinkName, LPSTR Desc,LPSTR Parameters)

/*
  Folder:

    * CSIDL_STARTMENU - To add a menu item in Start menu.
    * CSIDL_PROGRAMS - To add a menu item in Start->Program menu.
    * CSIDL_DESKTOP - To add a link on Desktop.

    * CSIDL_COMMON_PROGRAMS
    * CSIDL_COMMON_DESKTOPDIRECTORY
    * CSIDL_COMMON_STARTMENU


*/

{
  HRESULT hres;
  IShellLink *psl;
  IPersistFile *ppf;
  WORD wsz[MAX_PATH];
  LPITEMIDLIST pidl;
  char LinkPath[MAX_PATH];
  char CurrentPath[MAX_PATH],str5[MAX_LENGTH_STRING];

  CurrentPath[0]=0;
  if (!SUCCEEDED(SHGetFolderPath(NULL,Folder,NULL,SHGFP_TYPE_CURRENT,CurrentPath))) {
    return -1;
  }

  if ((Directory)
     &&
     (Directory[0]!=0)) {
    strcat(CurrentPath,"\\");
    strcat(CurrentPath,Directory);
    if (DirectoryExists(CurrentPath)!=0) {
      CreateDirectory(CurrentPath,NULL);
    }
  }
  sprintf(LinkPath,"%s\\%s.lnk",CurrentPath,LinkName);
  ok=S_OK;
  hres = CoCreateInstance(&CLSID_ShellLink, NULL, CLSCTX_INPROC_SERVER, &IID_IShellLink,(void *)&psl);
  if (SUCCEEDED(hres)) {
    // Set the path to the shortcut target, and add the
    // description.
    psl->lpVtbl->SetPath(psl, Executable);
    if ((Parameters)
       &&
       (Parameters[0])) {
      psl->lpVtbl->SetArguments(psl, Parameters);
    }
    psl->lpVtbl->SetDescription(psl, Desc);
    // Query IShellLink for the IPersistFile interface for saving
    // the shortcut in persistent storage.
    hres = psl->lpVtbl->QueryInterface(psl, &IID_IPersistFile,(void *)&ppf);
    if (SUCCEEDED(hres)) {
      // Ensure that the string is ANSI.
      MultiByteToWideChar(CP_ACP, 0, LinkPath, -1, wsz, MAX_PATH);
      // Save the link by calling IPersistFile::Save.
      hres = ppf->lpVtbl->Save(ppf, wsz, 1);
      ppf->lpVtbl->Release(ppf);
    }
    psl->lpVtbl->Release(psl);
  }
  return hres;
}


// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************

int32 WriteIniFileAndRegistryAndLinks(int32 mode)

{
  int32 res,KeyInfo,value,fp;
  HKEY  NewKey,Key;
  char  str[MAX_LENGTH_STRING],str2[MAX_LENGTH_STRING],str3[MAX_LENGTH_STRING],
        str4[MAX_LENGTH_STRING],str5[MAX_LENGTH_STRING];

//  sprintf(str,"InstallMode = %d",mode);MessageBox(INSTALLWindow,str,"",MB_APPLMODAL|MB_OK);

  sprintf(str,"\"%s\\design.exe\"",InstallDir);
  sprintf(str2,"PCB Elegance");
  str3[0]=0;
  if (strcmp(InstallDir,ProjectDir)) {
    sprintf(str3,"-p \"%s\"",ProjectDir);
  }
  if (CreateLink(CSIDL_PROGRAMS,str,str2,"Design manager","Design manager",str3)) {
    return -1;
  }
  sprintf(str,"%s\\viewplot.exe",InstallDir);
  if (CreateLink(CSIDL_PROGRAMS,str,str2,"VIEWPlot","VIEWPlot",NULL)) {
    return -1;
  }
  sprintf(str,"%s\\uninstall.exe",InstallDir);
  if (CreateLink(CSIDL_PROGRAMS,str,str2,"Uninstall","Uninstall",NULL)) {
    return -1;
  }
  sprintf(str,"%s\\manual.pdf",InstallDir);
  if (CreateLink(CSIDL_PROGRAMS,str,str2,"Manual","Manual",NULL)) {
    return -1;
  }
  sprintf(str3,"Do you want to create a link on the desktop");
  sprintf(str4,"Message");
  if (MessageBox(INSTALLWindow,str3,str4,MB_APPLMODAL|MB_YESNOCANCEL)==IDYES) {
    sprintf(str,"\"%s\\design.exe\"",InstallDir);
    str3[0]=0;
    if (strcmp(InstallDir,ProjectDir)) {
      sprintf(str3,"-p \"%s\"",ProjectDir);
    }
    if (CreateLink(CSIDL_DESKTOPDIRECTORY,str,NULL,"Design manager","Design manager",str3)) {
      return -1;
    }
  }

// *********************************************************************************************
// *********************************************************************************************

  sprintf(str,".DEFAULT\\Software\\PCB Elegance");
  if ((res=RegCreateKeyEx(HKEY_USERS,str,0,"",
                          REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,NULL,
                          &NewKey,(PDWORD)&KeyInfo))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  sprintf(str,"3.5");
  if ((res=RegSetValueEx(NewKey,"Version",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  strcpy(str,InstallDir);
  if ((res=RegSetValueEx(NewKey,"InstallDir",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  strcpy(str,ProjectDir);
  if ((res=RegSetValueEx(NewKey,"ProjectDir",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  strcpy(str,"English");
  if ((res=RegSetValueEx(NewKey,"Language",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  if (RegCloseKey(NewKey)!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }

// *********************************************************************************************
// *********************************************************************************************

  sprintf(str,"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\PCB Elegance");
  if ((res=RegCreateKeyEx(HKEY_LOCAL_MACHINE,str,0,"",
                          REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,NULL,
                          &NewKey,(PDWORD)&KeyInfo))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  sprintf(str,"PCB Elegance 3.5");
  if ((res=RegSetValueEx(NewKey,"DisplayName",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  sprintf(str,"3.5");
  if ((res=RegSetValueEx(NewKey,"DisplayVersion",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  sprintf(str,"http://www.pcbelegance.com");
  if ((res=RegSetValueEx(NewKey,"HelpLink",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  if ((res=RegSetValueEx(NewKey,"URLInfoAbout",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  if ((res=RegSetValueEx(NewKey,"URLUpdateInfo",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  value=50000;
  if ((res=RegSetValueEx(NewKey,"EstimatedSize",0,REG_DWORD,(BYTE *)&value,4))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  sprintf(str,"\"%s\\uninstall.exe\"",InstallDir);
  if ((res=RegSetValueEx(NewKey,"UninstallString",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  if ((res=RegSetValueEx(NewKey,"DisplayIcon",0,REG_SZ,(BYTE *)&str,strlen(str)+1))!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }
  if (RegCloseKey(NewKey)!=ERROR_SUCCESS) {
    ok=1;
    return -2;
  }

// *********************************************************************************************
// *********************************************************************************************

  sprintf(str,"%s\\user.ini",ProjectDir);
  if (FileExists(str)) {
    if ((fp=FileOpenWrite(str))<=0) {
      ok=1;
      return -3;
    }
    WriteLn(fp,"[Settings]");
    WriteLn(fp,"");
    WriteLn(fp,"WindowWidth=815");
    WriteLn(fp,"WindowHeight=672");
    WriteLn(fp,"");
    WriteLn(fp,"WindowStartX=120");
    WriteLn(fp,"WindowStartY=33");
    WriteLn(fp,"");
    WriteLn(fp,"[LastDesigns]");
    WriteLn(fp,"");
    sprintf(str2,"\"%s\\cdio\\cdio.dsn\"",ProjectDir);
    WriteLn(fp,str2);
    sprintf(str2,"\"%s\\PcMotherBoard\\PcMotherBoard.dsn\"",ProjectDir);
    WriteLn(fp,str2);
    sprintf(str2,"\"%s\\preamp\\preamp.dsn\"",ProjectDir);
    WriteLn(fp,str2);
    WriteLn(fp,"");
    FileClose(fp);
  }
  return 0;
}

// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************

int32 UnzipPcbElegance(int32 mode)

{
  int32 retcode,argc,cnt;
  char  str[MAX_LENGTH_STRING],*argv[40],InstallDir2[MAX_LENGTH_STRING];

  for (cnt=0;cnt<40;cnt++) argv[cnt]=NULL;

  UserFunctions.password = password;
  UserFunctions.print = DisplayBuf;
  UserFunctions.sound = NULL;
  UserFunctions.replace = GetReplaceDlgRetVal;
  UserFunctions.SendApplicationMessage = ReceiveDllMessage;


  /*
     Here is where the actual extraction process begins. First we set up the
     flags to be passed into the dll.
   */
  DCLinfo.ncflag = 0; /* Write to stdout if 1 */
  DCLinfo.fQuiet = 0; /* We want all messages.
                        1 = fewer messages,
                        2 = no messages */
  DCLinfo.ntflag = 0; /* test zip file if 1 */
  DCLinfo.nvflag = 0; /* give a verbose listing if 1 */
  DCLinfo.nzflag = 0; /* display a zip file comment if 1 */
  DCLinfo.ndflag = 1; /* Recreate directories != 0, skip "../" if < 2 */
  DCLinfo.naflag = 0; /* Do not convert CR to CRLF */
  DCLinfo.nfflag = 0; /* Do not freshen existing files only */
  DCLinfo.noflag = 1; /* Over-write all files if 1 */
  DCLinfo.ExtractOnlyNewer = 0; /* Do not extract only newer */
  DCLinfo.PromptToOverwrite = 0; /* "Overwrite all" selected -> no query mode */
  DCLinfo.lpszZipFN = ZipName; /* The archive name */
  if (mode==0) {
    DCLinfo.lpszExtractDir = InstallDir; /* The directory to extract to. This is set
                                            to NULL if you are extracting to the
                                            current directory. */
  } else {
  }
  /*
     As this is a quite short example, intended primarily to show how to
     load and call in to the dll, the command-line parameters are only
     parsed in a very simplistic way:
     We assume that the command-line parameters after the zip archive
     make up a list of file patterns:
     " [file_i1] [file_i2] ... [file_iN] [-x file_x1 [file_x2] ...]".
     We scan for an argument "-x"; all arguments in front are
     "include file patterns", all arguments after are "exclude file patterns".
     If no more arguments are given, we extract ALL files.

     In summary, the example program should be run like:
     example <archive.name> [files to include] [-x files to exclude]
     ("<...> denotes mandatory arguments, "[...]" optional arguments)
   */

  argc=0;
  if (strcmp(InstallDir,ProjectDir)) {
    strcpy(NewArgv[argc++],"*.exe");
    strcpy(NewArgv[argc++],"*.chm");
    strcpy(NewArgv[argc++],"*.cnt");
    strcpy(NewArgv[argc++],"lang*.txt");
    strcpy(NewArgv[argc++],"*.hlp");
    strcpy(NewArgv[argc++],"manual.pdf");
    strcpy(NewArgv[argc++],"viewplot_manual.pdf");
    for (cnt=0;cnt<argc;cnt++) argv[cnt]=(char *)&NewArgv[cnt];
    sprintf(InstallDir2,"\"%s\"",InstallDir);
//    SetCurrentDirectory
//    chdir(InstallDir);

//    DCLinfo.lpszExtractDir = NULL;
    DCLinfo.lpszExtractDir = InstallDir;
    retcode = Wiz_SingleEntryUnzip(argc,argv, 0,NULL, &DCLinfo,&UserFunctions);
//    retcode = Wiz_SingleEntryUnzip(0,NULL, 0,NULL, &DCLinfo,&UserFunctions);
    if ((retcode != 0)
       &&
       (retcode != 11)) {
      sprintf(str,"Error (%d) unzipping %s to direcory \"%s\"",retcode,ZipName,InstallDir);
      MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
      DeleteFile(ZipName);
      return -5;
    }

//    chdir(ProjectDir);
    argc=0;
    for (cnt=0;cnt<40;cnt++) argv[cnt]=NULL;
    strcpy(NewArgv[argc++],"preamp/*");
    strcpy(NewArgv[argc++],"PcMotherBoard/*");
    strcpy(NewArgv[argc++],"cdio/*");
    strcpy(NewArgv[argc++],"sym/*");
    strcpy(NewArgv[argc++],"lib/*");
    strcpy(NewArgv[argc++],"shapes/*");
    strcpy(NewArgv[argc++],"shplib/*");
    strcpy(NewArgv[argc++],"pcb.ini");
    strcpy(NewArgv[argc++],"sch.ini");
    strcpy(NewArgv[argc++],"geom.ini");
    strcpy(NewArgv[argc++],"viewplot.ini");
    strcpy(NewArgv[argc++],"comp.txt");
    strcpy(NewArgv[argc++],"compmenu.txt");
    for (cnt=0;cnt<argc;cnt++) argv[cnt]=(char *)&NewArgv[cnt];
    DCLinfo.lpszExtractDir = ProjectDir;
//    DCLinfo.lpszExtractDir = NULL;
    retcode = Wiz_SingleEntryUnzip(argc,argv, 0,NULL, &DCLinfo,&UserFunctions);
    DeleteFile(ZipName);
    if ((retcode != 0)
       &&
       (retcode != 11)) {
      sprintf(str,"Error (%d) unzipping %s to direcory \"%s\"",retcode,ZipName,ProjectDir);
      MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
      return -5;
    }
  } else {
//    chdir(InstallDir);
    DCLinfo.lpszExtractDir = ProjectDir;
    retcode = Wiz_SingleEntryUnzip(0,NULL, 0,NULL, &DCLinfo,&UserFunctions);
    DeleteFile(ZipName);
    if ((retcode != 0)
       &&
       (retcode != 11)) {
      sprintf(str,"Error unzipping %s to direcory %s",ZipName,InstallDir);
      MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
      return -5;
    }
  }
  return 0;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

int32    CALLBACK FinishedDialog2(HWND Dialog,UINT Message,WPARAM WParam,LPARAM LParam)

{
  int32    about;
  HGLOBAL LicenceGlobal;
  LPSTR   LicenceText;
  HRSRC   LicenceResourceHandle;
  char    str[MAX_LENGTH_STRING];

  about = 1;
  switch ( Message ) {
    case WM_INITDIALOG:
      SetWindowText(Dialog,"Installation completed");
      strcpy(str,"PCB elegance is succesfully installed.");
      SendDlgItemMessage(Dialog,IDC_STATIC2  ,WM_SETTEXT,0,(LPARAM)str);
      strcpy(str,"You can start PCB elegance by running the Design manager or exit,\r\n");
      strcat(str,", and start the Design manager at a later stage.");
      SendDlgItemMessage(Dialog,IDC_STATIC2  ,WM_SETTEXT,0,(LPARAM)str);
      SendDlgItemMessage(Dialog,IDSTART      ,WM_SETTEXT,0,(LPARAM)"Start design manager");
      SendDlgItemMessage(Dialog,ID_EXIT_SETUP,WM_SETTEXT,0,(LPARAM)"Exit Setup");
      return about;
    case WM_MOVE:
      break;
    case WM_COMMAND:
      switch (LOWORD(WParam)) {
        case IDSTART:
          EndDialog(Dialog, 0);
          return about;
        case ID_EXIT_SETUP:
          EndDialog(Dialog, -1);
          return about;
      }
      break;
  }
  about = 0;
  return about;
}

// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************

int32 CreateInstallDir(LPSTR Directory)

{
  int32 cnt,cnt2,res,Length,NrBackSlashes,BackSlashPos[10],DirNameError,DirSlashCnt;
  char  str[MAX_LENGTH_STRING],str2[MAX_LENGTH_STRING];

  Length=strlen(Directory);

  DirNameError=0;
  if ((Length>2)
     &&
     (Directory[0]=='\\')
     &&
     (Directory[1]=='\\')) {
  } else {
    if ((Length<4)
       ||
       (Directory[1]!=':')) {
      DirNameError=1;
    }
  }
  if (DirNameError) {
    sprintf(str,"Wrong directory name %s",Directory);
    MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
    res=QuitDialog();
    if (res==ID_EXIT_SETUP) {
      DeleteFile(ZipName);
      SendMessage(INSTALLWindow,WM_CLOSE,0,0);
      return -1;
    }
    return 0;
  }
  if (Directory[Length-1]=='\\') {
    Directory[Length-1]=0;
    Length--;
  }
  if (DirectoryExists(Directory)==0) {
    return 1;
  }
  NrBackSlashes=0;
  cnt=0;
  while (cnt<Length) {
    if (Directory[cnt]=='\\') {
      if (NrBackSlashes<10) {
        BackSlashPos[NrBackSlashes++]=cnt;
      }
    }
    cnt++;
  }
  if (NrBackSlashes<10) {
    BackSlashPos[NrBackSlashes++]=cnt;
  }
  if ((Length>2)
     &&
     (Directory[0]=='\\')
     &&
     (Directory[1]=='\\')) {
    DirSlashCnt=3;
  } else {
    DirSlashCnt=1;
  }
  for (cnt2=DirSlashCnt;cnt2<NrBackSlashes;cnt2++) {
    strcpy(str,Directory);
    str[BackSlashPos[cnt2]]=0;
    if (DirectoryExists(str)!=0) {
      if (!CreateDirectory(str,NULL)) {
        sprintf(str2,"Could not create directory %s",str);
        MessageBox(NULL,str2,"Error",MB_APPLMODAL|MB_OK);
        res=QuitDialog();
        if (res==ID_EXIT_SETUP) {
          DeleteFile(ZipName);
          SendMessage(INSTALLWindow,WM_CLOSE,0,0);
          return -1;
        }
      }
    }
  }

  return 1;
}

// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************

void Start()

{
  int32 res,ok,cnt,cnt2,result,DirNameError,DirSlashCnt,KeyInfo,fp,KeySize,KeyType,
        LengthInstallDir,Stop;
  HKEY  NewKey,Key;
  HANDLE  *SharedMemoryHandle;
  PROCESS_INFORMATION ProcessInfo;
  char  File1[MAX_LENGTH_STRING],str[MAX_LENGTH_STRING],str2[MAX_LENGTH_STRING],
        str3[MAX_LENGTH_STRING],ExeFile[MAX_LENGTH_STRING],ExeParams[MAX_LENGTH_STRING*5];

  Stop=0;
  while (!Stop) {
    res=MessageDialog("");
    switch (res) {
      case IDNO:
        res=QuitDialog();
        if (res==ID_EXIT_SETUP) {
          DeleteFile(ZipName);
          SendMessage(INSTALLWindow,WM_CLOSE,0,0);
          return;
        }
        continue;
      default:
        Stop=1;
    }
  }

// *********************************************************************************************
// *********************************************************************************************

/*
  if (!CheckIfAdministrator()) {
    sprintf(str,"You don't have enough rights to install software (You need to be an administrator)");
    MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
    DeleteFile(ZipName);
    SendMessage(INSTALLWindow,WM_CLOSE,0,0);
    return;
  }
*/

// *********************************************************************************************
// *********************************************************************************************

  StandardInstallDir=0;
  if (FoundInstallation) {
    if (strnicmp(InstallDirStr,ProgramFilesDir,strlen(ProgramFilesDir))==0) {
      StandardInstallDir=1;
      strcpy(InstallDir,InstallDirStr);
    }
    if (ProjectDirStr[0]==0) {
      strcpy(ProjectDir,"c:\\pcb_elegance");
    } else {
      if (DirectoryExists(ProjectDirStr)) {
        strcpy(ProjectDir,"c:\\pcb_elegance");
      } else {
        strcpy(ProjectDir,ProjectDirStr);
      }
    }
  } else {
    sprintf(InstallDir,"%s\\PCB Elegance",ProgramFilesDir);
    strcpy(ProjectDir,"c:\\pcb_elegance");
  }
  Stop=0;
  while (!Stop) {
    result=DialogBox(INSTALLClass.hInstance,MAKEINTRESOURCE(IDD_DIALOG_INSTALL),
                     NULL, (DLGPROC)InstallationDialog);
    if (result==10) {
      res=QuitDialog();
      if (res==ID_EXIT_SETUP) {
        DeleteFile(ZipName);
        SendMessage(INSTALLWindow,WM_CLOSE,0,0);
        return;
      }
      continue;
    }
    switch (result) {
      case 1:
//        sprintf(InstallDir,"%s\\pcb_elegance",ProgramFilesDir);
//        sprintf(ProjectDir,"%s\\pcb_elegance",MyDocumentsDir);
        break;
      case 2:
//        strcpy(ProjectDir,InstallDir);
        break;
    }
//  SHGetFolderPath(NULL,CSIDL_PROGRAM_FILES,NULL,SHGFP_TYPE_CURRENT,ProgramFilesDir);
//  SHGetFolderPath(NULL,CSIDL_APPDATA,NULL,SHGFP_TYPE_CURRENT,ApplicationDataDir);
//    MessageBox(NULL,InstallDir,"Create directory",MB_APPLMODAL|MB_OK);
    res=CreateInstallDir(InstallDir);
    switch (res) {
      case 0:
        continue;
      case -1:
        return;
    }
    if (strcmp(InstallDir,ProjectDir)) {
//      MessageBox(NULL,ProjectDir,"Create directory",MB_APPLMODAL|MB_OK);
      res=CreateInstallDir(ProjectDir);
      switch (res) {
        case 0:
          continue;
        case -1:
          return;
      }
    }
    SetCursor(LoadCursor(NULL,IDC_WAIT));
    if (UnzipPcbElegance(0)==0) {
      SetCursor(LoadCursor(NULL,IDC_ARROW));
      Stop=1;
    } else {
      SetCursor(LoadCursor(NULL,IDC_ARROW));
      res=QuitDialog();
      if (res==ID_EXIT_SETUP) {
        DeleteFile(ZipName);
        SendMessage(INSTALLWindow,WM_CLOSE,0,0);
        return;
      }
      continue;
    }
  }
  ok=1;

  if (!FoundInstallation) {
    if ((res=WriteIniFileAndRegistryAndLinks(0))) {
      switch (res) {
        case -1:
          sprintf(str2,"Error in creating links");
          break;
        case -2:
          sprintf(str2,"Error in writing to the registry");
          break;
        case -3:
          sprintf(str2,"Error in creating files in directory %s",InstallDir);
          break;
      }
      MessageBox(NULL,str2,"Error",MB_APPLMODAL|MB_OK);
      SendMessage(INSTALLWindow,WM_CLOSE,0,0);
      return;
    }
    res=DialogBox(INSTALLClass.hInstance,MAKEINTRESOURCE(IDD_DIALOG_FINISHED),
                  INSTALLWindow, (DLGPROC)FinishedDialog2);
    if (res==0) {
      sprintf(ExeFile,"%s\\design.exe",InstallDir);
      if (strcmp(InstallDir,ProjectDir)) {
        sprintf(ExeParams,"\"%s\" -p \"%s\"",ExeFile,ProjectDir);
      } else {
        sprintf(ExeParams,"\"%s\"",ExeFile);
      }
      StartupInfo.cb=sizeof(StartupInfo);
      StartupInfo.wShowWindow=SW_SHOW;
      CreateProcess(ExeFile,ExeParams,NULL,NULL,1,0,NULL,NULL,&StartupInfo,&ProcessInfo);
    }
  }
  SendMessage(INSTALLWindow,WM_CLOSE,0,0);
  return;
}

// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************

int32    CALLBACK ExitDialog2(HWND Dialog,WORD Message,WPARAM WParam,LPARAM LParam)

{
  int32   about,res2,TextChanged,niks,cnt,res;
  WORD    *Lengte;
  char    sel[MAX_LENGTH_STRING],sel2[MAX_LENGTH_STRING];

  about = 1;

  switch ( Message ) {
    case WM_INITDIALOG:
//      SendDlgItemMessage(Dialog,IDC_PROGRESS1,WM_SETTEXT,0,(LPARAM)&DialogTextLine);
      return about;
    case WM_MOVE:
      break;
    case WM_COMMAND:
      switch (LOWORD(WParam)) {
        case IDSTART:
          EndDialog(Dialog, IDSTART);
          return about;
        case ID_EXIT_SETUP:
          EndDialog(Dialog, ID_EXIT_SETUP);
          return about;
      }
    break;
  }
  about = 0;
  return about;
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void WindowCreate()

{
  SystemCursor=LoadCursor(NULL,IDC_ARROW);
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void WindowDestroy()

{
  PostQuitMessage(0);
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void InitDeviceContext()

{
  int32   i;

  if (FirstDraw==1) {
    FirstDraw=0;
  }
  if (!DCInUse) {
    DCInUse=1;
    if ( Painting ) {
      OutputDisplay = BeginPaint(INSTALLWindow, &PS);
    } else {
      OutputDisplay = GetDC(INSTALLWindow);
    }
    SetBkMode(OutputDisplay,TRANSPARENT);
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void StartDrawingEditingWindow()

{
  InitDeviceContext();

}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void DoneDeviceContext()

{
  if (DCInUse) {
    if ( Painting ) EndPaint(INSTALLWindow, &PS);
    else ReleaseDC(INSTALLWindow, OutputDisplay);
    OutputDisplay=(HDC)-1;
    DCInUse=0;
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void EndDrawingEditingWindow()

{
  DoneDeviceContext();

}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void WindowPaint()

{
  RECT Rect;
  int32 divx,x,y,res,cnt,maxcount,dikte,IntroBitmapSizeX,IntroBitmapSizeY,minx,maxx,miny,maxy;
  BYTE  r,g,b;
  char  str[MAX_LENGTH_STRING];
  LOGBRUSH BrushObject;
  HBRUSH   FillBrush;
  HBITMAP IntroBitmap;
  HDC IntroMemoryDC;
  HGDIOBJ old;

  GetClientRect(INSTALLWindow,&Rect);
  if ( GetUpdateRect(INSTALLWindow,&UpdateRect,0) ) {
    Painting = 1;
    InitDeviceContext();
    minx=0;
    maxx=10000;
    maxcount=30;
    dikte=DrawWindowMaxY/(maxcount-1);
    b=255;
    r=0;
    g=0;
    for (cnt=0;cnt<maxcount;cnt++) {
      miny=(int16)(cnt*dikte);
      maxy=(int16)((cnt+1)*dikte);
      Rect.left=minx;
      Rect.right=maxx;
      Rect.top=miny;
      Rect.bottom=maxy;
      BrushObject.lbHatch     = (LONG)NULL;
      BrushObject.lbStyle     = BS_SOLID;
      BrushObject.lbColor     = RGB(r,g,b);
      FillBrush = CreateBrushIndirect(&BrushObject);

      FillRect(OutputDisplay,&Rect,FillBrush);
      DeleteObject(FillBrush);

      b=(BYTE)max(0,b-256/(maxcount+1));
    }

    IntroBitmapSizeX=621;
    IntroBitmapSizeY=422;
    IntroBitmap=LoadBitmap(INSTALLClass.hInstance,MAKEINTRESOURCE(IDB_BITMAP_INTRO));
    IntroMemoryDC=CreateCompatibleDC(OutputDisplay);
    old=SelectObject(IntroMemoryDC,IntroBitmap);
    x=(WindowWidth)/2-IntroBitmapSizeX/2;
//    y=(WindowHeight)/2-IntroBitmapSizeY/2;
    y=100;
    res=BitBlt(OutputDisplay,x,y,IntroBitmapSizeX,IntroBitmapSizeY,IntroMemoryDC,0,0,SRCCOPY);
    SelectObject(IntroMemoryDC,old);
    DeleteDC(IntroMemoryDC);
    DeleteObject(IntroBitmap);

    SelectObject(OutputDisplay,TextFont);
    if (!FoundInstallation)
      strcpy(str,"Installing PCB Elegance 3.5");
    else
      strcpy(str,"Updating PCB Elegance 3.5");
    SetTextColor(OutputDisplay,RGB(255,255,255));
    TextOut(OutputDisplay,5,10,str,strlen(str));

    DoneDeviceContext();
    Painting = 0;
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void CheckInputMessages(void)

{
  MSG M;
  int32 cnt;
  WORD  Key;

  while ( PeekMessage(&M, 0, 0, 0, PM_REMOVE) ) {
    switch ( M.message ) {
      case WM_RBUTTONDBLCLK:
      case WM_RBUTTONDOWN:
      case WM_RBUTTONUP:
      case WM_LBUTTONDBLCLK:
      case WM_LBUTTONDOWN:
      case WM_LBUTTONUP:
      case WM_MBUTTONDBLCLK:
      case WM_MBUTTONDOWN:
      case WM_MBUTTONUP:
      case WM_PAINT:
      case WM_TIMER:
      case WM_CHAR:
      case WM_COMMAND:
      case WM_KEYDOWN:
      case WM_SYSKEYDOWN:
      case WM_KEYUP:
      case WM_SYSKEYUP:
      case WM_MOUSEMOVE:
        TranslateMessage(&M);
        DispatchMessage(&M);
        break;
    }
  }
}


// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************
// *********************************************************************************************


LRESULT FAR PASCAL INSTALLWinProc(HWND Window,UINT Message,WPARAM WParam,LPARAM LParam)

{
  POINT pp;
  float  hulp,hulp2;
  HPALETTE hpalT,Old;
  int32   i,i2,aaa,OldSheetNr,hulp3,res;
  HDC     hdc;
  float   Factor3;
  LRESULT Result;
  COLORREF Color,Color2;
  CREATESTRUCT  *CreateInfo;
  DRAWITEMSTRUCT *DrawInfo;
  char  str[MAX_LENGTH_STRING],File1[MAX_LENGTH_STRING];

  switch ( Message ) {
    case WM_CREATE:
      CreateInfo=(CREATESTRUCT *)LParam;
      WindowCreate();
      break;
    case WM_PAINT:
      if (FirstPaint) {
        WindowPaint();
        SetCursorPos(350,460);
        FirstPaint=0;
      } else {
        WindowPaint();
      }
      break;
    case WM_SIZE:
      GetClientRect(INSTALLWindow,&ClientRect);
//        GetClientRect(INSTALLWindow,&CursorRect);
      DrawWindowMinX=0;
//      DrawWindowMinY=30;
      DrawWindowMinY=0;
      DrawWindowMaxX=ClientRect.right;
      DrawWindowMaxY=ClientRect.bottom;
//      DrawWindowMaxY=ClientRect.bottom-20;
      ClientWindowDivX=DrawWindowMaxX-DrawWindowMinX;
      ClientWindowDivY=DrawWindowMaxY-DrawWindowMinY;

      GetWindowRect(INSTALLWindow,&RealWindow);
      pp.x=0;
      pp.y=0;
      ClientToScreen(INSTALLWindow,&pp);
      ClientStartX=(int16)pp.x;
      ClientStartY=(int16)pp.y;

//      ViewMinX=PixelToRealOffX(-1);
//      ViewMaxX=PixelToRealOffX(DrawWindowMaxX+1);
//      ViewMinY=PixelToRealOffY(-1);
//      ViewMaxY=PixelToRealOffY(DrawWindowMaxY+1-DrawWindowMinY);
      break;
    case WM_MOVE:
      GetWindowRect(INSTALLWindow,&RealWindow);
      pp.x=0;
      pp.y=0;
      ClientToScreen(INSTALLWindow,&pp);
      ClientStartX=(int16)pp.x;
      ClientStartY=(int16)pp.y;
      break;
    case WM_TIMER:
      TimerValue++;
      if ((TimerValue>20)
         &&
         (!StartSetup)) {
        StartSetup=1;
        Start();
      }
      break;
    case WM_CLOSE:
      DestroyWindow(Window);
      return 0;
    case WM_QUIT:
      ok=1;
      return 0;
    case WM_DESTROY:
      WindowDestroy();
      return 0;
    default:
      return DefWindowProc(Window, Message, WParam, LParam);
  }
  return 0;
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

// Reflection is a requirement for the official CRC-32 standard.
// You can create CRCs without it, but they won't conform to the standard.
uint32 Reflect(uint32 ref, char ch)
{// Used only by Init_CRC32_Table()

  uint32 value = 0;
  int32  i;

  // Swap bit 0 for bit 7
  // bit 1 for bit 6, etc.
  for (i = 1; i < (ch + 1); i++) {
  if (ref & 1) value |= 1 << (ch - i);
  ref >>= 1;
  }
  return value;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

// Call this function only once to initialize the CRC table.
void Init_CRC32_Table()
{// Called by OnInitDialog()

  // This is the official polynomial used by CRC-32
  // in PKZip, WinZip and Ethernet.
  int32  i,j;
  uint32 ulPolynomial = 0x04c11db7;

  // 256 values representing ASCII character codes.
  for (i = 0; i <= 0xFF; i++) {
    crc32_table[i]=Reflect(i, 8) << 24;
    for (j = 0; j < 8; j++) {
      crc32_table[i] = (crc32_table[i] << 1) ^ (crc32_table[i] & (1 << 31) ? ulPolynomial : 0);
    }
    crc32_table[i] = Reflect(crc32_table[i], 32);
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int PASCAL WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    LPSTR lpszCmd, int nCmdShow)
{
  char str[MAX_LENGTH_STRING],str2[MAX_LENGTH_STRING],str3[MAX_LENGTH_STRING],StartUpStr[MAX_LENGTH_STRING],*FileName,*land;
  int32 retcode,fp,fp2,result,FileLength,cnt3,WriteResult,cnt2,cnt,Length,
        crccnt,cnt4,res,KeyInfo,Feature,KeyType;
  uint32 crc,EAX,EBX,ECX,EDX,KeySize;
  HKEY  NewKey,Key;
  ZipIdentRecord ZipIdent;
  MSG   M;
  WIN32_FIND_DATA FindFileData;

  GetCPUID(0x0, &EAX, &EBX, &ECX, &EDX);
  memcpy(CpuVendor  , &EBX, 4);
  memcpy(CpuVendor+4, &EDX, 4);
  memcpy(CpuVendor+8, &ECX, 4);
  GetCPUID(0x80000000, &EAX, &EBX, &ECX, &EDX);
  GetCPUID(0x1, &EAX, &EBX, &ECX, &EDX);
  FlagSSE2 = (EDX>>26) & 0x1;
  if (!FlagSSE2) {
    MessageBox(NULL,"PCB elegance requires a CPU with SSE2 extensions",
               "Error",MB_APPLMODAL|MB_OK);
    return 0;
  }

  srand( (unsigned)time( NULL ) );
  CoInitialize(NULL);
  Init_CRC32_Table();
  setlocale(LC_ALL, "");
  strcpy(str3,setlocale( LC_ALL, NULL ));

  SHGetFolderPath(NULL,CSIDL_PROGRAM_FILES,NULL,SHGFP_TYPE_CURRENT,ProgramFilesDir);
  SHGetFolderPath(NULL,CSIDL_APPDATA,NULL,SHGFP_TYPE_CURRENT,ApplicationDataDir);
  SHGetFolderPath(NULL,CSIDL_PERSONAL,NULL,SHGFP_TYPE_CURRENT,MyDocumentsDir);

  SHGetFolderPath(NULL,CSIDL_STARTUP,NULL,SHGFP_TYPE_CURRENT,StartupDir);
  SHGetFolderPath(NULL,CSIDL_DESKTOPDIRECTORY,NULL,SHGFP_TYPE_CURRENT,str);
  SHGetFolderPath(NULL,CSIDL_STARTMENU,NULL,SHGFP_TYPE_CURRENT,str2);

  sprintf(str,".DEFAULT\\Software\\PCB Elegance\\");
  if ((res=RegOpenKeyEx(HKEY_USERS,str,0,KEY_QUERY_VALUE,&Key))==ERROR_SUCCESS) {
    KeyType=0;
    KeySize=40;

    if ((res=RegQueryValueEx(Key,"Version",0,NULL,(LPBYTE)&VersionStr,(LPDWORD)&KeySize))==ERROR_SUCCESS) {
      ok=1;
    }
    KeySize=80;
    if ((res=RegQueryValueEx(Key,"InstallDir",0,NULL,(LPBYTE)&InstallDirStr,(LPDWORD)&KeySize))==ERROR_SUCCESS) {
      ok=1;
    }
    if (InstallDirStr[0]) {
      sprintf(str,"%s\\design.exe",ProgramFilesDir);
      if (FileExists(str)==0) {
        FoundInstallation=1;
      }
    }
    KeySize=80;
    if ((res=RegQueryValueEx(Key,"ProjectDir",0,NULL,(LPBYTE)&ProjectDirStr,(LPDWORD)&KeySize))==ERROR_SUCCESS) {
      ok=1;
    }
    RegCloseKey(Key);
  }
  memset(str,0,sizeof(str));
  strncpy(str,GetCommandLine(),sizeof(str)-1);
  strcpy(StartUpStr,str);
  if (str[0]!='"') {
    GetString(str,str2);
  } else {
    GetQuoteString(str,str2);
  }
  strcpy(str3,str2);
  if (str3[0]!=0) {
    GetFullPathName(str3,350,str2,&FileName);
  }
  GetLongPathNameA(str2,str2,350);
  strcpy(ExecutableName,str2);
  GetTempDir(TempDir);
  Length=strlen(TempDir);
  if (Length==0) {
    MessageBox(NULL,"Internal error","Error",MB_APPLMODAL|MB_OK);
    return -1;
  }
  if (TempDir[Length-1]=='\\') {
    TempDir[Length-1]=0;
  }
  sprintf(ZipName,"%s\\pcb_install.zip",TempDir);
  ok=1;
//  MessageBox(NULL,ExecutableName,"ExecutableName",MB_APPLMODAL|MB_OK);

  if ((FileLength=FileSize(ExecutableName))<=0) {
    MessageBox(NULL,"Internal error","Error",MB_APPLMODAL|MB_OK);
    return -1;
  }

  cnt3=FileLength-4;
  fp=FileOpenReadOnly(ExecutableName);
  crc=0xffffffff;
  crccnt=0;
  while (cnt3>0) {
    if (FileRead(fp,Buf,min(cnt3,BUF_SIZE),&result)==-1) {
      MessageBox(NULL,"Internal error","Error",MB_APPLMODAL|MB_OK);
      return -1;
    }
    for (cnt4=0;cnt4<result;cnt4++) {
      crc = (crc >> 8) ^ crc32_table[(crc & 0xFF) ^ Buf[cnt4]];
      crccnt++;
    }
    cnt3-=result;
  }
  crc^=0xffffffff;


  FileSeek(fp,FileLength-sizeof(ZipIdent));
  FileRead(fp,&ZipIdent,sizeof(ZipIdent),&result);
  if ((result!=sizeof(ZipIdent))
     ||
     (strcmp(ZipIdent.Ident,ZipIdentString)!=0)) {
    FileClose(fp);
    MessageBox(NULL,"Internal error","Error",MB_APPLMODAL|MB_OK);
    return -2;
  }

  if (crc!=ZipIdent.Crc) {
    FileClose(fp);
    sprintf(str,"There is a crc error in file %s",ExecutableName);
    MessageBox(NULL,str,"Error",MB_APPLMODAL|MB_OK);
    return -2;
  }

  FileSeek(fp,ZipIdent.ZipFileStart);
  cnt3=FileLength-ZipIdent.ZipFileStart-sizeof(ZipIdent);
  DeleteFile(ZipName);
  fp2=FileOpenWrite(ZipName);
  if (fp2<=0) {
    FileClose(fp);
    MessageBox(NULL,"Internal error","Error",MB_APPLMODAL|MB_OK);
    return -3;
  }
  while (cnt3>0) {
    FileRead(fp,Buf,min(cnt3,BUF_SIZE),&result);
    FileWrite(fp2,Buf,result,&WriteResult);
    cnt3-=result;
  }
  FileClose(fp);
  FileClose(fp2);

  strcpy(InstallDir,"c:\\pcb_elegance");
  strcpy(ProjectDir,"c:\\pcb_elegance");
  WindowWidth=GetSystemMetrics(SM_CXMAXIMIZED)-10;
  WindowHeight=GetSystemMetrics(SM_CYMAXIMIZED)-10;
  if ( hPrevInstance == 0 ) {
    INSTALLClass.style =0;
    INSTALLClass.lpfnWndProc=(WNDPROC)INSTALLWinProc;
    INSTALLClass.cbClsExtra=0;
    INSTALLClass.cbWndExtra=0;
    INSTALLClass.hInstance = hInstance;
    INSTALLClass.hIcon = LoadIcon(hInstance,MAKEINTRESOURCE(ICON1));
    INSTALLClass.hCursor = LoadCursor(0, IDC_ARROW);
    INSTALLClass.hbrBackground = GetStockObject(GRAY_BRUSH);
    INSTALLClass.lpszClassName=INSTALLClassName;

    if ( ! RegisterClass(&INSTALLClass) ) exit(255);
  }

  TextFont=CreateFont(50,0,0,0,0,0,0,0,ANSI_CHARSET,
                      OUT_TT_PRECIS,CLIP_DEFAULT_PRECIS,PROOF_QUALITY,
                      FIXED_PITCH,"Arial");

  strcpy(WindowStr,"PCB Elegance setup");

  WindowStyle=WS_OVERLAPPEDWINDOW;
  WindowStyle&=~(WS_MAXIMIZEBOX);
  INSTALLWindow = CreateWindow(INSTALLClassName,
                             (LPSTR)&WindowStr,
                             WindowStyle,
                             0,
                             0,
                             WindowWidth,
                             WindowHeight,
                             HWND_DESKTOP,
                             0,
                             hInstance,
                             NULL);
  ShowWindow(INSTALLWindow, nCmdShow);

  TimerObject=SetTimer(INSTALLWindow,TimerIdentifier,100,NULL);
  TimerValue=0;

  while ( GetMessage(&M, 0, 0, 0) ) {
    TranslateMessage(&M);
    DispatchMessage(&M);
  }
  if (ZipName[0])
    DeleteFile(ZipName);
/*
  if (ZipIdent.Command) {
    chdir(InstallDir);
//    MessageBox(NULL,ZipIdent.Command,"Executing",MB_APPLMODAL|MB_OK);
    WinExec(ZipIdent.Command,SW_SHOWNORMAL);
  }
*/
  return 1;
}

