/*
 * PCB elegance (Open source tools for making printed circuit boards)
 *
 * Copyright (C) 2012  Herman Morsink Vollenbroek
 *
 * File: uninstall.c
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


#include "owntypes.h"
#include "windows.h"
#include "io.h"
#include "files2.h"
#include "direct.h"
#include "fcntl.h"
#include "errno.h"
#include "sys/stat.h"
#include "resource.h"
#include "stdio.h"
#include "shlobj.h"
#include "shlwapi.h"


char *p1, *p2, *p3, regel[MAX_LENGTH_STRING], str1[MAX_LENGTH_STRING], str2[MAX_LENGTH_STRING], str3[MAX_LENGTH_STRING],
     str4[MAX_LENGTH_STRING], CurrentDir[MAX_LENGTH_STRING], ExecutableName[MAX_LENGTH_STRING],
     TempDir[MAX_LENGTH_STRING], ExecutableDir[MAX_LENGTH_STRING];
uint32 TimerObject, ClipID3, TimerIdentifier = 0x12345678;
int32 TimerValue, ExitValue, ok, StartSetup, EndSetup;
HWND UNINSTALLWindow;


LRESULT CALLBACK UNINSTALLWinProc(HWND Window, UINT Message, WPARAM WParam, LPARAM LParam);

WNDCLASS UNINSTALLClass = { CS_HREDRAW | CS_VREDRAW | CS_DBLCLKS,
                            (WNDPROC) UNINSTALLWinProc,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            "UNINSTALL"
                          };
char UNINSTALLClassName[] = "UNINSTALL";

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************


void WindowDestroy()
{
	PostQuitMessage(0);
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

int32 CALLBACK QuitDialog2(HWND Dialog, UINT Message, WPARAM WParam, LPARAM LParam)
{
	int32 about, x, y;
	RECT DialogWindowRect;

	about = 1;

	switch (Message)
	{
	case WM_INITDIALOG:
		SendDlgItemMessage(Dialog, IDC_EDIT1, WM_SETTEXT, 0, (LPARAM) (LPSTR) CurrentDir);
		x = GetSystemMetrics(SM_CXMAXIMIZED) / 2;
		y = GetSystemMetrics(SM_CYMAXIMIZED) / 2;

		GetWindowRect(Dialog, &DialogWindowRect);
		x -= (DialogWindowRect.right - DialogWindowRect.left) / 2;
		y -= (DialogWindowRect.bottom - DialogWindowRect.top) / 2;
		MoveWindow(Dialog, x, y, DialogWindowRect.right - DialogWindowRect.left,
		           DialogWindowRect.bottom - DialogWindowRect.top, 1);
		return about;

	case WM_MOVE:
		break;

	case WM_COMMAND:
		switch (LOWORD(WParam))
		{
		case IDOK:
			EndDialog(Dialog, IDOK);
			return about;

		case ID_EXIT_UNINSTALL:
			EndDialog(Dialog, ID_EXIT_UNINSTALL);
			return about;
		}

		break;
	}

	about = 0;
	return about;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************


int32 DeletePcbElegance()
{
	char str[MAX_LENGTH_STRING], InstallDir[MAX_LENGTH_STRING], ProjectDir[MAX_LENGTH_STRING],
	     StartMenuPath[MAX_LENGTH_STRING], DesktopPath[MAX_LENGTH_STRING];
	int32 res, KeySize;
	HKEY Key;

	InstallDir[0] = 0;
	ProjectDir[0] = 0;

	sprintf(str, ".DEFAULT\\Software\\PCB Elegance");

	if ((res = RegOpenKeyEx(HKEY_USERS, str, 0, KEY_ALL_ACCESS, &Key)) == ERROR_SUCCESS)
	{
		KeySize = 100;

		if ((res =
		            RegQueryValueEx(Key, "InstallDir", 0, NULL, (LPBYTE) & InstallDir, (PDWORD) & KeySize)) == ERROR_SUCCESS)
			ok = 1;

		KeySize = 100;

		if ((res =
		            RegQueryValueEx(Key, "ProjectDir", 0, NULL, (LPBYTE) & ProjectDir, (PDWORD) & KeySize)) == ERROR_SUCCESS)
			ok = 1;

		if (ProjectDir[0] == 0)
			strcpy(ProjectDir, InstallDir);

		RegCloseKey(Key);
	}

	if (InstallDir[0] == 0)
	{
		strcpy(ProjectDir, ExecutableDir);
		strcpy(InstallDir, ExecutableDir);
	}

	StartMenuPath[0] = 0;

	if (SUCCEEDED(SHGetFolderPath(NULL, CSIDL_PROGRAMS, NULL, SHGFP_TYPE_CURRENT, StartMenuPath)))
	{
		sprintf(str, "%s\\PCB Elegance", StartMenuPath);
		DeleteDirectory(str);
	}

	DesktopPath[0] = 0;

	if (SUCCEEDED(SHGetFolderPath(NULL, CSIDL_DESKTOPDIRECTORY, NULL, SHGFP_TYPE_CURRENT, DesktopPath)))
	{
		sprintf(str, "%s\\Design manager.lnk", DesktopPath);
		DeleteFile(str);
	}

	if (strcmp(InstallDir, ProjectDir))
		DeleteDirectory(ProjectDir);

	RegDeleteKey(HKEY_USERS, ".DEFAULT\\Software\\PCB Elegance");
	RegDeleteKey(HKEY_LOCAL_MACHINE, "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\PCB Elegance");
	DeleteDirectory(InstallDir);

	return 0;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

void Start()
{
	int32 res;

	res = DialogBox(UNINSTALLClass.hInstance, MAKEINTRESOURCE(IDD_DIALOG4), UNINSTALLWindow, (DLGPROC) QuitDialog2);

	if (res == ID_EXIT_UNINSTALL)
	{
		SendMessage(UNINSTALLWindow, WM_CLOSE, 0, 0);
		return;
	}

	res = 1;
//  RemoveLinks(CurrentDir);

	EndSetup = 1;

	return;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

LRESULT CALLBACK UNINSTALLWinProc(HWND Window, UINT Message, WPARAM WParam, LPARAM LParam)
{
	HDC OutputDisplay;
	RECT Rect, UpdateRect;
	PAINTSTRUCT PS;

	switch (Message)
	{
	case WM_PAINT:
		GetClientRect(UNINSTALLWindow, &Rect);

		if (GetUpdateRect(UNINSTALLWindow, &UpdateRect, 0))
		{
			OutputDisplay = BeginPaint(UNINSTALLWindow, &PS);
			FillRect(OutputDisplay, &Rect, GetStockObject(LTGRAY_BRUSH));
			EndPaint(UNINSTALLWindow, &PS);
		}

		break;

	case WM_CLOSE:
		DestroyWindow(Window);
		return 0;

	case WM_QUIT:
		return 0;

	case WM_DESTROY:
		WindowDestroy();
		return 0;

	case WM_TIMER:
		TimerValue++;

		if ((TimerValue > 4) && (!StartSetup))
		{
			StartSetup = 1;
			Start();
		}
		else
		{
			if (EndSetup)
			{
				if (ExitValue == 0)
					ExitValue = TimerValue;
				else
				{
					if (TimerValue > ExitValue + 20)
					{
						ExitValue = 1000000000;
						DeletePcbElegance();
//              DeleteFile("links.inf");
						MessageBox(UNINSTALLWindow, "PCB elegance is succesfully uninstalled", "Message", MB_OK);
						SendMessage(UNINSTALLWindow, WM_CLOSE, 0, 0);
					}
				}
			}
		}

		break;

	default:
		return DefWindowProc(Window, Message, WParam, LParam);
	}

	return 0;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

int PASCAL WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpszCmd, int nCmdShow)
{
	MSG M;
	char str[MAX_LENGTH_STRING], str2[MAX_LENGTH_STRING], str3[MAX_LENGTH_STRING], *FileName;

	memset(str, 0, sizeof(str));
	strncpy(str, GetCommandLine(), sizeof(str) - 1);

	if (str[0] != '"')
		GetString(str, str2);
	else
		GetQuoteString(str, str2);

	strcpy(str3, str2);

	if (str3[0] != 0)
		GetFullPathName(str3, 350, str2, &FileName);

	GetLongPathNameA(str2, str2, 350);
	strcpy(ExecutableName, str2);
	GetDirFromFileName(ExecutableDir, ExecutableName);
	GetTempDir(TempDir);

	if (hPrevInstance == 0)
	{
		UNINSTALLClass.hInstance = hInstance;
		UNINSTALLClass.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(ICON_1));
		UNINSTALLClass.hCursor = LoadCursor(0, IDC_ARROW);
		UNINSTALLClass.hbrBackground = GetStockObject(BLACK_BRUSH);

//    UNINSTALLClass.lpszMenuName= MAKEINTRESOURCE(IDR_MENU1);
		if (!RegisterClass(&UNINSTALLClass))
			exit(255);
	}

	UNINSTALLWindow =
	    CreateWindow(UNINSTALLClassName, "Uninstall PCB elegance", (WS_OVERLAPPEDWINDOW & ~WS_MAXIMIZEBOX), 0, 0, 300,
	                 200, HWND_DESKTOP, 0, hInstance, NULL);
//  ShowWindow(UNINSTALLWindow, SW_SHOW);
	ShowWindow(UNINSTALLWindow, SW_SHOWMINIMIZED);
	TimerObject = SetTimer(UNINSTALLWindow, TimerIdentifier, 100, NULL);
	TimerValue = 0;

	while (GetMessage(&M, 0, 0, 0))
	{
		TranslateMessage(&M);
		DispatchMessage(&M);
	}

	return 0;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
