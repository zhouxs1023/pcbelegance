

#include "owntypes.h"
#include "stdio.h"
#include "windows.h"
#include "string.h"
#include "files2.h"

#define  MEMORYMAPPEDSTRING   "MERCO_DEBUG_MAP_FILE"

#define  DEBUG_MAGIC1         0x4b72c190
#define  DEBUG_MAGIC2         0xb209df4c

HANDLE      SharedMemoryHandle;
char        *SharedMemory;
HGLOBAL     SharedMemGlobal;

char        *buf,*buf3,*SharedMemory;

int32       SharedMemSize,bufp,bufp_temp,extended_buf,bufsize,bufsize2,
            MaxStringLength,*SharedMemoryPos,*SharedMemoryLength,*OptionsP;

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

int copy_from_buf(char *newbuf,int length,int mode)

{
  int length2,pos,bufp_temp2;

  switch (mode) {
    case 0: // reverse
      bufp_temp-=length;
      if (bufp_temp<0) {
        bufp_temp+=bufsize;
      }
      bufp_temp2=bufp_temp;
      if (bufp_temp2+length>bufsize) {
        length2=bufsize-bufp_temp2;
        pos=length2;
        memcpy(newbuf,&buf[bufp_temp2],length2);
        length2=length-pos;
        bufp_temp2=0;
        memcpy(&newbuf[pos],&buf[bufp_temp2],length2);
      } else {
        memcpy(newbuf,&buf[bufp_temp2],length);
      }
      break;
    case 1: // forward
      if (bufp_temp+length>bufsize) {
        length2=bufsize-bufp_temp;
        pos=length2;
        memcpy(newbuf,&buf[bufp_temp],length2);
        length2=length-pos;
        bufp_temp=0;
        memcpy(&newbuf[pos],&buf[bufp_temp],length2);
        bufp_temp+=length2;
      } else {
        memcpy(newbuf,&buf[bufp_temp],length);
        bufp_temp+=length;
      }
      break;
  }

  return 0;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

int main(int argc, char **argv)
{
  int  length,length2,cnt,fp,check_num1,check_num2,dummy,found,new_bufp,
       result,buf_size_mb,last_bufp=0;
  char command[20],str[200];

  if (argc<1) {
    printf("Usage debugmem [file]\n");
    return 0;
  }

  buf_size_mb=64;
  bufsize=buf_size_mb*1024*1024;
  SharedMemSize=bufsize+4096;
  if (!(SharedMemoryHandle = CreateFileMapping((HANDLE)0xffffffff,NULL,PAGE_READWRITE,
                                               0,SharedMemSize,MEMORYMAPPEDSTRING))) {
    printf("Could not get shared memory\n");
    return -1;
  }
  if (!(SharedMemory=(char *)MapViewOfFile(SharedMemoryHandle,FILE_MAP_ALL_ACCESS,0,0,0))) {
    printf("Could not get shared memory\n");
    return -1;
  }
  memset(SharedMemory,0,SharedMemSize);
  printf("Shared memory =0x%08x\n",(int32)SharedMemory);
  SharedMemoryPos=(int32 *)&SharedMemory[0];
  SharedMemoryLength=(int32 *)&SharedMemory[4];
  OptionsP=(int32 *)&SharedMemory[12];
  *(int32 *)&SharedMemory[32]=DEBUG_MAGIC1;
  *(int32 *)&SharedMemory[36]=DEBUG_MAGIC2;
  *SharedMemoryLength=SharedMemSize;
  *SharedMemoryPos=4096;

  printf("Press enter to save the debug memory\n");
  gets( command );

// ****************************************************************************************************
// ****************************************************************************************************

  MaxStringLength=*(int32 *)&SharedMemory[8];
  if (MaxStringLength<200) MaxStringLength=200;
  bufp=*SharedMemoryPos;
  printf("Debug mem size =%d\n",bufsize);
  printf("Debug buf index=%d\n",bufp);

  buf=malloc(bufsize);
  if (!buf) {
    printf("Could not get memory for buf\n");
    return -1;
  }
  buf3=malloc(bufsize);
  if (!buf3) {
    printf("Could not get memory for buf3\n");
    return -1;
  }
  memset(buf3,0,bufsize);
  memcpy(buf,SharedMemory+4096,bufsize);
  bufp-=4096;
#if 0
  strcpy(str,"buf.bin");
  DeleteFile(str);
  fp=FileOpenWrite(str);
  if (fp>0) {
    FileWrite(fp,buf,bufsize,&result);
    FileWrite(fp,&bufp,4,&result);
    FileClose(fp);
  }
#endif
//    spmrtdattrace(TRACE_DEC,"wireshark_to_pcap line",__LINE__);

  bufp_temp=bufp;
  found=0;
  for (cnt=0;cnt<1000000;cnt++) {
    copy_from_buf((char *)&length,4,0);
    if ((length>0)
       &&
       (length<MaxStringLength)) {
      copy_from_buf(buf3,length,0);
      copy_from_buf((char *)&dummy,4,0);
      copy_from_buf((char *)&check_num2,4,0);
      copy_from_buf((char *)&check_num1,4,0);
      if ((check_num1==DEBUG_MAGIC1)
         &&
         (check_num2==DEBUG_MAGIC2)) {
//                printf("Packet (0x%06x) length %d  (%12.6f)\n",bufp_temp,length,new_time);
        found++;
        last_bufp=bufp_temp;
      } else {
        break;
      }
    } else {
      break;
    }
  }
  printf("Found %d debug lines\n",found);
  bufp_temp=last_bufp;
  new_bufp=0;
  for (cnt=0;cnt<found;cnt++) {
    copy_from_buf((char *)&dummy,4,1);
    copy_from_buf((char *)&dummy,4,1);
    copy_from_buf((char *)&length,4,1);
    copy_from_buf(&buf3[new_bufp],length,1);
    length2=min(MaxStringLength,strlen(&buf3[new_bufp]));
    copy_from_buf((char *)&dummy,4,1);
    new_bufp+=length2;
    if (new_bufp>bufsize-500) {
      break;
    }
//        printf("cnt = %d\n",cnt);
  }
//    printf("bytes to write = %d\n",new_bufp);
//    return 0;

  if (argc==2) {
    strcpy(str,argv[1]);
  } else {
    strcpy(str,"debugmem.txt");
  }
  fp=FileOpenWrite(str);
  if (fp>0) {
    FileWrite(fp,buf3,new_bufp,&result);
    FileClose(fp);
  }
  UnmapViewOfFile(SharedMemory);
  CloseHandle(SharedMemoryHandle);
  printf("Press enter to continue\n");
  gets( command );
  return 0;
}

// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************
// ****************************************************************************************************

