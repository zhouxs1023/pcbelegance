/*
 * PCB elegance (Open source tools for making printed circuit boards)
 *
 * Copyright (C) 2012  Herman Morsink Vollenbroek
 *
 * File: zip2exe.c 
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



#include <stdio.h>
#include "owntypes.h"
#include "files2.h"


#define ZipIdentString   "PCBEL4vkdK24mX8a7"
#define BUF_SIZE         256*1024

typedef struct {
      char Ident[16];
      char ExtractDir[64];
      char Command[128];
      char Message[256];
      char Dummy[64];
      int32 Options;
      int32 ZipFileStart;
    } ZipIdentRecord;

char   Buf[BUF_SIZE];

unsigned char crc32_table[256];

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
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

int32 main(int32 argc,char **argv)

{
  char ExecutableName[200],ZipName[200],ZipExtractDir[200],Command[20],
       str[200],str2[200],str3[200],StartUpStr[200];
  int32  ok,cnt3,cnt4,result,fp,fp2,LengthInstallTool,
         crccnt,ExeLength,WriteResult,cnt,cnt2;
  uint32 crc;
  ZipIdentRecord ZipIdent;

  if (argc<4) {
    printf("Usage:\n");
    printf(":\n");
    printf("zip2exe <exe-name> <zip-file> <install-tool>\n");
//    printf("zip2exe <exe-name> <zip-file> <unzip-tool> [unzip-dir] [command]\n");
    return -3;
  }
  strcpy(str,argv[0]);
  Init_CRC32_Table();
  if (FileExists(argv[2])!=0) {
    printf("zip-file %s does not exist\n",argv[2]);
    return -3;
  }
  if (FileExists(argv[3])!=0) {
    printf("unzip-tool %s does not exist\n",argv[3]);
    return -3;
  }
  LengthInstallTool=FileSize(argv[3]);
  fp=FileOpenReadOnly(argv[3]);
  if (fp<=0) {
    FileClose(fp);
    return -3;
  }
  fp2=FileOpenWrite(argv[1]);
  if (fp2<=0) {
    FileClose(fp);
    return -3;
  }
  result=1;
  while (result>0) {
    FileRead(fp,Buf,BUF_SIZE,&result);
    if (result>0) {
      FileWrite(fp2,Buf,result,&WriteResult);
    }
  }
  FileClose(fp);
  cnt=FileCurrentPointer(fp2);
  fp=FileOpenReadOnly(argv[2]);
  if (fp<=0) {
    FileClose(fp2);
    DeleteFile(argv[1]);
    return -3;
  }
  result=1;
  while (result>0) {
    FileRead(fp,Buf,BUF_SIZE,&result);
    if (result>0) {
      FileWrite(fp2,Buf,result,&WriteResult);
    }
  }
  FileClose(fp);
  cnt=FileCurrentPointer(fp2);

  memset(&ZipIdent,0,sizeof(ZipIdent));
  strcpy(ZipIdent.Ident,ZipIdentString);
  ZipIdent.ZipFileStart=LengthInstallTool;
  FileWrite(fp2,&ZipIdent,sizeof(ZipIdent),&WriteResult);

  FileClose(fp2);

  ExeLength=FileSize(argv[1]);

  fp2=FileOpen(argv[1]);
  cnt3=ExeLength;
  crc=0xffffffff;
  crccnt=0;
  while (cnt3>0) {
    FileRead(fp2,Buf,min(cnt3,BUF_SIZE),&result);
    for (cnt4=0;cnt4<result;cnt4++) {
      crc = (crc >> 8) ^ crc32_table[(crc & 0xFF) ^ Buf[cnt4]];
      crccnt++;
    }
    cnt3-=result;
  }
  crc^=0xffffffff;

  FileSeek(fp2,ExeLength);
  FileWrite(fp2,&crc,4,&result);
  FileClose(fp2);
  printf("Ready\n");
  gets(Command);
  ok=1;
  return 0;
}


