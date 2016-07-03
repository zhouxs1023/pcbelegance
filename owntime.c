/*
 * PCB elegance (Open source tools for making printed circuit boards)
 *
 * Copyright (C) 2012  Herman Morsink Vollenbroek
 *
 * File: owntime.c
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
#include "stdio.h"
#include "windows.h"
#include "time.h"
#include "owntime.h"
#include "date.h"

#define MAX_PERFORMANCE_COUNT   256

int64 Counter0, Counter1, Counter2, Counter3, Counter4, Counter5, Counter6, Counter7, CurrentFrequency;	// pointer to counter value

char PerformanceStrings[MAX_PERFORMANCE_COUNT][64];
int32 PerformanceCount = 0;

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer0()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter0);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer0(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter0) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return 0;
	else
		return 1;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer0inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter0) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer0inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter0) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer1()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter1);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer1(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter1) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return 0;
	else
		return 1;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer1inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter1) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer1inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter1) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer2()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter2);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer2(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter2) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return 0;
	else
		return 1;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer2inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter2) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer2inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter2) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer3()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter3);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer3(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter3) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return FALSE;
	else
		return TRUE;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer3inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter3) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer3inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter3) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer4()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter4);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer4(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter4) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return FALSE;
	else
		return TRUE;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer4inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter4) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer4inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter4) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer5()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter5);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer5(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter5) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return FALSE;
	else
		return TRUE;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer5inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter5) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer5inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter5) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer6()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter6);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer6(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter6) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return FALSE;
	else
		return TRUE;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer6inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter6) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer6inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter6) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void SetTimer7()
{
	QueryPerformanceCounter((LARGE_INTEGER *) & Counter7);
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 CheckTimeOutTimer7(int32 ulNrMilliSeconds)
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = ((Counter - Counter7) * 1000) / CurrentFrequency;

	if (hulp < (int64) ulNrMilliSeconds)
		return FALSE;
	else
		return TRUE;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer7inMilliSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter7) * 1000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 GetDifferenceTimer7inMicroSeconds()
{
	int64 Counter, hulp;

	QueryPerformanceCounter((LARGE_INTEGER *) & Counter);
	hulp = (Counter - Counter7) * 1000000;
	hulp /= CurrentFrequency;
	return (int32) hulp;
}


// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void InitTimers()
{
	QueryPerformanceFrequency((LARGE_INTEGER *) & CurrentFrequency);
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void AddPerformanceValue(LPSTR String)
{
	if (PerformanceCount >= MAX_PERFORMANCE_COUNT)
		return;

	sprintf(PerformanceStrings[PerformanceCount++], "%s   [  %d  ms  ]\r\n", String,
	        GetDifferenceTimer0inMilliSeconds());
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void AddPerformanceValue2(LPSTR String)
{
	float value;

	if (PerformanceCount >= MAX_PERFORMANCE_COUNT)
		return;

	value = (float) GetDifferenceTimer0inMicroSeconds() / 1000;
//  sprintf(PerformanceStrings[PerformanceCount++],"%s   [  %.3f  �s  ]\r\n",String,value);
	sprintf(PerformanceStrings[PerformanceCount++], "%s   [  %.3f  ms  ]\r\n", String, value);
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void WritePerformanceStrings()
{
	int32 cnt;

	for (cnt = 0; cnt < PerformanceCount; cnt++)
		OutputDebugString(PerformanceStrings[cnt]);
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

void ResetPerformanceStrings()
{
	PerformanceCount = 0;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
