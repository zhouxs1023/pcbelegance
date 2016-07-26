

#include "time.h"
#include "owntime.h"
#include "stdio.h"
#include "files2.h"
#include "direct.h"
#include "shlobj.h"
#include "shlwapi.h"
#include "own_process.h"


#define MEMORYMAPPEDSTRING                      "MMFILE_RUN_EXE"

#define DefSharedMemoryLength                   4096


STARTUPINFO StartupInfo;

uint8 *SharedMemory;
HANDLE *SharedMemoryHandle;
char CurDir[400];
int32 SharedMemoryInfo, ok, *ProcessesReady, *ProcessesStart, *ProcessesResultOk, *ProcessesResultError, *FullStop,
      *ModuleStop, WaitMask, ProcessMask;

extern int64 CurrentFrequency;

#if 0


runcmd d:
\projects \ pcbeleg35 \ make_install_mingw.cmd runcmd - p, m,
1 d:
\projects \ pcbeleg35 \ runcmd \ test2.cmd runcmd - p, f,
1 d:
\projects \ pcbeleg35 \ runcmd \ test2.cmd runcmd - p, w, 45, 20 d:
\projects \ pcbeleg35 \ runcmd \ test2.cmd
#endif
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
void RunConsoleCommand(LPSTR str4)
{
	char str[400], str2[400], str3[400], StartUpStr[400], *strp, ExeFile[400], ExeParams[400], Parameters[400],
	     Options[400], Options1[400], Options2[400], Options3[400];
	PROCESS_INFORMATION ProcessInfo;

	sprintf(Parameters, "/C %s", str4);
#if 0
	MessageBox(NULL, str4, "Parameters3", MB_APPLMODAL | MB_OK);
	return;
#endif
#if 0
#ifdef SPM
	strcpy(ExeFile, "c:\\utils\\console\\Console.exe");
#else
	strcpy(ExeFile, "e:\\utils\\console\\Console.exe");
#endif
#else
	strcpy(ExeFile, "c:\\windows\\system32\\cmd.exe");
#endif
	sprintf(ExeParams, "\"%s\" %s", ExeFile, Parameters);
#if 0
	MessageBox(NULL, ExeParams, "run cmd", MB_APPLMODAL | MB_OK);
	return;
#endif
	StartupInfo.cb = sizeof(StartupInfo);
	StartupInfo.wShowWindow = SW_SHOW;

	if (!CreateProcess(ExeFile, ExeParams, NULL, NULL, 1, 0, NULL, NULL, &StartupInfo, &ProcessInfo))
	{
	}
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int PASCAL WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpszCmd, int nCmdShow)
{
	char str[400], str2[400], str3[400], str4[400], StartUpStr[400], *strp, ExeFile[400], ExeParams[400],
	     Parameters[400], Options[400], Options1[400], Options2[400], Options3[400];
	int32 retcode, result, FileLength, cnt, WriteResult, tel2, tel, KeySize, Length, Mask, res, MaxWait, WaitCnt,
	      BuildTime;
	FILE *fp;
	int64 *StartCounter = NULL, Counter, hulp;

	InitTimers();


	if ((SharedMemoryHandle = OpenFileMapping(FILE_MAP_WRITE, 0, MEMORYMAPPEDSTRING)))
	{
		// The memory mapped file has already been created
		SharedMemory = (uint8 *) MapViewOfFile(SharedMemoryHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
		SharedMemoryInfo = 1;
		ok = 1;
	}
	else
	{
		// The memory mapped file should be created
		if (!
		        (SharedMemoryHandle =
		             CreateFileMapping((HANDLE) 0xFFFFFFFF, NULL, PAGE_READWRITE, 0, DefSharedMemoryLength,
		                               MEMORYMAPPEDSTRING)))
		{
			// The memory mapped file can not be created
			ok = 1;
			MessageBox(NULL, "Unknown error occured", "Error", MB_APPLMODAL | MB_OK);
			return 2;
		}
		else
		{
			// The memory mapped file has been created
			// Now map the memory mapped file into memory (Getting a pointer to the memory adres)
			SharedMemory = (uint8 *) MapViewOfFile(SharedMemoryHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);

			if (SharedMemory != NULL)
				memset(SharedMemory, 0, DefSharedMemoryLength);

			ok = 1;
		}

		SharedMemoryInfo = 2;
	}

	if (SharedMemory)
	{
		ProcessesStart = (int32 *) & SharedMemory[0];
		ProcessesReady = (int32 *) & SharedMemory[4];
		ProcessesResultOk = (int32 *) & SharedMemory[8];
		ProcessesResultError = (int32 *) & SharedMemory[12];
		FullStop = (int32 *) & SharedMemory[16];
		ModuleStop = (int32 *) & SharedMemory[20];
		StartCounter = (int64 *) & SharedMemory[24];
	}

	memset(Options, 0, sizeof(Options));
	memset(Options1, 0, sizeof(Options1));
	memset(Options2, 0, sizeof(Options2));
	memset(Options3, 0, sizeof(Options3));
	memset(str, 0, sizeof(str));
	strncpy(str, GetCommandLine(), sizeof(str) - 1);
	GetCurrentDirectory(300, CurDir);
#if 0
	sprintf(str2, "Current dir = %s\r\n\r\nParameters = %s", CurDir, str);
	MessageBox(NULL, str2, "", MB_APPLMODAL | MB_OK);
//  return 0;
#endif

	if (str[0] != '"')
		GetString(str, str2);
	else
		GetQuoteString(str, str2);

//  MessageBox(NULL,str2,"Parameters",MB_APPLMODAL|MB_OK);

	strp = str;

	while ((*strp) && (*strp == ' '))
		strp++;

	strcpy(str3, strp);

//  MessageBox(NULL,str3,"Parameters2",MB_APPLMODAL|MB_OK);
	if (str3[0] != '"')
		strcpy(str4, str3);
	else
	{
		strcpy(str4, &str3[1]);
		res = strlen(str4);

		if ((res > 0) && (str4[res - 1] == '\"'))
			str4[res - 1] = 0;
	}

//  sprintf(Parameters,"-r %s",str4);

	if (strncmp(str4, "-p,", 3) == 0)
	{
		GetString(str4, Options);
		memmove(&Options[0], &Options[3], 300);
	}

	if (Options[0])
	{
		GetCommaString(Options, Options1);
		GetCommaString(Options, Options2);
		GetCommaString(Options, Options3);
	}

#if 0

	if (Options1[0])
		MessageBox(NULL, Options1, "Options1", MB_APPLMODAL | MB_OK);

	if (Options2[0])
		MessageBox(NULL, Options2, "Options2", MB_APPLMODAL | MB_OK);

	if (Options3[0])
		MessageBox(NULL, Options3, "Options3", MB_APPLMODAL | MB_OK);

#endif

	if (strcmp(Options1, "print") == 0)
	{
		if (SharedMemory)
		{
			sprintf(str2, "ProcessesReady=0x%x\r\nProcessesStart=0x%x\r\nProcessesResultError=0x%x", *ProcessesReady,
			        *ProcessesStart, *ProcessesResultError);
			MessageBox(NULL, str2, "", MB_APPLMODAL | MB_OK);
			return 0;
		}

		return -1;
	}

	if (strcmp(Options1, "stop") == 0)
	{
		if (SharedMemory)
		{
			*FullStop = 1;

			QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
			hulp = (Counter - *StartCounter) * 1000;
			hulp /= CurrentFrequency;
			fp = fopen("buildtime.txt", "w+");

			if (fp)
			{
				fprintf(fp, "Build time is %d.%d sec\r\n", (int32) (hulp / 1000), (int32) (hulp % 1000));
				fclose(fp);
			}

			return 1;
		}

		return -1;
	}

	if (strcmp(Options1, "module_stop") == 0)
	{
		if (SharedMemory)
		{
			*ModuleStop = 1;
			return 1;
		}

		return -1;
	}


	if (strcmp(Options1, "check_error") == 0)
	{
		if (SharedMemory)
		{
			Mask = atoi(Options2);

			if (Mask)
			{
				if (*ProcessesResultError & Mask)
					return 1;
				else
					return 0;
			}
		}

		return -1;
	}

	if (strcmp(Options1, "result_ok") == 0)
	{
		if (SharedMemory)
		{
			*ProcessesResultOk = atoi(Options2);
			return 1;
		}

		return -1;
	}

	if (strcmp(Options1, "result_error") == 0)
	{
		if (SharedMemory)
		{
			*ProcessesResultError = atoi(Options2);
			return 1;
		}

		return -1;
	}

	if (strcmp(Options1, "s") == 0)
	{
		if (!SharedMemory)
		{
			MessageBox(NULL, "No shared memory (s)", "Error", MB_APPLMODAL | MB_OK);
			return -1;
		}

		// mark process start
		ProcessMask = atoi(Options2);

		if (ProcessMask)
			*ProcessesReady |= ProcessMask;

		return 1;
	}

	if (strcmp(Options1, "f") == 0)
	{
		if (!SharedMemory)
		{
			MessageBox(NULL, "No shared memory (f)", "Error", MB_APPLMODAL | MB_OK);
			return -1;
		}

		// mark process finished
		ProcessMask = atoi(Options2);

		if (ProcessMask)
			*ProcessesReady &= ~ProcessMask;

		return 1;
	}

	if (str4[0])
		RunConsoleCommand(str4);

	if (strcmp(Options1, "p") == 0)
	{
		if (!SharedMemory)
		{
			MessageBox(NULL, "No shared memory (p)", "Error", MB_APPLMODAL | MB_OK);
			return -1;
		}

		// mark process monitoring start
		*ProcessesStart = 1;
		QueryPerformanceCounter((LARGE_INTEGER *) StartCounter);

		// wait until process monitoring finished
		while (1)
		{
			if (*FullStop)
				break;

			Sleep(100);
		}

		return 1;
	}

	if (strcmp(Options1, "w") == 0)
	{
		if (!SharedMemory)
		{
			MessageBox(NULL, "No shared memory (w)", "Error", MB_APPLMODAL | MB_OK);
			return -1;
		}

		WaitMask = atoi(Options2);
		MaxWait = atoi(Options3) * 1000;
#if 0
		Sleep(2000);
		sprintf(str, "Waiting for %d %d %d (mask=%d) (max wait=%d msec)\n", *ProcessesReady, *ProcessesStart,
		        SharedMemoryInfo, WaitMask, MaxWait);
		MessageBox(NULL, str, "Message", MB_APPLMODAL | MB_OK);
#endif

		if (MaxWait == 0)
			MaxWait = 10000;

		WaitCnt = 0;

		if (WaitMask)
		{
			while (WaitCnt < MaxWait)
			{
				if (*ProcessesStart)
				{
					if ((*ProcessesReady & WaitMask) == 0)
						break;
				}

				if (*FullStop)
					break;

				Sleep(100);
				WaitCnt += 100;
			}

			*ProcessesStart |= 2;
		}

//      printf("Waiting for %d (mask=%d) (max wait=%d msec)\n",*ProcessesReady,WaitMask,MaxWait);
	}


	return 1;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
