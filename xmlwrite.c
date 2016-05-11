
#include "owntypes.h"
#include "stddef.h"
#include "stdio.h"
#include "windows.h"
#include "files2.h"
#include "date.h"
#include "pcbtypes.h"
#include "schtypes.h"




char TabString[]="\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t";

char TabStrings[10][16]={"",
                         "\t",
                         "\t\t",
                         "\t\t\t",
                         "\t\t\t\t",
                         "\t\t\t\t\t",
                         "\t\t\t\t\t\t",
                         "\t\t\t\t\t\t\t",
                         "\t\t\t\t\t\t\t\t",
                         "\t\t\t\t\t\t\t\t\t"};

int32    StandardUnits=UNITS_MM,ok,
         MessageBufMemSize,MessageBufPos,
         MaxTempMemory,MaxTempMemory2,MaxTempMemory3;


HGLOBAL  MessageBufGlobal,GlobalTempMem,GlobalTempMem2,GlobalTempMem3;
uint8    *MessageBuf,*TempMem,*TempMem2,*TempMem3;

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 AllocateMemTemp(int32 MemSize)

{
  HGLOBAL NewMem;

  MemSize=max(MemSize,256*1024);
  if (MaxTempMemory==0) {
    if ((GlobalTempMem=GlobalAlloc(GHND,MemSize))==NULL) {
      return -1;
    }
    if ((TempMem=GlobalLock(GlobalTempMem))==NULL) {
      return -1;
    }
    MaxTempMemory=MemSize;
  } else {
    if ((NewMem=GlobalReAlloc(GlobalTempMem,MemSize,GHND))==NULL) {
      return -1;
    }
    GlobalTempMem=NewMem;
    if ((TempMem=GlobalLock(GlobalTempMem))==NULL) {
      return -1;
    }
    MaxTempMemory=MemSize;
  }
  return 0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 AllocateMemTemp2(int32 MemSize)

{
  HGLOBAL NewMem;

  MemSize=max(MemSize,256*1024);
  if (MaxTempMemory2==0) {
    if ((GlobalTempMem2=GlobalAlloc(GHND,MemSize))==NULL) {
      return -1;
    }
    if ((TempMem2=GlobalLock(GlobalTempMem2))==NULL) {
      return -1;
    }
    MaxTempMemory2=MemSize;
  } else {
    if ((NewMem=GlobalReAlloc(GlobalTempMem2,MemSize,GHND))==NULL) {
      return -1;
    }
    GlobalTempMem2=NewMem;
    if ((TempMem2=GlobalLock(GlobalTempMem2))==NULL) {
      return -1;
    }
    MaxTempMemory2=MemSize;
  }
  return 0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 AllocateMemTemp3(int32 MemSize)

{
  HGLOBAL NewMem;

  MemSize=max(MemSize,256*1024);
  if (MaxTempMemory3==0) {
    if ((GlobalTempMem3=GlobalAlloc(GHND,MemSize))==NULL) {
      return -1;
    }
    if ((TempMem3=GlobalLock(GlobalTempMem3))==NULL) {
      return -1;
    }
    MaxTempMemory3=MemSize;
  } else {
    if ((NewMem=GlobalReAlloc(GlobalTempMem3,MemSize,GHND))==NULL) {
      return -1;
    }
    GlobalTempMem3=NewMem;
    if ((TempMem3=GlobalLock(GlobalTempMem3))==NULL) {
      return -1;
    }
    MaxTempMemory3=MemSize;
  }
  return 0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************


int32 AllocateMemMessageBuf(int32 MemSize)

{
  HGLOBAL NewMem;

  if (MessageBufMemSize==0) {
    MemSize=max(1024*1024,MemSize);
    if ((MessageBufGlobal=GlobalAlloc(GHND,MemSize))==NULL) {
      return -1;
    }
    if ((MessageBuf=(uint8 *)GlobalLock(MessageBufGlobal))==NULL) {
      return -1;
    }
  } else {
    if ((NewMem=GlobalReAlloc(MessageBufGlobal,MemSize,GHND))==NULL) {
      return -1;
    }
    MessageBufGlobal=NewMem;
    if ((MessageBuf=(uint8 *)GlobalLock(MessageBufGlobal))==NULL) {
      return -1;
    }
  }
  MessageBufMemSize=MemSize;
//  MaxNrObjects=Count;
  return 0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void DeAllocateMemMessageBuf()

{
  if (MessageBufGlobal!=NULL) {
    GlobalUnlock(MessageBufGlobal);
    GlobalFree(MessageBufGlobal);
  }
  MessageBufMemSize=0;
  MessageBufGlobal=NULL;
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 AddToMessageBuf(LPSTR Line)

{
  int32  lengte;

  lengte=strlen(Line);
#ifdef _DEBUG
  if (stricmpOwn(Line,"-0.571 w")==0) {
    ok=1;
  }
#endif
  if (lengte+4+MessageBufPos>=MessageBufMemSize) {
    if (AllocateMemMessageBuf(MessageBufMemSize+1024*1024)!=0) return -1;
  }
  if (MessageBufPos==0) MessageBuf[0]=0;

  if (lengte>0) {
    memcpy((LPSTR)&MessageBuf[MessageBufPos],Line,lengte);
    MessageBufPos+=lengte;
  }
  strcpy((LPSTR)&MessageBuf[MessageBufPos],"\r\n");
  MessageBufPos+=2;
  return 0;
}

// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************
// *******************************************************************************************************

double ConvertToUnits(int32 Units,double value)

{
  switch (Units) {
    case UNITS_MILS:
      value/=2540.0;
      break;
    case UNITS_MM:
      value/=100000.0;
      break;
    case UNITS_INCH:
      value/=2540000.0;
      break;
    case UNITS_0_01MM:
      value/=1000.0;
      break;
    case UNITS_HPGL:
      value/=2500.0;
      break;
    case UNITS_0_1MILS:
      value/=254.0;
      break;
    case UNITS_0_1MM:
      value/=10000.0;
      break;
    case UNITS_MICRON:
      value/=100.0;
      break;
    case UNITS_100MILS:
      value*=2.54;
      break;
  }
  return value;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 GetUnitsValue(int32 Units,double value,LPSTR str,int32 mode)

{
  double  NewValue;
  NewValue=ConvertToUnits(Units,value);
  if ((mode & 1)==0) {
    NewValue*=1.000000001;
  } else {
    NewValue*=1.0000000001;
  }
  switch (Units) {
    case UNITS_MILS:
      if ((mode & 1)==0) {
        sprintf(str,"%.2f",NewValue);
      } else {
        sprintf(str,"%.4f",NewValue);
      }
      StripAppendingZeros(str,0);
      break;
    case UNITS_MM:
      if ((mode & 1)==0) {
        sprintf(str,"%.4f",NewValue);
      } else {
        sprintf(str,"%.7f",NewValue);
      }
      StripAppendingZeros(str,0);
      break;
    case UNITS_INCH:
      if ((mode & 1)==0) {
        sprintf(str,"%.5f",NewValue);
      } else {
        sprintf(str,"%.8f",NewValue);
      }
      StripAppendingZeros(str,0);
      break;
    case UNITS_HPGL:
      if ((mode & 1)==0) {
        sprintf(str,"%.2f",NewValue);
      } else {
        sprintf(str,"%.5f",NewValue);
      }
      break;
    case UNITS_0_01MM:
      if ((mode & 1)==0) {
        sprintf(str,"%.2f",NewValue);
      } else {
        sprintf(str,"%.5f",NewValue);
      }
      break;
    case UNITS_0_1MILS:
      if ((mode & 1)==0) {
        sprintf(str,"%.1f",NewValue);
      } else {
        sprintf(str,"%.4f",NewValue);
      }
      break;
    case UNITS_0_1MM:
      if ((mode & 1)==0) {
        sprintf(str,"%.3f",NewValue);
      } else {
        sprintf(str,"%.6f",NewValue);
      }
      break;
    case UNITS_MICRON:
      if ((mode & 1)==0) {
        sprintf(str,"%.1f",NewValue);
      } else {
        sprintf(str,"%.4f",NewValue);
      }
      break;
    case UNITS_100MILS:
      if ((mode & 1)==0) {
        sprintf(str,"%.2f",NewValue);
      } else {
        sprintf(str,"%.5f",NewValue);
      }
      StripAppendingZeros(str,0);
      break;
  }
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWritePoints(int32 NrTabs,char *XmlString,double *Points,int32 NrPoints,int32 Units)

{
  char  str[400],str2[200],*strp;
  int32 cnt;
  double *PointsP;

  PointsP=Points;
  sprintf(str,"%s<%s>",TabStrings[NrTabs],XmlString);
  for (cnt=0;cnt<NrPoints;cnt++) {
    GetUnitsValue(Units,*PointsP,str2,1);
    strcat(str2,",");
    PointsP++;
    strcat(str,str2);
    if (strlen(str)>70) {
      AddToMessageBuf(str);
      strcpy(str,TabStrings[NrTabs+1]);
    }
  }
  sprintf(str2,"</%s>",XmlString);
  strcat(str,str2);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWritePoints2(int32 NrTabs,char *XmlString,float *Points,int32 NrPoints,int32 Units)

{
  char  str[400],str2[200],*strp;
  int32 cnt;
  float *PointsP;

  PointsP=Points;
  sprintf(str,"%s<%s>",TabStrings[NrTabs],XmlString);
  for (cnt=0;cnt<NrPoints;cnt++) {
    GetUnitsValue(Units,*PointsP,str2,1);
    strcat(str2,",");
    PointsP++;
    strcat(str,str2);
    if (strlen(str)>70) {
      AddToMessageBuf(str);
      strcpy(str,TabStrings[NrTabs+1]);
    }
  }
  sprintf(str2,"</%s>",XmlString);
  strcat(str,str2);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteInts(int32 NrTabs,char *XmlString,int32 *Values,int32 NrValues)

{
  char  str[400],str2[200],*strp;
  int32 cnt;

  sprintf(str,"%s<%s>",TabStrings[NrTabs],XmlString);
  for (cnt=0;cnt<NrValues;cnt++) {
    sprintf(str2,"%d,",Values[cnt]);
    strcat(str2,",");
    strcat(str,str2);
    if (strlen(str)>70) {
      AddToMessageBuf(str);
      strcpy(str,TabStrings[NrTabs+1]);
    }
  }
  sprintf(str2,"</%s>",XmlString);
  strcat(str,str2);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteInt(int32 NrTabs,char *XmlString,int32 Value)

{
  char  str[400];

  sprintf(str,"%s<%s>%d</%s>",TabStrings[NrTabs],XmlString,Value,XmlString);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteUInt(int32 NrTabs,char *XmlString,uint32 Value)

{
  char  str[400];

  sprintf(str,"%s<%s>%d</%s>",TabStrings[NrTabs],XmlString,Value,XmlString);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteString(int32 NrTabs,char *XmlString,char *String)

{
  char  str[1024];
  char  str2[1024];
  int32 cnt,cnt2;
/*
"quot;"      ,"&#34;",
"amp;"       ,"&#38;",
"lt;"        ,"&#60;",
"gt;"        ,"&#62;",
*/
  cnt2=0;
  for (cnt=0;cnt<(int32)strlen(String);cnt++) {
    switch (String[cnt]) {
      case '<':
        str2[cnt2]='&';
        cnt2++;
        str2[cnt2]='l';
        cnt2++;
        str2[cnt2]='t';
        cnt2++;
        str2[cnt2]=';';
        cnt2++;
        break;
      case '>':
        str2[cnt2]='&';
        cnt2++;
        str2[cnt2]='g';
        cnt2++;
        str2[cnt2]='t';
        cnt2++;
        str2[cnt2]=';';
        cnt2++;
        break;
      case '\"':
        str2[cnt2]='&';
        cnt2++;
        str2[cnt2]='q';
        cnt2++;
        str2[cnt2]='u';
        cnt2++;
        str2[cnt2]='o';
        cnt2++;
        str2[cnt2]='t';
        cnt2++;
        str2[cnt2]=';';
        cnt2++;
        break;
      case '&':
        str2[cnt2]='&';
        cnt2++;
        str2[cnt2]='a';
        cnt2++;
        str2[cnt2]='m';
        cnt2++;
        str2[cnt2]='p';
        cnt2++;
        str2[cnt2]=';';
        cnt2++;
        break;
      case '\n':
        str2[cnt2]='&';
        cnt2++;
        str2[cnt2]='#';
        cnt2++;
        str2[cnt2]='1';
        cnt2++;
        str2[cnt2]='0';
        cnt2++;
        str2[cnt2]=';';
        cnt2++;
        break;
      case '\r':
        str2[cnt2]='&';
        cnt2++;
        str2[cnt2]='#';
        cnt2++;
        str2[cnt2]='1';
        cnt2++;
        str2[cnt2]='3';
        cnt2++;
        str2[cnt2]=';';
        cnt2++;
        break;
#if 0
      case ' ':
        str2[cnt2]='&';
        cnt2++;
        str2[cnt2]='n';
        cnt2++;
        str2[cnt2]='b';
        cnt2++;
        str2[cnt2]='s';
        cnt2++;
        str2[cnt2]='p';
        cnt2++;
        str2[cnt2]=';';
        cnt2++;
        break;
#endif
      default:
        str2[cnt2]=String[cnt];
        cnt2++;
        break;
    }
  }
  str2[cnt2]=0;

  sprintf(str,"%s<%s>%s</%s>",TabStrings[NrTabs],XmlString,str2,XmlString);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteFloat(int32 NrTabs,char *XmlString,double Value,int32 Units)

{
  char  str[400],str2[200];

  GetUnitsValue(Units,Value,str2,1);
  sprintf(str,"%s<%s>%s</%s>",TabStrings[NrTabs],XmlString,str2,XmlString);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteFloat2(int32 NrTabs,char *XmlString,double Value,int32 FloatDigits)

{
  char  str[400],str2[200];

  sprintf(str2,"%.*f",FloatDigits,Value);
  StripAppendingZeros(str2,0);
  sprintf(str,"%s<%s>%s</%s>",TabStrings[NrTabs],XmlString,str2,XmlString);
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteTrace(int32 NrTabs,TraceRecord *Trace,int32 TraceType)

{
  char  str[400];
  double Coor[4];
/*
typedef struct {
          float X,Y,Length;
          int16 NetNr,Info;
          int32 Layer;
          float ThickNess,Clearance;
          int16 AddNr,DeleteNr;
        } TraceRecord ;

        <Trace>
          <Coor>4.0,3.0,8.0,5.0</Coor>
          <TraceWidth>1.0</TraceWidth>
          <Clearance>1.0</Clearance>
          <NetNr>1</NetNr>
          <Info>0</Info>
        </Trace>

*/
  sprintf(str,"%s<Trace>",TabStrings[NrTabs]);
  AddToMessageBuf(str);

  Coor[0]=Trace->X;
  Coor[1]=Trace->Y;
  switch (TraceType) {
    case TRACE_HOR:
      Coor[2]=Trace->X+Trace->Length;
      Coor[3]=Trace->Y;
      break;
    case TRACE_VER:
      Coor[2]=Trace->X;
      Coor[3]=Trace->Y+Trace->Length;
      break;
    case TRACE_DIAG1:
      Coor[2]=Trace->X+Trace->Length;
      Coor[3]=Trace->Y-Trace->Length;
      break;
    case TRACE_DIAG2:
      Coor[2]=Trace->X+Trace->Length;
      Coor[3]=Trace->Y+Trace->Length;
      break;
  }
  XmlWritePoints(NrTabs+1,"Coor",&Coor[0],4,StandardUnits);
  XmlWriteFloat(NrTabs+1,"TraceWidth",Trace->ThickNess,StandardUnits);
  XmlWriteFloat(NrTabs+1,"Clearance",Trace->Clearance,StandardUnits);
  XmlWriteInt(NrTabs+1,"NetNr",Trace->NetNr);
  XmlWriteInt(NrTabs+1,"Info",Trace->Info);

  sprintf(str,"%s</Trace>",TabStrings[NrTabs]);
  AddToMessageBuf(str);
  return 0;
}


// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteVia(int32 NrTabs,ViaRecord *Via,int32 mode)

{
  char  str[400];
  double Coor[4];
/*
typedef struct {
          int16 ViaType,NetNr;
          float X,Y,ThickNess,DrillThickNess,
                ThermalInner,Clearance,SoldMask;
          int32 Layer;
          int16 Info,AddNr,DeleteNr,Dummy;
        } ViaRecord ;

      <Via>
        <ViaTypeNr>1</ViaTypeNr>
        <Center>1.0,1.0</Center>
        <Diameter>1.0</Diameter>
        <ThermalInner>1.0</ThermalInner>
        <SoldMask>1.0</SoldMask>
        <DrillDiameter>1.0</DrillDiameter>
        <Clearance>1.0</Clearance>
        <NetNr>1</NetNr>
        <Layers>-1</Layers>
        <Info>0</Info>
      </Via>

*/
  if (mode==0) {
    sprintf(str,"%s<Via>",TabStrings[NrTabs]);
  } else {
    sprintf(str,"%s<ViaDefinition>",TabStrings[NrTabs]);
  }

  AddToMessageBuf(str);
  if (mode==0) {
    XmlWriteInt(NrTabs+1,"ViaTypeNr",Via->ViaType);
    Coor[0]=Via->X;
    Coor[1]=Via->Y;
    XmlWritePoints(NrTabs+1,"Center",&Coor[0],2,StandardUnits);
  }
  XmlWriteFloat(NrTabs+1,"Diameter",Via->ThickNess,StandardUnits);
  XmlWriteFloat(NrTabs+1,"DrillThickNess",Via->DrillThickNess,StandardUnits);
  XmlWriteFloat(NrTabs+1,"Clearance",Via->Clearance,StandardUnits);
  XmlWriteFloat(NrTabs+1,"ThermalInner",Via->ThermalInner,StandardUnits);
  XmlWriteFloat(NrTabs+1,"SoldMask",Via->SoldMask,StandardUnits);
  if (mode==0) {
    XmlWriteInt(NrTabs+1,"NetNr",Via->NetNr);
  }
  XmlWriteInt(NrTabs+1,"Layers",Via->Layer);
  XmlWriteInt(NrTabs+1,"Info",Via->Info);

  if (mode==0) {
    sprintf(str,"%s</Via>",TabStrings[NrTabs]);
  } else {
    sprintf(str,"%s</ViaDefinition>",TabStrings[NrTabs]);
  }
  AddToMessageBuf(str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlWriteComp(int32 NrTabs,CompRecord *Comp)

{
  char  str[400],str2[400],*CompPropertiesBuf,*strp1,*strp2,*CompP;
  double Coor[4];
  int32 Mirror,cnt,length1,length2;
  CompPinRecord *CompPin;

/*
typedef struct {
          int32 MemSize,PinOffset;
          int16 ShapeNr,NrPins,CompMode,Info,AddNr,DeleteNr,
                Info2,Info3,Info4,Info5;
          float CompOriginX,CompOriginY,CompHeight,
                PlacementOriginX,PlacementOriginY,
                PlacementWidth,PlacementHeight;
          int32 TextVisibility;
          float Rotation,CompNameRotation,CompValueRotation,Dummy;
          float CompNameOriginX,CompNameOriginY,CompNameHeight,CompNamePenThickNess,
                CompValueOriginX,CompValueOriginY,CompValueHeight,CompValuePenThickNess,
                BoardPosMinX,BoardPosMinY,BoardPosMaxX,BoardPosMaxY,
                DummyX1,DummyY1,DummyX2,DummyY2,
                PinMaximumClearance;
          char  Name[16],
                Value[32],
                PartNr[32],
                PartDescription[32],
                ShapeName[32],
                Sheet[32],
                PCBGroup[16],
                Options[16];
          char  Properties[256];
        } CompRecord ;

typedef struct {
          int32 NetNr;
        } CompPinRecord ;


      <Component>
        <Name>test</Name>
        <Geometry>test</Geometry>
        <Value>test</Value>
        <PartNr>test</PartNr>
        <PartDescription>test</PartDescription>
        <CompOrigin>10.0,10.0</CompOrigin>
        <Rotation>0.0</Rotation>
        <Mirror>0</Mirror>
        <CompNameOrigin>10.0,10.0</CompNameOrigin>
        <CompNameRotation>0.0</CompNameRotation>
        <CompNameInfo>0</CompNameInfo>
        <CompValueOrigin>10.0,10.0</CompValueOrigin>
        <CompValueRotation>0.0</CompValueRotation>
        <CompValueInfo>0</CompValueInfo>
        <Properties>
          <Property>
            <Name>test</Name>
            <Value>test</Value>
          </Property>
        </Properties>
        <NetPins>0,1,2,3</NetPins>
      </Component>

*/
  sprintf(str,"%s<Component>",TabStrings[NrTabs]);
  AddToMessageBuf(str);

  XmlWriteString(NrTabs+1,"Name",Comp->Name);
  XmlWriteString(NrTabs+1,"Geometry",Comp->ShapeName);
  XmlWriteString(NrTabs+1,"Value",Comp->Value);
  XmlWriteString(NrTabs+1,"PartNr",Comp->PartNr);
  XmlWriteString(NrTabs+1,"PartDescription",Comp->PartDescription);
  XmlWriteInt(NrTabs+1,"Info",Comp->Info);
  XmlWriteInt(NrTabs+1,"NrPins",Comp->NrPins);
  Coor[0]=Comp->CompOriginX;
  Coor[1]=Comp->CompOriginY;
  XmlWritePoints(NrTabs+1,"CompOrigin",&Coor[0],2,StandardUnits);
  XmlWriteFloat2(NrTabs+1,"Rotation",Comp->Rotation,3);
  Mirror=((Comp->CompMode & 8) >> 3);
  XmlWriteInt(NrTabs+1,"Mirror",Mirror);
  Coor[0]=Comp->CompNameOriginX;
  Coor[1]=Comp->CompNameOriginY;
  XmlWriteFloat(NrTabs+1,"CompHeight",Comp->CompHeight,StandardUnits);
  XmlWritePoints(NrTabs+1,"CompNameOrigin",&Coor[0],2,StandardUnits);
  XmlWriteFloat2(NrTabs+1,"CompNameRotation",Comp->CompNameRotation,3);
  XmlWriteFloat(NrTabs+1,"CompNameHeight",Comp->CompNameHeight,StandardUnits);
  XmlWriteFloat(NrTabs+1,"CompNamePenThickNess",Comp->CompNamePenThickNess,StandardUnits);
  XmlWriteInt(NrTabs+1,"Mirror",Mirror);
  Coor[0]=Comp->CompValueOriginX;
  Coor[1]=Comp->CompValueOriginY;
  XmlWritePoints(NrTabs+1,"CompValueOrigin",&Coor[0],2,StandardUnits);
  XmlWriteFloat2(NrTabs+1,"CompValueRotation",Comp->CompValueRotation,3);
  XmlWriteFloat(NrTabs+1,"CompValueHeight",Comp->CompValueHeight,StandardUnits);
  XmlWriteFloat(NrTabs+1,"CompValuePenThickNess",Comp->CompValuePenThickNess,StandardUnits);
  XmlWriteInt(NrTabs+1,"TextVisibility",Comp->TextVisibility);

  for (cnt=0;cnt<sizeof(Comp->Properties);cnt++) {
    if (Comp->Properties[cnt]) {
      break;
    }
  }
  if ((cnt<sizeof(Comp->Properties))
     &&
     (Comp->Properties[sizeof(Comp->Properties)-1]==0)) {
    sprintf(str,"%s<Properties>",TabStrings[NrTabs+1]);
    AddToMessageBuf(str);
    CompPropertiesBuf=strp1=(char *)Comp->Properties;
    while (1) {
      if (strp1[0]==0) {
        break;
      }
      length1=strlen(strp1);
      strp2=strp1+length1+1;
      if (strp2[0]==0) {
        break;
      }
      length2=strlen(strp2);
      sprintf(str,"%s<Property>",TabStrings[NrTabs+2]);
      AddToMessageBuf(str);
      XmlWriteString(NrTabs+3,"Name",strp1);
      XmlWriteString(NrTabs+3,"Value",strp2);
      sprintf(str,"%s</Property>",TabStrings[NrTabs+2]);
      AddToMessageBuf(str);
      strp1=strp2+length2+1;
      if (strp1>=CompPropertiesBuf+sizeof(Comp->Properties)) {
        break;
      }
    }
    sprintf(str,"%s</Properties>",TabStrings[NrTabs+1]);
    AddToMessageBuf(str);
  }
  sprintf(str,"%s<PinNetNrs>",TabStrings[NrTabs+1]);
  CompP=(char *)Comp;
  CompP+=sizeof(CompRecord);
  CompPin=(CompPinRecord *)CompP;
  for (cnt=0;cnt<Comp->NrPins;cnt++) {
    sprintf(str2,"%d,",CompPin->NetNr);
    strcat(str,str2);
    if (strlen(str)>70) {
      AddToMessageBuf(str);
      strcpy(str,TabStrings[NrTabs+2]);
    }
    CompPin++;
  }
  strcat(str,"</PinNetNrs>");
  AddToMessageBuf(str);
  sprintf(str,"%s</Component>",TabStrings[NrTabs]);
  AddToMessageBuf(str);

  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlExportGeometry(char *FileName)

{
  char  str[200],str2[200],*InstancePropertiesBuf,*strp1,*strp2;
  char  SymbolAttrBuf[4096],*PinText;
  double Coor[1024],Rotation;
  float *PointP;
  uint32 NewSeconds;
  ShapeRecord *Shape;
  PadRecord *Pad;
  ShapePadRecord *ShapePad;
  float *ShapeLines;
  GeomPolygonRecord *ObjectPolygon=NULL;
  int32 fp,Designfp,cnt,cnt2,result,BytesToRead,length1,length2,LengthFile,
        PolygonVertices=0,pos,pos2,first,PinNr,NrPins,NrLines,CircleMode,
        RotationInt,ShapeInfo,*ShapeInfoP,MemPos,
        *PolygonPointer,NrPinShapes;
  ObjectLineRecord *ObjectLine;
  ObjectRectRecord *ObjectRect;
  ObjectCircleRecord *ObjectCircle;
  ObjectArcRecord *ObjectArc;
  ObjectTextRecord *ObjectText;
  OldObjectLineRecord *OldObjectLine;
  OldObjectRectRecord *OldObjectRect;
  OldObjectCircleRecord *OldObjectCircle;
  OldObjectArcRecord *OldObjectArc;
  OldObjectTextRecord2 *OldObjectText2;
  SYSTEMTIME NewTime;
  HANDLE FileSearchHandle;
  WIN32_FIND_DATA FileData;

  FileSearchHandle=FindFirstFile(FileName,&FileData);
  if (FileSearchHandle==INVALID_HANDLE_VALUE) {
    printf ("Invalid File Handle. GetLastError reports %d\n",
            (int32)GetLastError ());
    return 0;
  }
  FindClose(FileSearchHandle);

  LengthFile=FileSize(FileName);
  if ((Designfp=FileOpenReadOnly(FileName))==-1) return -3;
  if (FileRead(Designfp,TempMem,LengthFile,&result)!=0) return 0;
  FileClose(Designfp);
  Shape=(ShapeRecord *)TempMem;

  if ((stricmp(Shape->Identification,ShapeCode)!=0)
     &&
     (stricmp(Shape->Identification,ShapeCode2)!=0)
     &&
     (stricmp(Shape->Identification,ShapeCode3)!=0)) {
    return -1;
  }

// ********************************************************************************************************

  MessageBufPos=0;
  strcpy(str,"<?xml version=\"1.0\" encoding=\"utf-8\"?>");
  AddToMessageBuf(str);
  strcpy(str,"<PcbEleganceGeometry>");
  AddToMessageBuf(str);
  sprintf(str,"%s<Info>",TabStrings[1]);
  AddToMessageBuf(str);
  GetFilePartFromFileName(str,FileName);
  CutExtensionFileName(str);
  XmlWriteString(2,"Version","5.0");
  XmlWriteString(2,"Name",str);
  XmlWriteString(2,"Revision","");
  XmlWriteString(2,"Author","");
  XmlWriteString(2,"Company","");
  FileTimeToSystemTime(&FileData.ftLastWriteTime,&NewTime);
  NewSeconds=SecondsAfter1970(NewTime.wYear,NewTime.wMonth,NewTime.wDay,
                              NewTime.wHour,NewTime.wMinute,NewTime.wSecond);

  switch (StandardUnits) {
    case UNITS_MM:
      XmlWriteString(2,"Units","mm");
      break;
    case UNITS_MILS:
      XmlWriteString(2,"Units","mils");
      break;
    case UNITS_INCH:
      XmlWriteString(2,"Units","inch");
      break;
  }
  XmlWriteFloat(2,"ShapeHeight",Shape->ShapeHeight,StandardUnits);
  Coor[0]=Shape->InsertionX;
  Coor[1]=Shape->InsertionY;
  XmlWritePoints(2,"Insertion",(double *)&Coor[0],2,StandardUnits);
  Coor[0]=Shape->ShapeNameOriginX;
  Coor[1]=Shape->ShapeNameOriginY;
  XmlWritePoints(2,"ShapeNameOrigin",(double *)&Coor[0],2,StandardUnits);
  XmlWriteFloat(2,"ShapeNameHeight",Shape->ShapeNameHeight,StandardUnits);
  XmlWriteInt(2,"ShapeNameRotation",Shape->ShapeNameRotation);
  XmlWriteInt(2,"NrPadLayers",Shape->NrLayers);

  XmlWriteUInt(2,"Date",NewSeconds);
  sprintf(str,"%s</Info>",TabStrings[1]);
  AddToMessageBuf(str);
  sprintf(str,"%s<Data>",TabStrings[1]);
  AddToMessageBuf(str);

// ********************************************************************************************************

  NrPins=Shape->NrPins;
  MemPos=Shape->PinOffset;
  PinNr=0;
  if (NrPins>0) {
    sprintf(str,"%s<Pads>",TabStrings[2]);
    AddToMessageBuf(str);
  }
  while (NrPins>0) {
    ShapePad=(ShapePadRecord *)&(TempMem[MemPos]);
    sprintf(str,"%s<Pad>",TabStrings[3]);
    AddToMessageBuf(str);
    XmlWriteString(4,"PadName",ShapePad->Name);
    NrPinShapes=ShapePad->NrPinShapes;
    MemPos+=sizeof(ShapePadRecord);
    PinText=(char *)&(ShapePad->Name);
    while (NrPinShapes>0) {
      Pad=(PadRecord *)&(TempMem[MemPos]);
      sprintf(str,"%s<SubPad>",TabStrings[4]);
      AddToMessageBuf(str);
      Coor[0]=Pad->X;
      Coor[1]=Pad->Y;
      Coor[2]=Pad->Width;
      Coor[3]=Pad->Height;
      switch (Pad->ShapeType) {
        case PIN_PUT_THROUGH_ROUND:
          XmlWriteInt(5,"PadType",PIN_PUT_THROUGH_ROUND);
          XmlWriteFloat(5,"Diam",Pad->Width,StandardUnits);
          XmlWriteFloat(5,"Drill",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          if (Pad->Special.Extra1!=0.0) {
            XmlWriteFloat(5,"InnerPad",Pad->Special.Extra1,StandardUnits);
          }
          if (Pad->Extra2!=0.0) {
            XmlWriteFloat(5,"PowerPad",Pad->Extra2,StandardUnits);
          }
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_PUT_THROUGH_SQUARE:
          XmlWriteInt(5,"PadType",PIN_PUT_THROUGH_SQUARE);
          XmlWriteFloat(5,"Width",Pad->Width,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          if (Pad->Special.Extra1!=0.0) {
            XmlWriteFloat(5,"InnerPad",Pad->Special.Extra1,StandardUnits);
          }
          if (Pad->Extra2!=0.0) {
            XmlWriteFloat(5,"PowerPad",Pad->Extra2,StandardUnits);
          }
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case DRILL:
          XmlWriteInt(5,"PadType",DRILL);
          XmlWriteFloat(5,"Diam",Pad->Width,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_PUT_THROUGH_ROUND_POWER:
          XmlWriteInt(5,"PadType",PIN_PUT_THROUGH_ROUND_POWER);
          XmlWriteFloat(5,"Diam",Pad->Width,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case DRILL_UNPLATED:
          XmlWriteInt(5,"PadType",DRILL_UNPLATED);
          XmlWriteFloat(5,"Diam",Pad->Width,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_SMD_RECT:
          XmlWriteInt(5,"PadType",PIN_SMD_RECT);
          XmlWriteFloat(5,"Width",Pad->Width,StandardUnits);
          XmlWriteFloat(5,"Height",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_SMD_ROUND:
          XmlWriteInt(5,"PadType",PIN_SMD_ROUND);
          XmlWriteFloat(5,"Diam",Pad->Width,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_LINE_HOR:
          XmlWriteInt(5,"PadType",OBJECT_LINE);
          Coor[0]=Pad->X;
          Coor[1]=Pad->Y;
          Coor[2]=Pad->X+Pad->Width;
          Coor[3]=Pad->Y;
          XmlWriteFloat(5,"ThickNess",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],4,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_LINE_VER:
          XmlWriteInt(5,"PadType",OBJECT_LINE);
          Coor[0]=Pad->X;
          Coor[1]=Pad->Y;
          Coor[2]=Pad->X;
          Coor[3]=Pad->Y+Pad->Width;
          XmlWriteFloat(5,"ThickNess",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],4,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_LINE_DIAG1:
          XmlWriteInt(5,"PadType",OBJECT_LINE);
          Coor[0]=Pad->X;
          Coor[1]=Pad->Y;
          Coor[2]=Pad->X+Pad->Width;
          Coor[3]=Pad->Y-Pad->Width;
          XmlWriteFloat(5,"ThickNess",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],4,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_LINE_DIAG2:
          XmlWriteInt(5,"PadType",OBJECT_LINE);
          Coor[0]=Pad->X;
          Coor[1]=Pad->Y;
          Coor[2]=Pad->X+Pad->Width;
          Coor[3]=Pad->Y+Pad->Width;
          XmlWriteFloat(5,"ThickNess",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],4,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case OBJECT_POLYGON:
        case PIN_SMD_POLYGON:
          XmlWriteInt(5,"PadType",PIN_SMD_POLYGON);
          ObjectPolygon=(GeomPolygonRecord *)&(TempMem[Pad->Special.AddressOffset]);
          PolygonVertices=ObjectPolygon->NrVertices;
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          XmlWriteInt(5,"NrPoints",PolygonVertices);
          XmlWritePoints(5,"Points",(double *)ObjectPolygon->Points,PolygonVertices*2,StandardUnits);
          break;
        case PIN_PUT_THROUGH_POLYGON:
          XmlWriteInt(5,"PadType",PIN_PUT_THROUGH_POLYGON);
          ObjectPolygon=(GeomPolygonRecord *)&(TempMem[Pad->Special.AddressOffset]);
          PolygonVertices=ObjectPolygon->NrVertices;
          XmlWritePoints(5,"Coor",(double *)&Coor[0],2,StandardUnits);
          if (Pad->Special.Extra1!=0.0) {
            XmlWriteFloat(5,"InnerPad",Pad->Special.Extra1,StandardUnits);
          }
          if (Pad->Extra2!=0.0) {
            XmlWriteFloat(5,"PowerPad",Pad->Extra2,StandardUnits);
          }
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          XmlWriteInt(5,"NrPoints",PolygonVertices);
          XmlWritePoints(5,"Points",(double *)ObjectPolygon->Points,PolygonVertices*2,StandardUnits);
          break;
        case PIN_LINE_ALL_ANGLE:
        case OBJECT_LINE:
          XmlWriteInt(5,"PadType",OBJECT_LINE);
          Coor[0]=Pad->X;
          Coor[1]=Pad->Y;
          Coor[2]=Pad->Width;
          Coor[3]=Pad->Height;
          XmlWriteFloat(5,"ThickNess",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],4,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
        case PIN_ARC:           // arc
        case OBJECT_ARC:        // arc
          XmlWriteInt(5,"PadType",OBJECT_ARC);
          ShapeLines=(float *)&(TempMem[MemPos]);
          XmlWriteFloat(5,"ThickNess",Pad->Height,StandardUnits);
          XmlWritePoints(5,"Coor",(double *)&Coor[0],4,StandardUnits);
          XmlWriteFloat(5,"Clearance",Pad->Clearance,StandardUnits);
          break;
      }
      switch (Pad->ShapeType) {
        case PIN_ARC:
        case OBJECT_ARC:
          MemPos+=48;
          break;
        default:
          MemPos+=sizeof(PadRecord);
          break;
      }
      sprintf(str,"%s</SubPad>",TabStrings[4]);
      AddToMessageBuf(str);
      NrPinShapes--;
    }
    sprintf(str,"%s</Pad>",TabStrings[3]);
    AddToMessageBuf(str);
    NrPins--;
  }
  if (Shape->NrPins>0) {
    sprintf(str,"%s</Pads>",TabStrings[2]);
    AddToMessageBuf(str);
  }


// ********************************************************************************************************

  MemPos=sizeof(ShapeRecord);
  NrLines=min(16384,Shape->NrPlacementOutLines);
  if (Shape->NrPlacementOutLines>0) {
    sprintf(str,"%s<PlacementOutLineLayer>",TabStrings[2]);
    AddToMessageBuf(str);
  }
  while (NrLines>0) {
    ShapeLines=(float *)&(TempMem[MemPos]);
    ShapeInfoP=(int32 *)ShapeLines;
    ShapeInfo=*ShapeInfoP;
    sprintf(str,"%s<Object>",TabStrings[3]);
    AddToMessageBuf(str);
    switch (ShapeInfo) {
      case OBJECT_LINE:    // line
        XmlWriteInt(4,"ObjectType",ShapeInfo);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],4,StandardUnits);
        MemPos+=24;
        break;
      case OBJECT_RECT:     // rect
        XmlWriteInt(4,"ObjectType",ShapeInfo);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteFloat(4,"Width",ShapeLines[3],StandardUnits);
        XmlWriteFloat(4,"Height",ShapeLines[4],StandardUnits);
        MemPos+=24;
        break;
      case OBJECT_CIRCLE:     // circle   (X2 = thickness,Y2 circle type)
        CircleMode=(int32)(ShapeLines[4]+0.1);
        XmlWriteInt(4,"ObjectType",OBJECT_ARC);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
        switch (CircleMode) {
          case 1:
            Coor[0]=ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
          case 2:
            Coor[1]=-ShapeLines[3]*0.5;
            Coor[2]=ShapeLines[3]*0.5;
            break;
          case 3:
            Coor[1]=-ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
          case 4:
            Coor[0]=-ShapeLines[3]*0.5;
            Coor[3]=-ShapeLines[3]*0.5;
            break;
          case 6:
            Coor[0]=-ShapeLines[3]*0.5;
            Coor[2]=ShapeLines[3]*0.5;
            break;
          case 8:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[2]=-ShapeLines[3]*0.5;
            break;
          case 9:
            Coor[0]=ShapeLines[3]*0.5;
            Coor[2]=-ShapeLines[3]*0.5;
            break;
          case 12:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[3]=-ShapeLines[3]*0.5;
            break;
          case 15:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
        }
        XmlWritePoints(4,"Start",(double *)&Coor[0],2,StandardUnits);
        XmlWritePoints(4,"End",(double *)&Coor[2],2,StandardUnits);
        MemPos+=24;
        break;
      case OBJECT_ARC:        // arc
        XmlWriteInt(4,"ObjectType",OBJECT_ARC);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
        XmlWritePoints2(4,"Start",(float *)&ShapeLines[5],2,StandardUnits);
        XmlWritePoints2(4,"End",(float *)&ShapeLines[7],2,StandardUnits);

        MemPos+=40;
        break;
    }
    sprintf(str,"%s</Object>",TabStrings[3]);
    AddToMessageBuf(str);
    NrLines--;
  }
  if (Shape->NrPlacementOutLines>0) {
    sprintf(str,"%s</PlacementOutLineLayer>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// **************************************************************************************


  MemPos=Shape->CompOutLineOffset;
  NrLines=min(16384,Shape->NrCompOutLines);
  if (Shape->NrCompOutLines>0) {
    sprintf(str,"%s<ComponentOutLineLayer>",TabStrings[2]);
    AddToMessageBuf(str);
  }
  while (NrLines>0) {
    ShapeLines=(float *)&(TempMem[MemPos]);
    ShapeInfoP=(int32 *)&ShapeLines[0];
    ShapeInfo=*ShapeInfoP & 0x0000fff0;
    sprintf(str,"%s<Object>",TabStrings[3]);
    AddToMessageBuf(str);

    switch (ShapeInfo) {
      case OBJECT_LINE:    // line
        XmlWriteInt(4,"ObjectType",ShapeInfo);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],4,StandardUnits);
        XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        MemPos+=24;
        break;
      case OBJECT_RECT:     // rect
        if (ShapeLines[5]==0.0) {
          XmlWriteInt(4,"ObjectType",PIN_SMD_RECT);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Width",ShapeLines[3],StandardUnits);
          XmlWriteFloat(4,"Height",ShapeLines[4],StandardUnits);
        } else {
          XmlWriteInt(4,"ObjectType",ShapeInfo);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Width",ShapeLines[3],StandardUnits);
          XmlWriteFloat(4,"Height",ShapeLines[4],StandardUnits);
          XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        }
        MemPos+=24;
        break;
      case OBJECT_CIRCLE:     // circle   (X2 = thickness,Y2 circle type)
        CircleMode=(int32)(ShapeLines[4]+0.1);
        XmlWriteInt(4,"ObjectType",OBJECT_ARC);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
        switch (CircleMode) {
          case 1:
            Coor[0]=ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
          case 2:
            Coor[1]=-ShapeLines[3]*0.5;
            Coor[2]=ShapeLines[3]*0.5;
            break;
          case 3:
            Coor[1]=-ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
          case 4:
            Coor[0]=-ShapeLines[3]*0.5;
            Coor[3]=-ShapeLines[3]*0.5;
            break;
          case 6:
            Coor[0]=-ShapeLines[3]*0.5;
            Coor[2]=ShapeLines[3]*0.5;
            break;
          case 8:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[2]=-ShapeLines[3]*0.5;
            break;
          case 9:
            Coor[0]=ShapeLines[3]*0.5;
            Coor[2]=-ShapeLines[3]*0.5;
            break;
          case 12:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[3]=-ShapeLines[3]*0.5;
            break;
          case 15:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
        }
        XmlWritePoints(4,"Start",(double *)&Coor[0],2,StandardUnits);
        XmlWritePoints(4,"End",(double *)&Coor[2],2,StandardUnits);
        XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        MemPos+=24;
        break;
      case OBJECT_ARC:        // arc
        if (ShapeLines[9]==0.0) {
          XmlWriteInt(4,"ObjectType",PIN_SMD_ROUND);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
        } else {
          XmlWriteInt(4,"ObjectType",OBJECT_ARC);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
          XmlWritePoints2(4,"Start",(float *)&ShapeLines[5],2,StandardUnits);
          XmlWritePoints2(4,"End",(float *)&ShapeLines[7],2,StandardUnits);
          XmlWriteFloat(4,"Thickness",ShapeLines[9],StandardUnits);
        }
        MemPos+=40;
        break;
      case OBJECT_TEXT:    // text
        XmlWriteInt(4,"ObjectType",ShapeInfo);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        XmlWriteFloat(4,"Height",ShapeLines[3],StandardUnits);
        if (ShapeLines[4]>10.0) {
          // Floating point number
          Rotation=ShapeLines[4]-2000.0;
        } else {
          RotationInt=(int32)(ShapeLines[4]+0.1);
          RotationInt=((RotationInt & 3) << 1) + ((RotationInt & 4) >> 2 );
          Rotation=(double)RotationInt*45.0;
        }
        XmlWriteFloat2(4,"Rotation",Rotation,3);
        XmlWriteString(4,"Text",(char *)&ShapeLines[6]);
        MemPos+=24+64;
        break;
      case OBJECT_POLYGON:
      case PIN_SMD_POLYGON:
        XmlWriteInt(4,"ObjectType",PIN_SMD_POLYGON);
        PolygonPointer=(int32 *)&ShapeLines[3];
        ObjectPolygon=(GeomPolygonRecord *)&(TempMem[*PolygonPointer]);
        PolygonVertices=ObjectPolygon->NrVertices;
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteInt(4,"NrPoints",PolygonVertices);
        XmlWritePoints(4,"Points",(double *)ObjectPolygon->Points,PolygonVertices*2,StandardUnits);
        MemPos+=16;
        break;
      default:
        ok=1;
    }
    sprintf(str,"%s</Object>",TabStrings[3]);
    AddToMessageBuf(str);
    NrLines--;
  }
  if (Shape->NrCompOutLines>0) {
    sprintf(str,"%s</ComponentOutLineLayer>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// **************************************************************************************

  MemPos=Shape->SilkScreenOffset;
  NrLines=min(16384,Shape->NrSilkScreenOutLines);
  if (Shape->NrSilkScreenOutLines+Shape->NrOtherObjects>0) {
    sprintf(str,"%s<OtherObjects>",TabStrings[2]);
    AddToMessageBuf(str);
  }
  while (NrLines>0) {
    ShapeLines=(float *)&(TempMem[MemPos]);
    ShapeInfoP=(int32 *)&ShapeLines[0];
    ShapeInfo=*ShapeInfoP & 0x0000fff0;
    sprintf(str,"%s<Object>",TabStrings[3]);
    AddToMessageBuf(str);

    switch (ShapeInfo) {
      case OBJECT_LINE:    // line
        XmlWriteInt(4,"ObjectType",ShapeInfo);
        XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],4,StandardUnits);
        XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        MemPos+=24;
        break;
      case OBJECT_RECT:     // rect
        if (ShapeLines[5]==0.0) {
          XmlWriteInt(4,"ObjectType",PIN_SMD_RECT);
          XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Width",ShapeLines[3],StandardUnits);
          XmlWriteFloat(4,"Height",ShapeLines[4],StandardUnits);
        } else {
          XmlWriteInt(4,"ObjectType",ShapeInfo);
          XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Width",ShapeLines[3],StandardUnits);
          XmlWriteFloat(4,"Height",ShapeLines[4],StandardUnits);
          XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        }
        MemPos+=24;
        break;
      case OBJECT_CIRCLE:     // circle   (X2 = thickness,Y2 circle type)
        CircleMode=(int32)(ShapeLines[4]+0.1);
        XmlWriteInt(4,"ObjectType",OBJECT_ARC);
        XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
        switch (CircleMode) {
          case 1:
            Coor[0]=ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
          case 2:
            Coor[1]=-ShapeLines[3]*0.5;
            Coor[2]=ShapeLines[3]*0.5;
            break;
          case 3:
            Coor[1]=-ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
          case 4:
            Coor[0]=-ShapeLines[3]*0.5;
            Coor[3]=-ShapeLines[3]*0.5;
            break;
          case 6:
            Coor[0]=-ShapeLines[3]*0.5;
            Coor[2]=ShapeLines[3]*0.5;
            break;
          case 8:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[2]=-ShapeLines[3]*0.5;
            break;
          case 9:
            Coor[0]=ShapeLines[3]*0.5;
            Coor[2]=-ShapeLines[3]*0.5;
            break;
          case 12:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[3]=-ShapeLines[3]*0.5;
            break;
          case 15:
            Coor[1]=ShapeLines[3]*0.5;
            Coor[3]=ShapeLines[3]*0.5;
            break;
        }
        XmlWritePoints(4,"Start",(double *)&Coor[0],2,StandardUnits);
        XmlWritePoints(4,"End",(double *)&Coor[2],2,StandardUnits);
        XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        MemPos+=24;
        break;
      case OBJECT_ARC:        // arc
        if (ShapeLines[9]==0.0) {
          XmlWriteInt(4,"ObjectType",PIN_SMD_ROUND);
          XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
        } else {
          XmlWriteInt(4,"ObjectType",OBJECT_ARC);
          XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
          XmlWriteFloat(4,"Diam",ShapeLines[3],StandardUnits);
          XmlWritePoints2(4,"Start",(float *)&ShapeLines[5],2,StandardUnits);
          XmlWritePoints2(4,"End",(float *)&ShapeLines[7],2,StandardUnits);
          XmlWriteFloat(4,"Thickness",ShapeLines[9],StandardUnits);
        }
        MemPos+=40;
        break;
      case OBJECT_TEXT:    // text
        XmlWriteInt(4,"ObjectType",ShapeInfo);
        XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteFloat(4,"Thickness",ShapeLines[5],StandardUnits);
        XmlWriteFloat(4,"Height",ShapeLines[3],StandardUnits);
        if (ShapeLines[4]>10.0) {
          // Floating point number
          Rotation=ShapeLines[4]-2000.0;
        } else {
          RotationInt=(int32)(ShapeLines[4]+0.1);
          RotationInt=((RotationInt & 3) << 1) + ((RotationInt & 4) >> 2 );
          Rotation=(double)RotationInt*45.0;
        }
        XmlWriteFloat2(4,"Rotation",Rotation,3);
        XmlWriteString(4,"Text",(char *)&ShapeLines[6]);
        MemPos+=24+64;
        break;
      case OBJECT_POLYGON:
      case PIN_SMD_POLYGON:
        XmlWriteInt(4,"ObjectType",PIN_SMD_POLYGON);
        XmlWriteInt(4,"Layer",SILKSCREEN_TOP);
        PolygonPointer=(int32 *)&ShapeLines[3];
        ObjectPolygon=(GeomPolygonRecord *)&(TempMem[*PolygonPointer]);
        PolygonVertices=ObjectPolygon->NrVertices;
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[1],2,StandardUnits);
        XmlWriteInt(4,"NrPoints",PolygonVertices);
        XmlWritePoints(4,"Points",(double *)ObjectPolygon->Points,PolygonVertices*2,StandardUnits);
        MemPos+=16;
        break;
      default:
        ok=1;
    }
    sprintf(str,"%s</Object>",TabStrings[3]);
    AddToMessageBuf(str);
    NrLines--;
  }

// **************************************************************************************

  MemPos=Shape->OtherObjectsOffset;
  NrPinShapes=min(65536,Shape->NrOtherObjects);

  while (NrPinShapes>0) {
    ShapeLines=(float *)&(TempMem[MemPos]);
    Pad=(PadRecord *)&(TempMem[MemPos]);
    sprintf(str,"%s<Object>",TabStrings[3]);
    AddToMessageBuf(str);
    Coor[0]=Pad->X;
    Coor[1]=Pad->Y;
    Coor[2]=Pad->Width;
    Coor[3]=Pad->Height;
    switch (Pad->ShapeType) {
      case PIN_SMD_RECT:
      case OBJECT_RECT:
        if (Pad->Special.Thickness==0.0) {
          XmlWriteInt(4,"ObjectType",PIN_SMD_ROUND);
          XmlWriteInt(4,"Layer",Pad->Layer);
          XmlWriteFloat(4,"Width",Pad->Width,StandardUnits);
          XmlWriteFloat(4,"Height",Pad->Height,StandardUnits);
          XmlWritePoints(4,"Coor",(double *)&Coor[0],2,StandardUnits);
        } else {
          XmlWriteInt(4,"ObjectType",OBJECT_RECT);
          XmlWriteInt(4,"Layer",Pad->Layer);
          XmlWriteFloat(4,"Width",Pad->Width,StandardUnits);
          XmlWriteFloat(4,"Height",Pad->Height,StandardUnits);
          XmlWritePoints(4,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(4,"ThickNess",Pad->Special.Thickness,StandardUnits);
        }
        break;
      case PIN_SMD_ROUND:
      case OBJECT_CIRCLE:
        if (Pad->Special.Thickness==0.0) {
          XmlWriteInt(4,"ObjectType",PIN_SMD_ROUND);
          XmlWriteInt(4,"Layer",Pad->Layer);
          XmlWriteFloat(4,"Diam",Pad->Width,StandardUnits);
          XmlWritePoints(4,"Coor",(double *)&Coor[0],2,StandardUnits);
        } else {
          XmlWriteInt(4,"ObjectType",OBJECT_CIRCLE);
          XmlWriteInt(4,"Layer",Pad->Layer);
          XmlWriteFloat(4,"Diam",Pad->Width,StandardUnits);
          XmlWritePoints(4,"Coor",(double *)&Coor[0],2,StandardUnits);
          XmlWriteFloat(4,"ThickNess",Pad->Special.Thickness,StandardUnits);
        }
        break;
      case PIN_LINE_HOR:
        Coor[0]=Pad->X;
        Coor[1]=Pad->Y;
        Coor[2]=Pad->X+Pad->Width;
        Coor[3]=Pad->Y;
        XmlWriteInt(4,"ObjectType",OBJECT_LINE);
        XmlWriteInt(4,"Layer",Pad->Layer);
        XmlWriteFloat(4,"ThickNess",Pad->Height,StandardUnits);
        XmlWritePoints(4,"Coor",(double *)&Coor[0],4,StandardUnits);
        break;
      case PIN_LINE_VER:
        Coor[0]=Pad->X;
        Coor[1]=Pad->Y;
        Coor[2]=Pad->X;
        Coor[3]=Pad->Y+Pad->Width;
        XmlWriteInt(4,"ObjectType",OBJECT_LINE);
        XmlWriteInt(4,"Layer",Pad->Layer);
        XmlWriteFloat(4,"ThickNess",Pad->Height,StandardUnits);
        XmlWritePoints(4,"Coor",(double *)&Coor[0],4,StandardUnits);
        break;
      case PIN_LINE_DIAG1:
        Coor[0]=Pad->X;
        Coor[1]=Pad->Y;
        Coor[2]=Pad->X+Pad->Width;
        Coor[3]=Pad->Y-Pad->Width;
        XmlWriteInt(4,"ObjectType",OBJECT_LINE);
        XmlWriteInt(4,"Layer",Pad->Layer);
        XmlWriteFloat(4,"ThickNess",Pad->Height,StandardUnits);
        XmlWritePoints(4,"Coor",(double *)&Coor[0],4,StandardUnits);
        break;
      case PIN_LINE_DIAG2:
        Coor[0]=Pad->X;
        Coor[1]=Pad->Y;
        Coor[2]=Pad->X+Pad->Width;
        Coor[3]=Pad->Y+Pad->Width;
        XmlWriteInt(4,"ObjectType",OBJECT_LINE);
        XmlWriteInt(4,"Layer",Pad->Layer);
        XmlWriteFloat(4,"ThickNess",Pad->Height,StandardUnits);
        XmlWritePoints(4,"Coor",(double *)&Coor[0],4,StandardUnits);
        break;
      case OBJECT_POLYGON:
      case PIN_SMD_POLYGON:
        ObjectPolygon=(GeomPolygonRecord *)&(TempMem[Pad->Special.AddressOffset]);
        PolygonVertices=ObjectPolygon->NrVertices;
        XmlWriteInt(4,"ObjectType",OBJECT_POLYGON);
        XmlWriteInt(4,"Layer",Pad->Layer);
        XmlWritePoints(4,"Coor",(double *)&Coor[0],2,StandardUnits);
        XmlWriteInt(4,"NrPoints",PolygonVertices);
        XmlWritePoints(4,"Points",(double *)ObjectPolygon->Points,PolygonVertices*2,StandardUnits);
        break;
      case PIN_LINE_ALL_ANGLE:
      case OBJECT_LINE:
        Coor[0]=Pad->X;
        Coor[1]=Pad->Y;
        Coor[2]=Pad->Width;
        Coor[3]=Pad->Height;
        XmlWriteInt(4,"ObjectType",OBJECT_LINE);
        XmlWriteInt(4,"Layer",Pad->Layer);
        XmlWriteFloat(4,"ThickNess",Pad->Height,StandardUnits);
        XmlWritePoints(4,"Coor",(double *)&Coor[0],4,StandardUnits);
        XmlWriteFloat(4,"Clearance",Pad->Clearance,StandardUnits);
        break;
      case PIN_ARC:           // arc
      case OBJECT_ARC:        // arc
        if (ShapeLines[10]==0.0) {
          XmlWriteInt(4,"ObjectType",PIN_SMD_ROUND);
          XmlWriteInt(4,"Layer",Pad->Layer);
          XmlWriteFloat(4,"Diam",ShapeLines[4],StandardUnits);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[2],2,StandardUnits);
        } else {
          XmlWriteInt(4,"ObjectType",OBJECT_ARC);
          XmlWriteInt(4,"Layer",Pad->Layer);
          XmlWriteFloat(4,"ThickNess",ShapeLines[10],StandardUnits);
          XmlWritePoints2(4,"Coor",(float *)&ShapeLines[2],2,StandardUnits);
          XmlWritePoints2(4,"Start",(float *)&ShapeLines[6],2,StandardUnits);
          XmlWritePoints2(4,"End",(float *)&ShapeLines[8],2,StandardUnits);
        }
        break;
      case OBJECT_TEXT:    // text
        XmlWriteInt(4,"ObjectType",OBJECT_TEXT);
        XmlWriteInt(4,"Layer",Pad->Layer);
        XmlWritePoints2(4,"Coor",(float *)&ShapeLines[2],2,StandardUnits);
        XmlWriteFloat(4,"Thickness",ShapeLines[6],StandardUnits);
        XmlWriteFloat(4,"Height",ShapeLines[4],StandardUnits);
        if (ShapeLines[5]>10.0) {
          // Floating point number
          Rotation=ShapeLines[5]-2000.0;
        } else {
          RotationInt=(int32)(ShapeLines[5]+0.1);
          RotationInt=((RotationInt & 3) << 1) + ((RotationInt & 4) >> 2 );
          Rotation=(double)RotationInt*45.0;
        }
        XmlWriteFloat2(4,"Rotation",Rotation,3);
        XmlWriteString(4,"Text",(char *)&ShapeLines[7]);
        break;
    }
    switch (Pad->ShapeType) {
      case PIN_ARC:
      case OBJECT_ARC:
        MemPos+=48;
        break;
      case OBJECT_TEXT:    // Text
        MemPos+=28+64;
        break;
      default:
        MemPos+=sizeof(PadRecord);
        break;
    }
    sprintf(str,"%s</Object>",TabStrings[3]);
    AddToMessageBuf(str);
    NrPinShapes--;
  }
  if (Shape->NrSilkScreenOutLines+Shape->NrOtherObjects>0) {
    sprintf(str,"%s</OtherObjects>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  sprintf(str,"%s</Data>",TabStrings[1]);
  AddToMessageBuf(str);
  strcpy(str,"</PcbEleganceGeometry>");
  AddToMessageBuf(str);

  strcpy(str,FileName);
  CutExtensionFileName(str);
  strcat(str,".xml");
  fp=FileOpenWrite(str);
  if (fp>0) {
    FileWrite(fp,MessageBuf,MessageBufPos,&result);
    FileClose(fp);
  }
  printf("Pcb elegance xml geometry file %s has been created\n",str);

  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlExportLayout(char *FileName)

{
  char  str[200],str2[200],*NetPropertiesBuf,*strp1,*strp2;
  double Coor[1024];
  float *PointP;
  DesignRecord Design;
  int32 Designfp,result,cnt,cnt2,fp,*AreaFillPos,*ObjectPolygonPos,length1,length2;
  uint32 NewSeconds;
  CompRecord *Comp;
  CompsArray *Comps;
  NetRecord *Net;
  TraceRecord *Trace;
  PolygonRecord *Polygon;
  ViaRecord *Via;
  AreaFillRecord *AreaFill;
  ConnectionsRecord *Connection;
  SYSTEMTIME NewTime;

  ObjectLineRecord *ObjectLine;
  ObjectRectRecord *ObjectRect;
  ObjectCircleRecord *ObjectCircle;
  ObjectArcRecord *ObjectArc,*ObjectArc2,NewObjectArc;
  ObjectTextRecord *ObjectText;
  ObjectTextRecord2 *ObjectText2;
  ObjectPolygonRecord *ObjectPolygon;
  HANDLE FileSearchHandle;
  WIN32_FIND_DATA FileData;

//  FileSearchHandle=FindFirstFile("e:\\pcbeleg35\\xmlwrite\\*.*",&FileData);
  FileSearchHandle=FindFirstFile(FileName,&FileData);
  if (FileSearchHandle==INVALID_HANDLE_VALUE) {
    printf ("Invalid File Handle. GetLastError reports %d\n",
            (int32)GetLastError ());
    return 0;
  }
  FindClose(FileSearchHandle);

  if ((Designfp=FileOpenReadOnly(FileName))==-1) return -3;
  if (FileRead(Designfp,&Design,
                         sizeof(DesignRecord),&result)==-1) return -3;

  if ((strcmp(Design.Identification,PCBCode)==0)
     ||
     (strcmp(Design.Identification,PCBCode2)==0)
     ||
     (strcmp(Design.Identification,PCBCode3)==0)) {
    FileClose(Designfp);
    return -1;
  }
  MessageBufPos=0;
  strcpy(str,"<?xml version=\"1.0\" encoding=\"utf-8\"?>");
  AddToMessageBuf(str);
  strcpy(str,"<PcbEleganceLayout>");
  AddToMessageBuf(str);
  sprintf(str,"%s<Info>",TabStrings[1]);
  AddToMessageBuf(str);
  GetFilePartFromFileName(str,FileName);
  CutExtensionFileName(str);
  XmlWriteString(2,"Version","3.0");
  XmlWriteString(2,"Name",str);
  XmlWriteString(2,"Revision","");
  XmlWriteString(2,"Author","");
  XmlWriteString(2,"Company","");
  FileTimeToSystemTime(&FileData.ftLastWriteTime,&NewTime);
  NewSeconds=SecondsAfter1970(NewTime.wYear,NewTime.wMonth,NewTime.wDay,
                              NewTime.wHour,NewTime.wMinute,NewTime.wSecond);

  XmlWriteUInt(2,"Date",NewSeconds);
  XmlWriteInt(2,"NrLayers",Design.NrBoardLayers);
  Coor[0]=Design.BoardOriginX;
  Coor[1]=Design.BoardOriginY;
  XmlWritePoints(2,"BoardOrigin",&Coor[0],2,StandardUnits);
  Coor[0]=Design.BoardWidth;
  Coor[1]=Design.BoardHeight;
  XmlWritePoints(2,"BoardSize",&Coor[0],2,StandardUnits);
  XmlWriteFloat(2,"BoardOutlineKeepOut",Design.BoardOutlineKeepOut,StandardUnits);
  XmlWriteFloat(2,"BoardOutlineWidth",Design.BoardOutlineWidth,StandardUnits);
  XmlWriteFloat(2,"DimensionHeight",Design.DimensionHeight,StandardUnits);
  XmlWriteFloat(2,"ArrowLength",Design.ArrowLength,StandardUnits);
  XmlWriteFloat(2,"DefaultClearance",Design.StandardClearance,StandardUnits);
  XmlWriteFloat(2,"DefaultTraceWidth",Design.StandardTraceWidth,StandardUnits);
  switch (StandardUnits) {
    case UNITS_MM:
      XmlWriteString(2,"Units","mm");
      break;
    case UNITS_MILS:
      XmlWriteString(2,"Units","mils");
      break;
    case UNITS_INCH:
      XmlWriteString(2,"Units","inch");
      break;
  }
  sprintf(str,"%s<ViaDefinitions>",TabStrings[2]);
  AddToMessageBuf(str);
  Via=(ViaRecord *)&Design.DefVia1;
  for (cnt=0;cnt<10;cnt++) {
    XmlWriteVia(3,Via,1);
    Via++;
  }
  sprintf(str,"%s</ViaDefinitions>",TabStrings[2]);
  AddToMessageBuf(str);
  for (cnt=0;cnt<32;cnt++) {
    sprintf(str2,"LayerText%d",cnt);
    XmlWriteString(2,str2,Design.LayerText[cnt]);
  }
  sprintf(str,"%s<FontNames>",TabStrings[2]);
  AddToMessageBuf(str);
  for (cnt=0;cnt<16;cnt++) {
    XmlWriteString(3,"FontName",Design.UsedFontStr[cnt]);
  }
  sprintf(str,"%s</FontNames>",TabStrings[2]);
  AddToMessageBuf(str);

  sprintf(str,"%s</Info>",TabStrings[1]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************

  sprintf(str,"%s<Data>",TabStrings[1]);
  AddToMessageBuf(str);

  Comps=(CompsArray *)TempMem2;
  if (FileRead(Designfp,TempMem2,sizeof(int32)*(int32)Design.NrComps,&result)==-1) return -3;
  if (FileRead(Designfp,TempMem,(int32)Design.CompsMem,&result)==-1) return -3;

  sprintf(str,"%s<Components>",TabStrings[2]);
  AddToMessageBuf(str);
  for (cnt=0;cnt<Design.NrComps;cnt++) {
    Comp=(CompRecord *)&(TempMem[(*Comps)[cnt]]);
    XmlWriteComp(3,Comp);
  }
  sprintf(str,"%s</Components>",TabStrings[2]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************

  if (FileRead(Designfp,TempMem,
               sizeof(NetRecord)*(int32)Design.NrNets,&result)==-1) return -3;
  sprintf(str,"%s<Nets>",TabStrings[2]);
  AddToMessageBuf(str);
  Net=(NetRecord *)TempMem;
  for (cnt=0;cnt<Design.NrNets;cnt++) {
    sprintf(str,"%s<Net>",TabStrings[3]);
    AddToMessageBuf(str);
    XmlWriteString(4,"Name",Net->Name);
    XmlWriteFloat(4,"TraceWidth",Net->TraceWidth,StandardUnits);
    XmlWriteFloat(4,"TraceClearance",Net->TraceClearance,StandardUnits);
    XmlWriteInt(4,"Info",Net->Info);
    XmlWriteInt(4,"ViaNr",Net->ViaNr);

    for (cnt2=0;cnt2<sizeof(Net->Properties);cnt2++) {
      if (Net->Properties[cnt]) {
        break;
      }
    }
    if ((cnt2<sizeof(Net->Properties))
       &&
       (Net->Properties[sizeof(Net->Properties)-1]==0)) {
      sprintf(str,"%s<Properties>",TabStrings[4]);
      AddToMessageBuf(str);
      NetPropertiesBuf=strp1=(char *)Net->Properties;
      while (1) {
        if (strp1[0]==0) {
          break;
        }
        length1=strlen(strp1);
        strp2=strp1+length1+1;
        if (strp2[0]==0) {
          break;
        }
        length2=strlen(strp2);
        sprintf(str,"%s<Property>",TabStrings[5]);
        AddToMessageBuf(str);
        XmlWriteString(6,"Name",strp1);
        XmlWriteString(6,"Value",strp2);
        sprintf(str,"%s</Property>",TabStrings[5]);
        AddToMessageBuf(str);
        strp1=strp2+length2+1;
        if (strp1>=NetPropertiesBuf+sizeof(Net->Properties)) {
          break;
        }
      }
      sprintf(str,"%s</Properties>",TabStrings[4]);
      AddToMessageBuf(str);
    }

    sprintf(str,"%s</Net>",TabStrings[3]);
    AddToMessageBuf(str);
    Net++;
  }
  sprintf(str,"%s</Nets>",TabStrings[2]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************

  sprintf(str,"%s<Traces>",TabStrings[2]);
  AddToMessageBuf(str);
  for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
    sprintf(str,"%s<Layer%d>",TabStrings[3],cnt);
    AddToMessageBuf(str);
    if (FileRead(Designfp,TempMem,
                           sizeof(TraceRecord)*(int32)Design.NrVerTraces[cnt],&result)==-1) return -3;
    Trace=(TraceRecord *)TempMem;
    for (cnt2=0;cnt2<Design.NrVerTraces[cnt];cnt2++) {
      XmlWriteTrace(4,Trace,TRACE_VER);
      Trace++;
    }
    if (FileRead(Designfp,TempMem,
                           sizeof(TraceRecord)*(int32)Design.NrHorTraces[cnt],&result)==-1) return -3;
    Trace=(TraceRecord *)TempMem;
    for (cnt2=0;cnt2<Design.NrHorTraces[cnt];cnt2++) {
      XmlWriteTrace(4,Trace,TRACE_HOR);
      Trace++;
    }
    if (FileRead(Designfp,TempMem,
                           sizeof(TraceRecord)*(int32)Design.NrDiag1Traces[cnt],&result)==-1) return -3;
    Trace=(TraceRecord *)TempMem;
    for (cnt2=0;cnt2<Design.NrDiag1Traces[cnt];cnt2++) {
      XmlWriteTrace(4,Trace,TRACE_DIAG1);
      Trace++;
    }
    if (FileRead(Designfp,TempMem,
                           sizeof(TraceRecord)*(int32)Design.NrDiag2Traces[cnt],&result)==-1) return -3;
    Trace=(TraceRecord *)TempMem;
    for (cnt2=0;cnt2<Design.NrDiag2Traces[cnt];cnt2++) {
      XmlWriteTrace(4,Trace,TRACE_DIAG2);
      Trace++;
    }
    sprintf(str,"%s</Layer%d>",TabStrings[3],cnt);
    AddToMessageBuf(str);
  }
  sprintf(str,"%s</Traces>",TabStrings[2]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************

  sprintf(str,"%s<Vias>",TabStrings[2]);
  AddToMessageBuf(str);
  if (FileRead(Designfp,TempMem,sizeof(ViaRecord)*(int32)Design.NrVias,&result)==-1) return -3;
  Via=(ViaRecord *)TempMem;
  for (cnt2=0;cnt2<Design.NrVias;cnt2++) {
    XmlWriteVia(3,Via,0);
    Via++;
  }
  sprintf(str,"%s</Vias>",TabStrings[2]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************
  if (FileRead(Designfp,TempMem,
               sizeof(ConnectionsRecord)*(int32)Design.NrConnections,&result)==-1) return -3;

  sprintf(str,"%s<Connections>",TabStrings[2]);
  AddToMessageBuf(str);
  Connection=(ConnectionsRecord *)TempMem;
  for (cnt=0;cnt<Design.NrConnections;cnt++) {
    sprintf(str,"%s<Connection>",TabStrings[3]);
    AddToMessageBuf(str);
    Coor[0]=Connection->x1;
    Coor[1]=Connection->y1;
    Coor[2]=Connection->x2;
    Coor[3]=Connection->y2;
    XmlWritePoints(4,"Coor",&Coor[0],4,StandardUnits);
    XmlWriteInt(4,"NrNet",Connection->NetNr);
    XmlWriteInt(4,"Comp1Nr",Connection->Comp1Nr);
    XmlWriteInt(4,"Comp1PinNr",Connection->Comp1PinNr);
    XmlWriteInt(4,"Comp2Nr",Connection->Comp2Nr);
    XmlWriteInt(4,"Comp2PinNr",Connection->Comp2PinNr);
    XmlWriteInt(4,"Info",Connection->Info);

    sprintf(str,"%s</Connection>",TabStrings[3]);
    AddToMessageBuf(str);
    Connection++;
  }
  sprintf(str,"%s</Connections>",TabStrings[2]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************

  sprintf(str,"%s<AreaFills>",TabStrings[2]);
  AddToMessageBuf(str);

  if (FileRead(Designfp,TempMem2,
                         sizeof(int32)*(int32)Design.NrAreaFills,&result)==-1) return -3;
  if (FileRead(Designfp,TempMem,
                         (int32)Design.AreaFillMem,&result)==-1) return -3;

  AreaFillPos=(int32 *)TempMem2;
  for (cnt=0;cnt<Design.NrAreaFills;cnt++) {
    AreaFill=(AreaFillRecord *)&TempMem[*AreaFillPos];
    sprintf(str,"%s<AreaFill>",TabStrings[3]);
    AddToMessageBuf(str);
    XmlWriteInt(4,"Layer",AreaFill->Layer);
    XmlWriteInt(4,"Info",AreaFill->Info);
    XmlWriteInt(4,"NetNr",AreaFill->NetNr);
    XmlWriteInt(4,"NrPolygons",AreaFill->NrPolygons);
    XmlWriteInt(4,"AreaFillType",AreaFill->AreaFillType);
    XmlWriteInt(4,"FillType",AreaFill->FillType);
    XmlWriteFloat(4,"Clearance",AreaFill->Clearance,StandardUnits);
    XmlWriteFloat(4,"SurroundThickNess",AreaFill->SurroundThickNess,StandardUnits);
    XmlWriteFloat(4,"ThermalReliefThickness",AreaFill->ThermalReliefThickness,StandardUnits);
    XmlWriteFloat(4,"ThermalReliefDistance",AreaFill->ThermalReliefDistance,StandardUnits);
    XmlWriteInt(4,"NrVerticesStartPolygon",AreaFill->NrVerticesStartPolygon);
    XmlWritePoints2(4,"StartPolygonPoints",(float *)&AreaFill->StartPolygon,
                    AreaFill->NrVerticesStartPolygon*2,StandardUnits);
    Polygon=(PolygonRecord *)(((char *)AreaFill)+sizeof(AreaFillRecord));
    for (cnt2=0;cnt2<AreaFill->NrPolygons;cnt2++) {
      if (cnt2==0) {
        sprintf(str,"%s<IslandPolygon>",TabStrings[4]);
        AddToMessageBuf(str);
        XmlWriteInt(5,"NrPoints",Polygon->NrVertices);
        XmlWritePoints(5,"Points",(double *)Polygon->Points,Polygon->NrVertices*2,StandardUnits);
        sprintf(str,"%s</IslandPolygon>",TabStrings[4]);
        AddToMessageBuf(str);
      } else {
        if (Polygon->PolygonType & 4) {
          sprintf(str,"%s<UserDeletionPolygon>",TabStrings[4]);
          AddToMessageBuf(str);
          XmlWriteInt(5,"NrPoints",Polygon->NrVertices);
          XmlWritePoints(5,"Points",(double *)Polygon->Points,Polygon->NrVertices*2,StandardUnits);
          sprintf(str,"%s</UserDeletionPolygon>",TabStrings[4]);
          AddToMessageBuf(str);
        } else {
          if (Polygon->PolygonType & 1) {
            sprintf(str,"%s<HolePolygonThermalRelief>",TabStrings[4]);
            AddToMessageBuf(str);
            XmlWriteInt(5,"NrPoints",Polygon->NrVertices);
            XmlWritePoints(5,"Points",(double *)Polygon->Points,Polygon->NrVertices*2,StandardUnits);
            sprintf(str,"%s</HolePolygonThermalRelief>",TabStrings[4]);
            AddToMessageBuf(str);
          } else {
            sprintf(str,"%s<HolePolygon>",TabStrings[4]);
            AddToMessageBuf(str);
            XmlWriteInt(5,"NrPoints",Polygon->NrVertices);
            XmlWritePoints(5,"Points",(double *)Polygon->Points,Polygon->NrVertices*2,StandardUnits);
            sprintf(str,"%s</HolePolygon>",TabStrings[4]);
            AddToMessageBuf(str);
          }
        }
      }
      Polygon=(PolygonRecord *)((char *)Polygon+Polygon->NrVertices*2*sizeof(double)+sizeof(PolygonInitRecord));
    }
    sprintf(str,"%s</AreaFill>",TabStrings[3]);
    AddToMessageBuf(str);

    AreaFillPos++;
  }

  sprintf(str,"%s</AreaFills>",TabStrings[2]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************

  sprintf(str,"%s<OtherObjects>",TabStrings[2]);
  AddToMessageBuf(str);

  if (FileRead(Designfp,TempMem,
                         sizeof(ObjectLineRecord)*(int32)Design.NrObjectLines,&result)==-1) return -3;
  ObjectLine=(ObjectLineRecord *)TempMem;
  for (cnt=0;cnt<Design.NrObjectLines;cnt++) {
    sprintf(str,"%s<Line>",TabStrings[3]);
    AddToMessageBuf(str);
    XmlWriteInt(4,"Layer",ObjectLine->Layer);
    XmlWriteFloat(4,"LineWidth",ObjectLine->LineThickNess,StandardUnits);
    XmlWriteFloat(4,"Clearance",ObjectLine->Clearance,StandardUnits);
    XmlWriteInt(4,"NetNr",ObjectLine->NetNr);
    XmlWriteInt(4,"LineMode",ObjectLine->LineMode);

    Coor[0]=ObjectLine->X1;
    Coor[1]=ObjectLine->Y1;
    Coor[2]=ObjectLine->X2;
    Coor[3]=ObjectLine->Y2;

    XmlWritePoints(4,"Coor",(double *)&Coor[0],4,StandardUnits);
    sprintf(str,"%s</Line>",TabStrings[3]);
    AddToMessageBuf(str);
    ObjectLine++;
  }
  if (FileRead(Designfp,TempMem,
                         sizeof(ObjectRectRecord)*(int32)Design.NrObjectRects,&result)==-1) return -3;
  ObjectRect=(ObjectRectRecord *)TempMem;
  for (cnt=0;cnt<Design.NrObjectRects;cnt++) {
    if (ObjectRect->Info & OBJECT_FILLED) {
      sprintf(str,"%s<RectanglePad>",TabStrings[3]);
      AddToMessageBuf(str);
      XmlWriteInt(4,"Layer",ObjectRect->Layer);
      XmlWriteFloat(4,"Clearance",ObjectRect->Clearance,StandardUnits);
      XmlWriteFloat(4,"Width",ObjectRect->Width,StandardUnits);
      XmlWriteFloat(4,"Height",ObjectRect->Height,StandardUnits);
      XmlWriteInt(4,"NetNr",ObjectRect->NetNr);

      Coor[0]=ObjectRect->CentreX;
      Coor[1]=ObjectRect->CentreY;

      XmlWritePoints(4,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</RectanglePad>",TabStrings[3]);
      AddToMessageBuf(str);
    } else {
      sprintf(str,"%s<Rectangle>",TabStrings[3]);
      AddToMessageBuf(str);
      XmlWriteInt(4,"Layer",ObjectRect->Layer);
      XmlWriteFloat(4,"Width",ObjectRect->Width,StandardUnits);
      XmlWriteFloat(4,"Height",ObjectRect->Height,StandardUnits);
      XmlWriteFloat(4,"LineWidth",ObjectRect->LineThickNess,StandardUnits);
      XmlWriteFloat(4,"Clearance",ObjectRect->Clearance,StandardUnits);
      XmlWriteInt(4,"NetNr",ObjectRect->NetNr);

      Coor[0]=ObjectRect->CentreX;
      Coor[1]=ObjectRect->CentreY;

      XmlWritePoints(4,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</Rectangle>",TabStrings[3]);
      AddToMessageBuf(str);
    }
    ObjectRect++;
  }

  if (FileRead(Designfp,TempMem,
                         sizeof(ObjectArcRecord)*(int32)Design.NrObjectArcs,&result)==-1) return -3;
  ObjectArc=(ObjectArcRecord *)TempMem;
  for (cnt=0;cnt<Design.NrObjectArcs;cnt++) {
    if (ObjectArc->Info & OBJECT_FILLED) {
      sprintf(str,"%s<CirclePad>",TabStrings[3]);
      AddToMessageBuf(str);
      XmlWriteInt(4,"Layer",ObjectArc->Layer);
      XmlWriteFloat(4,"Clearance",ObjectArc->Clearance,StandardUnits);
      XmlWriteFloat(4,"Diameter",ObjectArc->Width,StandardUnits);
      XmlWriteInt(4,"NetNr",ObjectArc->NetNr);

      Coor[0]=ObjectArc->CentreX;
      Coor[1]=ObjectArc->CentreY;

      XmlWritePoints(4,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</CirclePad>",TabStrings[3]);
      AddToMessageBuf(str);
    } else {
      sprintf(str,"%s<Arc>",TabStrings[3]);
      AddToMessageBuf(str);
      XmlWriteInt(4,"Layer",ObjectArc->Layer);
      XmlWriteFloat(4,"Diam",ObjectArc->Width,StandardUnits);
      XmlWriteFloat(4,"LineWidth",ObjectArc->LineThickNess,StandardUnits);
      XmlWriteFloat(4,"Clearance",ObjectArc->Clearance,StandardUnits);
      XmlWriteInt(4,"NetNr",ObjectArc->NetNr);

      Coor[0]=ObjectArc->CentreX;
      Coor[1]=ObjectArc->CentreY;
      XmlWritePoints(4,"Center",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=ObjectArc->StartDiffX;
      Coor[1]=ObjectArc->StartDiffY;
      XmlWritePoints(4,"Start",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=ObjectArc->EndDiffX;
      Coor[1]=ObjectArc->EndDiffY;
      XmlWritePoints(4,"End",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</Arc>",TabStrings[3]);
      AddToMessageBuf(str);
    }
    ObjectArc++;
  }

  if (FileRead(Designfp,TempMem,
                         sizeof(ObjectTextRecord2)*(int32)Design.NrObjectTexts2,&result)==-1) return -3;
  ObjectText2=(ObjectTextRecord2 *)TempMem;
  for (cnt=0;cnt<Design.NrObjectTexts2;cnt++) {
    sprintf(str,"%s<Text>",TabStrings[3]);
    AddToMessageBuf(str);
    XmlWriteInt(4,"Layer",ObjectText2->Layer);
    XmlWriteFloat(4,"Height",ObjectText2->FontHeight,StandardUnits);
    XmlWriteFloat2(4,"Rotation",ObjectText2->Rotation,3);
    XmlWriteFloat(4,"LineWidth",ObjectText2->LineThickNess,StandardUnits);
    XmlWriteInt(4,"NetNr",ObjectText2->NetNr);
    XmlWriteInt(4,"FontNr",ObjectText2->FontNr);
    XmlWriteInt(4,"TextMode",ObjectText2->TextMode);
    XmlWriteString(4,"TextValue",ObjectText2->Text);

    Coor[0]=ObjectText2->X;
    Coor[1]=ObjectText2->Y;

    XmlWritePoints(4,"Position",(double *)&Coor[0],2,StandardUnits);
    sprintf(str,"%s</Text>",TabStrings[3]);
    AddToMessageBuf(str);
    ObjectText2++;
  }

  if (FileRead(Designfp,TempMem2,
               sizeof(int32)*(int32)Design.NrObjectPolygons,&result)==-1) return -3;
  if (FileRead(Designfp,TempMem,
               (int32)Design.ObjectPolygonMem,&result)==-1) return -3;
  ObjectPolygonPos=(int32 *)TempMem2;
  for (cnt=0;cnt<Design.NrObjectPolygons;cnt++) {
    ObjectPolygon=(ObjectPolygonRecord *)&TempMem[*ObjectPolygonPos];
    sprintf(str,"%s<Polygon>",TabStrings[3]);
    AddToMessageBuf(str);
    XmlWriteInt(4,"Layer",ObjectPolygon->Layer);
    XmlWriteInt(4,"NetNr",ObjectPolygon->NetNr);
//    XmlWriteFloat(4,"Clearance",ObjectPolygon->Clearance,StandardUnits);
    XmlWriteInt(4,"NrPoints",ObjectPolygon->NrVertices);
    XmlWritePoints(4,"Points",(double *)ObjectPolygon->Points,ObjectPolygon->NrVertices*2,StandardUnits);

    sprintf(str,"%s</Polygon>",TabStrings[3]);
    AddToMessageBuf(str);

    ObjectPolygonPos++;
  }
  sprintf(str,"%s</OtherObjects>",TabStrings[2]);
  AddToMessageBuf(str);

// ************************************************************************************************
// ************************************************************************************************

  FileClose(Designfp);
  sprintf(str,"%s</Data>",TabStrings[1]);
  AddToMessageBuf(str);
  strcpy(str,"</PcbEleganceLayout>");
  AddToMessageBuf(str);
  strcpy(str,FileName);
  CutExtensionFileName(str);
  strcat(str,".xml");
  fp=FileOpenWrite(str);
  if (fp>0) {
    FileWrite(fp,MessageBuf,MessageBufPos,&result);
    FileClose(fp);
  }
  printf("Pcb elegance xml layout file %s has been created\n",str);
  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlExportSymbol(char *FileName)

{
  char  str[200],str2[200],*InstancePropertiesBuf,*strp1,*strp2;
  char  SymbolAttrBuf[4096];
  double Coor[1024];
  float *PointP;
  uint32 NewSeconds;
  SymbolRecord DesignSymbol;
  InstanceRecord *Instance;
  int32 fp,Designfp,cnt,cnt2,result,BytesToRead,length1,length2,
        LengthValue,LengthIdent,pos,pos2,first,Version30,NrSymbolAttributes;
  PinRecord *Pins;
  PowerPinRecord *PowerPins;
  PinBusRecord *PinBus;
  SchObjectLineRecord *ObjectLine;
  SchObjectRectRecord *ObjectRect;
  SchObjectCircleRecord *ObjectCircle;
  SchObjectArcRecord *ObjectArc;
  SchObjectTextRecord *ObjectText;
  SchOldObjectLineRecord *OldObjectLine;
  SchOldObjectRectRecord *OldObjectRect;
  SchOldObjectCircleRecord *OldObjectCircle;
  SchOldObjectArcRecord *OldObjectArc;
  SchOldObjectTextRecord *OldObjectText;
  RedefinedPinBusRecord *RedefinedPinBus;
  OnePinNetRecord *OnePinNet;
  SubPinDefsType *SubPinDefs;
  SYSTEMTIME NewTime;
  HANDLE FileSearchHandle;
  WIN32_FIND_DATA FileData;

//  FileSearchHandle=FindFirstFile("e:\\pcbeleg35\\xmlwrite\\*.*",&FileData);
  FileSearchHandle=FindFirstFile(FileName,&FileData);
  if (FileSearchHandle==INVALID_HANDLE_VALUE) {
    printf ("Invalid File Handle. GetLastError reports %d\n",
            (int32)GetLastError ());
    return 0;
  }
  FindClose(FileSearchHandle);

  if ((Designfp=FileOpenReadOnly(FileName))==-1) return -3;
  if (FileRead(Designfp,&DesignSymbol,
                         sizeof(SymbolRecord),&result)==-1) return -3;

  if ((strcmp(DesignSymbol.SymbolIdent,SymbolCode1))
     &&
     (strcmp(DesignSymbol.SymbolIdent,SymbolCode2))
     &&
     (strcmp(DesignSymbol.SymbolIdent,SymbolCode3))) {
    FileClose(Designfp);
    return -1;
  }
  Version30=0;
  if (strcmp(DesignSymbol.SymbolIdent,SymbolCode3)==0) {
    Version30=1;
  }

  StandardUnits=UNITS_100MILS;

// ********************************************************************************************************

  MessageBufPos=0;
  strcpy(str,"<?xml version=\"1.0\" encoding=\"utf-8\"?>");
  AddToMessageBuf(str);
  strcpy(str,"<PcbEleganceSymbol>");
  AddToMessageBuf(str);
  sprintf(str,"%s<Info>",TabStrings[1]);
  AddToMessageBuf(str);
  GetFilePartFromFileName(str,FileName);
  CutExtensionFileName(str);
  XmlWriteString(2,"Version","5.0");
  XmlWriteString(2,"Name",str);
  XmlWriteString(2,"Revision","");
  XmlWriteString(2,"Author","");
  XmlWriteString(2,"Company","");
  FileTimeToSystemTime(&FileData.ftLastWriteTime,&NewTime);
  NewSeconds=SecondsAfter1970(NewTime.wYear,NewTime.wMonth,NewTime.wDay,
                              NewTime.wHour,NewTime.wMinute,NewTime.wSecond);

  XmlWriteString(2,"InterfaceName",DesignSymbol.InterfaceName);
  XmlWriteString(2,"InitialReference",DesignSymbol.InitialReference);
  XmlWriteString(2,"Description",DesignSymbol.Description);
  XmlWriteInt(2,"TextInfo",DesignSymbol.Info);
  if (DesignSymbol.NrPartsPerPackage>1) {
    XmlWriteInt(2,"NrPartsPerPackage",DesignSymbol.NrPartsPerPackage);
  }
/*
  Coor[0]=DesignSymbol.OriginX;
  Coor[1]=DesignSymbol.OriginY;
  XmlWritePoints(4,"Position",(double *)&Coor[0],2,StandardUnits);
*/
  Coor[0]=DesignSymbol.RefOriginX;
  Coor[1]=DesignSymbol.RefOriginY;
  XmlWritePoints(2,"RefPosition",(double *)&Coor[0],2,StandardUnits);
  Coor[0]=DesignSymbol.ValueOriginX;
  Coor[1]=DesignSymbol.ValueOriginY;
  XmlWritePoints(2,"ValuePosition",(double *)&Coor[0],2,StandardUnits);

  XmlWriteUInt(2,"Date",NewSeconds);
  XmlWriteString(2,"Units","100 mils");

  if ((strcmp(DesignSymbol.SymbolIdent,SymbolCode2)==0)
     ||
     (strcmp(DesignSymbol.SymbolIdent,SymbolCode3)==0)) {
    memset(&SymbolAttrBuf,0,sizeof(SymbolAttrBuf));
    FileRead(Designfp,&SymbolAttrBuf,sizeof(SymbolAttrBuf)-2,&result);
    pos=0;
    first=1;
    NrSymbolAttributes=0;
    while ((pos<sizeof(SymbolAttrBuf)-2)
          &&
          (NrSymbolAttributes<40)
          &&
          (SymbolAttrBuf[pos]!=0)) {
      LengthIdent=strlen((LPSTR)&SymbolAttrBuf[pos]);
      if ((LengthIdent>0)
         &&
         (LengthIdent<64)
         &&
         (pos+LengthIdent<sizeof(SymbolAttrBuf)-1)) {
        pos2=pos+LengthIdent+1;
        LengthValue=strlen((LPSTR)&SymbolAttrBuf[pos2]);
        if ((LengthValue>0)
           &&
           (LengthValue<64)
           &&
           (pos2+LengthValue<sizeof(SymbolAttrBuf)-1)) {
          if (first) {
            first=0;
            sprintf(str,"%s<Properties>",TabStrings[2]);
            AddToMessageBuf(str);
          }
          sprintf(str,"%s<Property>",TabStrings[3]);
          AddToMessageBuf(str);
          XmlWriteString(4,"Name",&SymbolAttrBuf[pos]);
          XmlWriteString(4,"Value",&SymbolAttrBuf[pos2]);
          sprintf(str,"%s</Property>",TabStrings[3]);
          AddToMessageBuf(str);
        }
        pos+=LengthIdent+LengthValue+2;
      } else {
        pos=sizeof(SymbolAttrBuf);
      }
    }
    if (!first) {
      first=0;
      sprintf(str,"%s</Properties>",TabStrings[2]);
      AddToMessageBuf(str);
    }
  }

  sprintf(str,"%s</Info>",TabStrings[1]);
  AddToMessageBuf(str);
  sprintf(str,"%s<Data>",TabStrings[1]);
  AddToMessageBuf(str);

// ********************************************************************************************************

  if (DesignSymbol.NrSubPinDefs>0) {
    SubPinDefs=(SubPinDefsType *)TempMem;
    BytesToRead=DesignSymbol.NrSubPinDefs*sizeof(SubPinDefsType);
    FileRead(Designfp,SubPinDefs        ,BytesToRead,&result);
    sprintf(str,"%s<SubPinDefs>",TabStrings[2]);
    AddToMessageBuf(str);
    for (cnt=0;cnt<DesignSymbol.NrSubPinDefs;cnt++) {
      XmlWriteString(3,"SubPinDef",(char *)SubPinDefs);
      SubPinDefs++;
    }
    sprintf(str,"%s</SubPinDefs>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  if (DesignSymbol.NrPins>0) {
    Pins=(PinRecord *)TempMem;
    BytesToRead=(int)DesignSymbol.NrPins*sizeof(PinRecord);
    FileRead(Designfp,Pins        ,BytesToRead,&result);

    sprintf(str,"%s<Pins>",TabStrings[2]);
    AddToMessageBuf(str);
    for (cnt=0;cnt<DesignSymbol.NrPins;cnt++) {
      sprintf(str,"%s<Pin>",TabStrings[3]);
      AddToMessageBuf(str);
      XmlWriteString(4,"Name",Pins->Name);
      XmlWriteString(4,"Label",Pins->Label);
      XmlWriteInt(4,"Type",Pins->ConnectionType);
      XmlWriteInt(4,"Info",Pins->NameInfo);
      XmlWriteInt(4,"Swap",Pins->SwapInfo);
      Coor[0]=Pins->X;
      Coor[1]=Pins->Y;
      XmlWritePoints(4,"Position",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=Pins->NameX;
      Coor[1]=Pins->NameY;
      XmlWritePoints(4,"NamePosition",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</Pin>",TabStrings[3]);
      AddToMessageBuf(str);
      Pins++;
    }
    sprintf(str,"%s</Pins>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  if (DesignSymbol.NrPowerPins>0) {
    PowerPins=(PowerPinRecord *)TempMem;
    BytesToRead=(int)DesignSymbol.NrPowerPins*sizeof(PowerPinRecord);
    FileRead(Designfp,PowerPins        ,BytesToRead,&result);

    sprintf(str,"%s<PowerPins>",TabStrings[2]);
    AddToMessageBuf(str);
    for (cnt=0;cnt<DesignSymbol.NrPowerPins;cnt++) {
      sprintf(str,"%s<PowerPin>",TabStrings[3]);
      AddToMessageBuf(str);
      XmlWriteString(4,"NetName",PowerPins->NetName);
      XmlWriteString(4,"Pins",PowerPins->Text);
      XmlWriteInt(4,"Info",PowerPins->NameInfo);
      Coor[0]=PowerPins->NameX;
      Coor[1]=PowerPins->NameY;
      XmlWritePoints(4,"Position",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</PowerPin>",TabStrings[3]);
      AddToMessageBuf(str);
      PowerPins++;
    }
    sprintf(str,"%s</PowerPins>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  if (DesignSymbol.NrPinBusses>0) {
    PinBus=(PinBusRecord *)TempMem;
    BytesToRead=(int)DesignSymbol.NrPinBusses*sizeof(PinBusRecord);
    FileRead(Designfp,PinBus        ,BytesToRead,&result);

    sprintf(str,"%s<PinBusses>",TabStrings[2]);
    AddToMessageBuf(str);
    for (cnt=0;cnt<DesignSymbol.NrPinBusses;cnt++) {
      sprintf(str,"%s<PinBus>",TabStrings[3]);
      AddToMessageBuf(str);
      XmlWriteString(4,"Label",PinBus->Label);
      XmlWriteString(4,"Pins",PinBus->Text);
      XmlWriteInt(4,"ConnectionType",PinBus->ConnectionType);
      XmlWriteInt(4,"NrPins",PinBus->NrPins);
      XmlWriteInt(4,"Info",PinBus->NameInfo);
      XmlWriteInt(4,"Swap",PinBus->SwapInfo);
      Coor[0]=PinBus->X;
      Coor[1]=PinBus->Y;
      XmlWritePoints(4,"Position",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=PinBus->NameX;

      Coor[1]=PinBus->NameY;
      XmlWritePoints(4,"NamePosition",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</PinBus>",TabStrings[3]);
      AddToMessageBuf(str);
      PinBus++;
    }
    sprintf(str,"%s</PinBusses>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  ObjectLine=(SchObjectLineRecord *)TempMem;
  OldObjectLine=(SchOldObjectLineRecord *)TempMem2;
  for (cnt=0;cnt<DesignSymbol.NrObjectLines;cnt++) {
    if (!Version30) {
      memset(ObjectLine,0,sizeof(ObjectLine));
      FileRead(Designfp,OldObjectLine,sizeof(SchOldObjectLineRecord),&result);
      ObjectLine->X1=OldObjectLine->X1;
      ObjectLine->Y1=OldObjectLine->Y1;
      ObjectLine->X2=OldObjectLine->X2;
      ObjectLine->Y2=OldObjectLine->Y2;
      ObjectLine->Info=OldObjectLine->Info;
      ObjectLine->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectLineRecord);
      FileRead(Designfp,ObjectLine  ,BytesToRead,&result);
    }
    sprintf(str,"%s<Line>",TabStrings[2]);
    AddToMessageBuf(str);
    XmlWriteFloat(3,"LineWidth",ObjectLine->Thickness,StandardUnits);
    XmlWriteInt(3,"LineMode",ObjectLine->LineMode);
    Coor[0]=ObjectLine->X1;
    Coor[1]=ObjectLine->Y1;
    Coor[2]=ObjectLine->X2;
    Coor[3]=ObjectLine->Y2;
    XmlWritePoints(3,"Coor",(double *)&Coor[0],4,StandardUnits);
    sprintf(str,"%s</Line>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  ObjectRect=(SchObjectRectRecord *)TempMem;
  OldObjectRect=(SchOldObjectRectRecord *)TempMem2;
  for (cnt=0;cnt<DesignSymbol.NrObjectRects;cnt++) {
    if (!Version30) {
      memset(ObjectRect,0,sizeof(ObjectRect));
      FileRead(Designfp,OldObjectRect,sizeof(SchOldObjectRectRecord),&result);
      ObjectRect->CentreX=OldObjectRect->CentreX;
      ObjectRect->CentreY=OldObjectRect->CentreY;
      ObjectRect->Width=OldObjectRect->Width;
      ObjectRect->Height=OldObjectRect->Height;
      ObjectRect->Info=OldObjectRect->Info;
      ObjectRect->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectRectRecord);
      FileRead(Designfp,ObjectRect  ,BytesToRead,&result);
    }
    if (ObjectRect->Info & OBJECT_FILLED) {
      sprintf(str,"%s<RectanglePad>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Width",ObjectRect->Width,StandardUnits);
      XmlWriteFloat(3,"Height",ObjectRect->Height,StandardUnits);

      Coor[0]=ObjectRect->CentreX;
      Coor[1]=ObjectRect->CentreY;

      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</RectanglePad>",TabStrings[2]);
      AddToMessageBuf(str);
    } else {
      sprintf(str,"%s<Rectangle>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Width",ObjectRect->Width,StandardUnits);
      XmlWriteFloat(3,"Height",ObjectRect->Height,StandardUnits);
      XmlWriteFloat(3,"LineWidth",ObjectRect->Thickness,StandardUnits);

      Coor[0]=ObjectRect->CentreX;
      Coor[1]=ObjectRect->CentreY;

      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</Rectangle>",TabStrings[2]);
      AddToMessageBuf(str);
    }
  }

// ********************************************************************************************************

  ObjectCircle=(SchObjectCircleRecord *)TempMem;
  OldObjectCircle=(SchOldObjectCircleRecord *)TempMem2;
  for (cnt=0;cnt<DesignSymbol.NrObjectCircles;cnt++) {
    if (!Version30) {
      memset(ObjectCircle,0,sizeof(ObjectCircle));
      FileRead(Designfp,OldObjectCircle,sizeof(SchOldObjectCircleRecord),&result);
      ObjectCircle->CentreX=OldObjectCircle->CentreX;
      ObjectCircle->CentreY=OldObjectCircle->CentreY;
      ObjectCircle->Diam=OldObjectCircle->Diam;
      ObjectCircle->CircleMode=OldObjectCircle->CircleMode;
      ObjectCircle->Info=OldObjectCircle->Info;
      ObjectCircle->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectCircleRecord);
      FileRead(Designfp,ObjectCircle  ,BytesToRead,&result);
    }
    sprintf(str,"%s<Arc>",TabStrings[2]);
    AddToMessageBuf(str);
    XmlWriteFloat(3,"Diam",ObjectCircle->Diam,StandardUnits);
    XmlWriteFloat(3,"LineWidth",ObjectCircle->Thickness,StandardUnits);

    Coor[0]=ObjectCircle->CentreX;
    Coor[1]=ObjectCircle->CentreY;
    XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
    Coor[0]=0.0;
    Coor[1]=0.0;
    Coor[2]=0.0;
    Coor[3]=0.0;
/*
              /-------------\
             /       |       \
            /        |        \
           /         |         \
          /          |          \
         /      8    |     1     \
        /            |            \
       /             |             \
       -----------------------------
       \             |             /
        \            |            /
         \      4    |     2     /
          \          |          /
           \         |         /
            \        |        /
             \       |       /
              \-------------/

*/
    switch (ObjectCircle->CircleMode) {
      case 1:
        Coor[0]=ObjectCircle->Diam*0.5;
        Coor[3]=ObjectCircle->Diam*0.5;
        break;
      case 2:
        Coor[1]=-ObjectCircle->Diam*0.5;
        Coor[2]=ObjectCircle->Diam*0.5;
        break;
      case 3:
        Coor[1]=-ObjectCircle->Diam*0.5;
        Coor[3]=ObjectCircle->Diam*0.5;
        break;
      case 4:
        Coor[0]=-ObjectCircle->Diam*0.5;
        Coor[3]=-ObjectCircle->Diam*0.5;
        break;
      case 6:
        Coor[0]=-ObjectCircle->Diam*0.5;
        Coor[2]=ObjectCircle->Diam*0.5;
        break;
      case 8:
        Coor[1]=ObjectCircle->Diam*0.5;
        Coor[2]=-ObjectCircle->Diam*0.5;
        break;
      case 9:
        Coor[0]=ObjectCircle->Diam*0.5;
        Coor[2]=-ObjectCircle->Diam*0.5;
        break;
      case 12:
        Coor[1]=ObjectCircle->Diam*0.5;
        Coor[3]=-ObjectCircle->Diam*0.5;
        break;
      case 15:
        Coor[1]=ObjectCircle->Diam*0.5;
        Coor[3]=ObjectCircle->Diam*0.5;
        break;
    }
    XmlWritePoints(3,"Start",(double *)&Coor[0],2,StandardUnits);
    XmlWritePoints(3,"End",(double *)&Coor[2],2,StandardUnits);
    sprintf(str,"%s</Arc>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  ObjectArc=(SchObjectArcRecord *)TempMem;
  OldObjectArc=(SchOldObjectArcRecord *)TempMem2;
  for (cnt=0;cnt<DesignSymbol.NrObjectArcs;cnt++) {
    if (!Version30) {
      memset(ObjectArc,0,sizeof(ObjectArc));
      FileRead(Designfp,OldObjectArc,sizeof(SchOldObjectArcRecord),&result);
      ObjectArc->CentreX=OldObjectArc->CentreX;
      ObjectArc->CentreY=OldObjectArc->CentreY;
      ObjectArc->Width=OldObjectArc->Width;
      ObjectArc->Height=OldObjectArc->Height;
      ObjectArc->StartDiffX=OldObjectArc->StartDiffX;
      ObjectArc->StartDiffY=OldObjectArc->StartDiffY;
      ObjectArc->EndDiffX=OldObjectArc->EndDiffX;
      ObjectArc->EndDiffY=OldObjectArc->EndDiffY;
      ObjectArc->Info=OldObjectArc->Info;
      ObjectArc->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectArcRecord);
      FileRead(Designfp,ObjectArc ,BytesToRead,&result);
    }
    if (ObjectArc->Info & OBJECT_FILLED) {
      sprintf(str,"%s<CirclePad>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Diameter",ObjectArc->Width,StandardUnits);

      Coor[0]=ObjectArc->CentreX;
      Coor[1]=ObjectArc->CentreY;

      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</CirclePad>",TabStrings[2]);
      AddToMessageBuf(str);
    } else {
      sprintf(str,"%s<Arc>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Diam",ObjectArc->Width,StandardUnits);
      XmlWriteFloat(3,"LineWidth",ObjectArc->Thickness,StandardUnits);

      Coor[0]=ObjectArc->CentreX;
      Coor[1]=ObjectArc->CentreY;
      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=ObjectArc->StartDiffX;
      Coor[1]=ObjectArc->StartDiffY;
      XmlWritePoints(3,"Start",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=ObjectArc->EndDiffX;
      Coor[1]=ObjectArc->EndDiffY;
      XmlWritePoints(3,"End",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</Arc>",TabStrings[2]);
      AddToMessageBuf(str);
    }
  }

// ********************************************************************************************************

  ObjectText=(SchObjectTextRecord *)TempMem;
  OldObjectText=(SchOldObjectTextRecord *)TempMem2;
  for (cnt=0;cnt<DesignSymbol.NrObjectTexts;cnt++) {
    if (!Version30) {
      memset(ObjectText,0,sizeof(ObjectText));
      FileRead(Designfp,OldObjectText,sizeof(SchOldObjectTextRecord),&result);
      ObjectText->X=OldObjectText->X;
      ObjectText->Y=OldObjectText->Y;
      ObjectText->FontHeight=OldObjectText->FontHeight;
      ObjectText->TextMode=(int16)(OldObjectText->TextMode & 0x0f);
      ObjectText->Rotation=(float)((OldObjectText->TextMode >> 8) * 90.0);
      strcpy(ObjectText->Text,OldObjectText->Text);
      ObjectText->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectTextRecord);
      FileRead(Designfp,ObjectText ,BytesToRead,&result);
    }
    sprintf(str,"%s<Text>",TabStrings[2]);
    AddToMessageBuf(str);
    XmlWriteFloat(3,"Height",ObjectText->FontHeight,StandardUnits);
    XmlWriteFloat2(3,"Rotation",ObjectText->Rotation,1);
    XmlWriteFloat(3,"LineWidth",ObjectText->Thickness,StandardUnits);
//    XmlWriteInt(3,"FontNr",ObjectText->FontNr);
    XmlWriteInt(3,"TextMode",ObjectText->TextMode);
    XmlWriteString(3,"TextValue",ObjectText->Text);

    Coor[0]=ObjectText->X;
    Coor[1]=ObjectText->Y;

    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    sprintf(str,"%s</Text>",TabStrings[2]);
    AddToMessageBuf(str);
  }


// ********************************************************************************************************
  FileClose(Designfp);

  sprintf(str,"%s</Data>",TabStrings[1]);
  AddToMessageBuf(str);
  strcpy(str,"</PcbEleganceSymbol>");
  AddToMessageBuf(str);

  strcpy(str,FileName);
  CutExtensionFileName(str);
  strcat(str,".xml");
  fp=FileOpenWrite(str);
  if (fp>0) {
    FileWrite(fp,MessageBuf,MessageBufPos,&result);
    FileClose(fp);
  }
  printf("Pcb elegance xml symbol file %s has been created\n",str);

  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 XmlExportSchematic(char *FileName)

{
  char  str[200],str2[200],*InstancePropertiesBuf,*strp1,*strp2;
  double Coor[1024];
  float *PointP;
  uint32 NewSeconds;
  SchDesignRecord Design;
  InstanceRecord *Instance;
  int32 fp,Designfp,cnt,cnt2,result,BytesToRead,Values[256],length1,length2,
        Version25,Version30,Version35;
  WireRecord *Wire;
  BusRecord *Bus;
  NetLabelRecord *NetLabel;
  JunctionRecord *Junction;
  BusConnectionRecord *BusConnection;
  GlobalConnectionRecord *GlobalConnection;
  SchObjectLineRecord *ObjectLine;
  SchObjectRectRecord *ObjectRect;
  SchObjectCircleRecord *ObjectCircle;
  SchObjectArcRecord *ObjectArc;
  SchObjectTextRecord *ObjectText;
  SchOldObjectLineRecord *OldObjectLine;
  SchOldObjectRectRecord *OldObjectRect;
  SchOldObjectCircleRecord *OldObjectCircle;
  SchOldObjectArcRecord *OldObjectArc;
  SchOldObjectTextRecord *OldObjectText;
  RedefinedPinBusRecord *RedefinedPinBus;
  OnePinNetRecord *OnePinNet;
  SYSTEMTIME NewTime;
  HANDLE FileSearchHandle;
  WIN32_FIND_DATA FileData;

//  FileSearchHandle=FindFirstFile("e:\\pcbeleg35\\xmlwrite\\*.*",&FileData);
  FileSearchHandle=FindFirstFile(FileName,&FileData);
  if (FileSearchHandle==INVALID_HANDLE_VALUE) {
    printf ("Invalid File Handle. GetLastError reports %d\n",
            (int32)GetLastError ());
    return 0;
  }
  FindClose(FileSearchHandle);

  if ((Designfp=FileOpenReadOnly(FileName))==-1) return -3;
  if (FileRead(Designfp,&Design,
                         sizeof(SchDesignRecord),&result)==-1) return -3;

  if ((strcmp(Design.Identification,SheetCode1))
     &&
     (strcmp(Design.Identification,SheetCode2))
     &&
     (strcmp(Design.Identification,SheetCode3))
     &&
     (strcmp(Design.Identification,SheetCode4))
     &&
     (strcmp(Design.Identification,SheetCode5))) {
    FileClose(Designfp);
    return -1;
  }
  Version25=0;
  Version30=0;
  Version35=0;
  if (strcmp(Design.Identification,SheetCode1)==0) {
    Version25=1;
  }
  if ((strcmp(Design.Identification,SheetCode2)==0)
     ||
     (strcmp(Design.Identification,SheetCode3)==0)) {
    Version30=1;
  }
  if ((strcmp(Design.Identification,SheetCode4)==0)
     ||
     (strcmp(Design.Identification,SheetCode5)==0)) {
    Version30=1;
    Version35=1;
  }

  StandardUnits=UNITS_100MILS;
  BytesToRead=(int)Design.NrSymbols*sizeof(SymbolsPosRecord);
  FileRead(Designfp,TempMem,BytesToRead,&result);

// ********************************************************************************************************

  MessageBufPos=0;
  strcpy(str,"<?xml version=\"1.0\" encoding=\"utf-8\"?>");
  AddToMessageBuf(str);
  strcpy(str,"<PcbEleganceSchematic>");
  AddToMessageBuf(str);
  sprintf(str,"%s<Info>",TabStrings[1]);
  AddToMessageBuf(str);
  GetFilePartFromFileName(str,FileName);
  CutExtensionFileName(str);
  XmlWriteString(2,"Version","5.0");
  XmlWriteString(2,"Name",str);
  XmlWriteString(2,"Revision","");
  XmlWriteString(2,"Author","");
  XmlWriteString(2,"Company","");
  FileTimeToSystemTime(&FileData.ftLastWriteTime,&NewTime);
  NewSeconds=SecondsAfter1970(NewTime.wYear,NewTime.wMonth,NewTime.wDay,
                              NewTime.wHour,NewTime.wMinute,NewTime.wSecond);

  XmlWriteUInt(2,"Date",NewSeconds);
  XmlWriteString(2,"Units","100 mils");
  sprintf(str,"%s</Info>",TabStrings[1]);
  AddToMessageBuf(str);
  sprintf(str,"%s<Data>",TabStrings[1]);
  AddToMessageBuf(str);

// ********************************************************************************************************

  Instance=(InstanceRecord *)TempMem;
  for (cnt=0;cnt<Design.NrInstances;cnt++) {
    sprintf(str,"%s<Instance>",TabStrings[2]);
    AddToMessageBuf(str);

    if ((strcmp(Design.Identification,SheetCode1)==0)
       ||
       (strcmp(Design.Identification,SheetCode2)==0)) {
      memset(Instance,0,sizeof(InstanceRecord));
      FileRead(Designfp,Instance,offsetof(OldOldInstanceRecord,Geometry),&result);
      FileRead(Designfp,&Instance->Geometry,sizeof(OldOldInstanceRecord)-offsetof(OldOldInstanceRecord,Geometry),&result);
    } else {
      if ((strcmp(Design.Identification,SheetCode3)==0)
         ||
         (strcmp(Design.Identification,SheetCode4)==0)) {
        memset(Instance,0,sizeof(InstanceRecord));
        FileRead(Designfp,Instance,offsetof(OldInstanceRecord,Geometry),&result);
        FileRead(Designfp,&Instance->Geometry,sizeof(OldInstanceRecord)-offsetof(OldInstanceRecord,Geometry),&result);
      } else {
        BytesToRead=sizeof(InstanceRecord);
        FileRead(Designfp,Instance,BytesToRead,&result);
      }
    }



    XmlWriteString(3,"Ref",Instance->Reference);
    XmlWriteString(3,"Value",Instance->Value);
    XmlWriteString(3,"SymbolName",Instance->SymbolName);
    XmlWriteString(3,"Geometry",Instance->Geometry);
    XmlWriteString(3,"PartNr",Instance->PartNr);
    XmlWriteString(3,"PartDescription",Instance->PartDescription);
    XmlWriteInt(3,"NrPins",Instance->NrPins);
    XmlWriteInt(3,"MirrorX",(Instance->SymbolInfo >> 4) & 1);
    XmlWriteInt(3,"MirrorY",(Instance->SymbolInfo >> 5) & 1);
    XmlWriteInt(3,"Rotation",Instance->SymbolInfo & 1);
    Coor[0]=Instance->OriginX;
    Coor[1]=Instance->OriginY;
    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    Coor[0]=Instance->RefOriginX;
    Coor[1]=Instance->RefOriginY;
    XmlWritePoints(3,"RefPosition",(double *)&Coor[0],2,StandardUnits);
    Coor[0]=Instance->ValueOriginX;
    Coor[1]=Instance->ValueOriginY;
    XmlWritePoints(3,"ValuePosition",(double *)&Coor[0],2,StandardUnits);
    XmlWriteInt(3,"PackagePartNr",Instance->PackagePartNr);
    XmlWriteInt(3,"PlacingOption",Instance->PlacingOption);
    XmlWriteInt(3,"RefVisible",Instance->RefInfo);
    XmlWriteInt(3,"ValueVisible",Instance->ValueInfo);
    XmlWriteInt(3,"RefRotation",Instance->RefInfo);
    XmlWriteInt(3,"ValueRotation",Instance->ValueInfo);


    for (cnt2=0;cnt2<sizeof(Instance->Properties);cnt2++) {
      if (Instance->Properties[cnt]) {
        break;
      }
    }
    if ((cnt2<sizeof(Instance->Properties))
       &&
       (Instance->Properties[sizeof(Instance->Properties)-1]==0)) {
      sprintf(str,"%s<Properties>",TabStrings[3]);
      AddToMessageBuf(str);
      InstancePropertiesBuf=strp1=(char *)Instance->Properties;
      while (1) {
        if (strp1[0]==0) {
          break;
        }
        length1=strlen(strp1);
        strp2=strp1+length1+1;
        if (strp2[0]==0) {
          break;
        }
        length2=strlen(strp2);
        sprintf(str,"%s<Property>",TabStrings[4]);
        AddToMessageBuf(str);
        XmlWriteString(5,"Name",strp1);
        XmlWriteString(5,"Value",strp2);
        sprintf(str,"%s</Property>",TabStrings[4]);
        AddToMessageBuf(str);
        strp1=strp2+length2+1;
        if (strp1>=InstancePropertiesBuf+sizeof(Instance->Properties)) {
          break;
        }
      }
      sprintf(str,"%s</Properties>",TabStrings[3]);
      AddToMessageBuf(str);
    }
    sprintf(str,"%s</Instance>",TabStrings[2]);
    AddToMessageBuf(str);

    Instance++;
  }

// ********************************************************************************************************
  Wire=(WireRecord *)TempMem;
  BytesToRead=(int)Design.NrWires*sizeof(WireRecord);
  FileRead(Designfp,TempMem        ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrWires;cnt++) {
    sprintf(str,"%s<Wire>",TabStrings[2]);
    AddToMessageBuf(str);
    Coor[0]=Wire->X1;
    Coor[1]=Wire->Y1;
    Coor[2]=Wire->X2;
    Coor[3]=Wire->Y2;
    XmlWritePoints(3,"Coor",(double *)&Coor[0],4,StandardUnits);
    sprintf(str,"%s</Wire>",TabStrings[2]);
    AddToMessageBuf(str);
    Wire++;
  }
// ********************************************************************************************************
  Bus=(BusRecord *)TempMem;
  BytesToRead=(int)Design.NrBusses*sizeof(BusRecord);
  FileRead(Designfp,TempMem       ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrBusses;cnt++) {
    sprintf(str,"%s<Bus>",TabStrings[2]);
    AddToMessageBuf(str);
//    XmlWriteFloat(4,"LineWidth",Bus->LineThickNess,StandardUnits);
//    XmlWriteInt(4,"LineMode",Bus->LineMode);
    Coor[0]=Bus->X1;
    Coor[1]=Bus->Y1;
    Coor[2]=Bus->X2;
    Coor[3]=Bus->Y2;
    XmlWritePoints(3,"Coor",(double *)&Coor[0],4,StandardUnits);
    sprintf(str,"%s</Bus>",TabStrings[2]);
    AddToMessageBuf(str);
    Bus++;
  }
// ********************************************************************************************************
  Junction=(JunctionRecord *)TempMem;
  BytesToRead=(int)Design.NrJunctions*sizeof(JunctionRecord);
  FileRead(Designfp,TempMem    ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrJunctions;cnt++) {
    sprintf(str,"%s<Junction>",TabStrings[2]);
    AddToMessageBuf(str);
    Coor[0]=Junction->X;
    Coor[1]=Junction->Y;
    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    sprintf(str,"%s</Junction>",TabStrings[2]);
    AddToMessageBuf(str);

    Junction++;
  }
// ********************************************************************************************************
  NetLabel=(NetLabelRecord *)TempMem;
  BytesToRead=(int)Design.NrNetLabels*sizeof(NetLabelRecord);
  FileRead(Designfp,TempMem    ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrNetLabels;cnt++) {
    sprintf(str,"%s<NetLabel>",TabStrings[2]);
    AddToMessageBuf(str);
    Coor[0]=NetLabel->ConnectX;
    Coor[1]=NetLabel->ConnectY;
    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    Coor[0]=NetLabel->TextX;
    Coor[1]=NetLabel->TextY;
    XmlWritePoints(3,"TextPosition",(double *)&Coor[0],2,StandardUnits);
    XmlWriteString(3,"Net",NetLabel->Name);
    sprintf(str,"%s</NetLabel>",TabStrings[2]);
    AddToMessageBuf(str);

    NetLabel++;
  }
// ********************************************************************************************************
  BusConnection=(BusConnectionRecord *)TempMem;
  BytesToRead=(int)Design.NrBusConnections*sizeof(BusConnectionRecord);
  FileRead(Designfp,TempMem       ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrBusConnections;cnt++) {
    sprintf(str,"%s<BusConnection>",TabStrings[2]);
    AddToMessageBuf(str);
    Coor[0]=BusConnection->X;
    Coor[1]=BusConnection->Y;
    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    XmlWriteInt(3,"Rotation",BusConnection->Info);
    sprintf(str,"%s</BusConnection>",TabStrings[2]);
    AddToMessageBuf(str);

    BusConnection++;
  }
// ********************************************************************************************************
  GlobalConnection=(GlobalConnectionRecord *)TempMem;
  BytesToRead=(int)Design.NrGlobalConnections*sizeof(GlobalConnectionRecord);
  FileRead(Designfp,TempMem       ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrGlobalConnections;cnt++) {
    sprintf(str,"%s<GlobalConnection>",TabStrings[2]);
    AddToMessageBuf(str);
    Coor[0]=GlobalConnection->X;
    Coor[1]=GlobalConnection->Y;
    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    XmlWriteInt(3,"Rotation",GlobalConnection->Info);
    switch (GlobalConnection->ConnectionType >> 1) {
      case 0:
        XmlWriteString(3,"Type","input");
        break;
      case 1:
        XmlWriteString(3,"Type","output");
        break;
      case 2:
        XmlWriteString(3,"Type","i/o");
        break;
    }
    XmlWriteString(3,"Name",GlobalConnection->Text);
    sprintf(str,"%s</GlobalConnection>",TabStrings[2]);
    AddToMessageBuf(str);

    GlobalConnection++;
  }

// ********************************************************************************************************

  ObjectLine=(SchObjectLineRecord *)TempMem;
  OldObjectLine=(SchOldObjectLineRecord *)TempMem2;
  for (cnt=0;cnt<Design.NrObjectLines;cnt++) {
    if (!Version30) {
      memset(ObjectLine,0,sizeof(ObjectLine));
      FileRead(Designfp,OldObjectLine,sizeof(OldObjectLineRecord),&result);
      ObjectLine->X1=OldObjectLine->X1;
      ObjectLine->Y1=OldObjectLine->Y1;
      ObjectLine->X2=OldObjectLine->X2;
      ObjectLine->Y2=OldObjectLine->Y2;
      ObjectLine->Info=OldObjectLine->Info;
      ObjectLine->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectLineRecord);
      FileRead(Designfp,ObjectLine  ,BytesToRead,&result);
    }
    sprintf(str,"%s<Line>",TabStrings[2]);
    AddToMessageBuf(str);
    XmlWriteFloat(3,"LineWidth",ObjectLine->Thickness,StandardUnits);
    XmlWriteInt(3,"LineMode",ObjectLine->LineMode);
    Coor[0]=ObjectLine->X1;
    Coor[1]=ObjectLine->Y1;
    Coor[2]=ObjectLine->X2;
    Coor[3]=ObjectLine->Y2;
    XmlWritePoints(3,"Coor",(double *)&Coor[0],4,StandardUnits);
    sprintf(str,"%s</Line>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  ObjectRect=(SchObjectRectRecord *)TempMem;
  OldObjectRect=(SchOldObjectRectRecord *)TempMem2;
  for (cnt=0;cnt<Design.NrObjectRects;cnt++) {
    if (!Version30) {
      memset(ObjectRect,0,sizeof(ObjectRect));
      FileRead(Designfp,OldObjectRect,sizeof(OldObjectRectRecord),&result);
      ObjectRect->CentreX=OldObjectRect->CentreX;
      ObjectRect->CentreY=OldObjectRect->CentreY;
      ObjectRect->Width=OldObjectRect->Width;
      ObjectRect->Height=OldObjectRect->Height;
      ObjectRect->Info=OldObjectRect->Info;
      ObjectRect->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectRectRecord);
      FileRead(Designfp,ObjectRect  ,BytesToRead,&result);
    }
    if (ObjectRect->Info & OBJECT_FILLED) {
      sprintf(str,"%s<RectanglePad>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Width",ObjectRect->Width,StandardUnits);
      XmlWriteFloat(3,"Height",ObjectRect->Height,StandardUnits);

      Coor[0]=ObjectRect->CentreX;
      Coor[1]=ObjectRect->CentreY;

      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</RectanglePad>",TabStrings[2]);
      AddToMessageBuf(str);
    } else {
      sprintf(str,"%s<Rectangle>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Width",ObjectRect->Width,StandardUnits);
      XmlWriteFloat(3,"Height",ObjectRect->Height,StandardUnits);
      XmlWriteFloat(3,"LineWidth",ObjectRect->Thickness,StandardUnits);

      Coor[0]=ObjectRect->CentreX;
      Coor[1]=ObjectRect->CentreY;

      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</Rectangle>",TabStrings[2]);
      AddToMessageBuf(str);
    }
  }

// ********************************************************************************************************

  ObjectCircle=(SchObjectCircleRecord *)TempMem;
  OldObjectCircle=(SchOldObjectCircleRecord *)TempMem2;
  for (cnt=0;cnt<Design.NrObjectCircles;cnt++) {
    if (!Version30) {
      memset(ObjectCircle,0,sizeof(ObjectCircle));
      FileRead(Designfp,OldObjectCircle,sizeof(OldObjectCircleRecord),&result);
      ObjectCircle->CentreX=OldObjectCircle->CentreX;
      ObjectCircle->CentreY=OldObjectCircle->CentreY;
      ObjectCircle->Diam=OldObjectCircle->Diam;
      ObjectCircle->CircleMode=OldObjectCircle->CircleMode;
      ObjectCircle->Info=OldObjectCircle->Info;
      ObjectCircle->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectCircleRecord);
      FileRead(Designfp,ObjectCircle  ,BytesToRead,&result);
    }
    sprintf(str,"%s<Arc>",TabStrings[2]);
    AddToMessageBuf(str);
    XmlWriteFloat(3,"Diam",ObjectCircle->Diam,StandardUnits);
    XmlWriteFloat(3,"LineWidth",ObjectCircle->Thickness,StandardUnits);

    Coor[0]=ObjectCircle->CentreX;
    Coor[1]=ObjectCircle->CentreY;
    XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
    Coor[0]=0.0;
    Coor[1]=0.0;
    Coor[2]=0.0;
    Coor[3]=0.0;
/*
              /-------------\
             /       |       \
            /        |        \
           /         |         \
          /          |          \
         /      8    |     1     \
        /            |            \
       /             |             \
       -----------------------------
       \             |             /
        \            |            /
         \      4    |     2     /
          \          |          /
           \         |         /
            \        |        /
             \       |       /
              \-------------/

*/
    switch (ObjectCircle->CircleMode) {
      case 1:
        Coor[0]=ObjectCircle->Diam*0.5;
        Coor[3]=ObjectCircle->Diam*0.5;
        break;
      case 2:
        Coor[1]=-ObjectCircle->Diam*0.5;
        Coor[2]=ObjectCircle->Diam*0.5;
        break;
      case 3:
        Coor[1]=-ObjectCircle->Diam*0.5;
        Coor[3]=ObjectCircle->Diam*0.5;
        break;
      case 4:
        Coor[0]=-ObjectCircle->Diam*0.5;
        Coor[3]=-ObjectCircle->Diam*0.5;
        break;
      case 6:
        Coor[0]=-ObjectCircle->Diam*0.5;
        Coor[2]=ObjectCircle->Diam*0.5;
        break;
      case 8:
        Coor[1]=ObjectCircle->Diam*0.5;
        Coor[2]=-ObjectCircle->Diam*0.5;
        break;
      case 9:
        Coor[0]=ObjectCircle->Diam*0.5;
        Coor[2]=-ObjectCircle->Diam*0.5;
        break;
      case 12:
        Coor[1]=ObjectCircle->Diam*0.5;
        Coor[3]=-ObjectCircle->Diam*0.5;
        break;
      case 15:
        Coor[1]=ObjectCircle->Diam*0.5;
        Coor[3]=ObjectCircle->Diam*0.5;
        break;
    }
    XmlWritePoints(3,"Start",(double *)&Coor[0],2,StandardUnits);
    XmlWritePoints(3,"End",(double *)&Coor[2],2,StandardUnits);
    sprintf(str,"%s</Arc>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  ObjectArc=(SchObjectArcRecord *)TempMem;
  OldObjectArc=(SchOldObjectArcRecord *)TempMem2;
  for (cnt=0;cnt<Design.NrObjectArcs;cnt++) {
    if (!Version30) {
      memset(ObjectArc,0,sizeof(ObjectArc));
      FileRead(Designfp,OldObjectArc,sizeof(SchOldObjectArcRecord),&result);
      ObjectArc->CentreX=OldObjectArc->CentreX;
      ObjectArc->CentreY=OldObjectArc->CentreY;
      ObjectArc->Width=OldObjectArc->Width;
      ObjectArc->Height=OldObjectArc->Height;
      ObjectArc->StartDiffX=OldObjectArc->StartDiffX;
      ObjectArc->StartDiffY=OldObjectArc->StartDiffY;
      ObjectArc->EndDiffX=OldObjectArc->EndDiffX;
      ObjectArc->EndDiffY=OldObjectArc->EndDiffY;
      ObjectArc->Info=OldObjectArc->Info;
      ObjectArc->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectArcRecord);
      FileRead(Designfp,ObjectArc ,BytesToRead,&result);
    }
    if (ObjectArc->Info & OBJECT_FILLED) {
      sprintf(str,"%s<CirclePad>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Diameter",ObjectArc->Width,StandardUnits);

      Coor[0]=ObjectArc->CentreX;
      Coor[1]=ObjectArc->CentreY;

      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</CirclePad>",TabStrings[2]);
      AddToMessageBuf(str);
    } else {
      sprintf(str,"%s<Arc>",TabStrings[2]);
      AddToMessageBuf(str);
      XmlWriteFloat(3,"Diam",ObjectArc->Width,StandardUnits);
      XmlWriteFloat(3,"LineWidth",ObjectArc->Thickness,StandardUnits);

      Coor[0]=ObjectArc->CentreX;
      Coor[1]=ObjectArc->CentreY;
      XmlWritePoints(3,"Center",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=ObjectArc->StartDiffX;
      Coor[1]=ObjectArc->StartDiffY;
      XmlWritePoints(3,"Start",(double *)&Coor[0],2,StandardUnits);
      Coor[0]=ObjectArc->EndDiffX;
      Coor[1]=ObjectArc->EndDiffY;
      XmlWritePoints(3,"End",(double *)&Coor[0],2,StandardUnits);
      sprintf(str,"%s</Arc>",TabStrings[2]);
      AddToMessageBuf(str);
    }
  }

// ********************************************************************************************************

  ObjectText=(SchObjectTextRecord *)TempMem;
  OldObjectText=(SchOldObjectTextRecord *)TempMem2;
  for (cnt=0;cnt<Design.NrObjectTexts;cnt++) {
    if (!Version30) {
      memset(ObjectText,0,sizeof(ObjectText));
      FileRead(Designfp,OldObjectText,sizeof(SchOldObjectTextRecord),&result);
      ObjectText->X=OldObjectText->X;
      ObjectText->Y=OldObjectText->Y;
      ObjectText->FontHeight=OldObjectText->FontHeight;
      ObjectText->TextMode=(int16)(OldObjectText->TextMode & 0x0f);
      ObjectText->Rotation=(float)((OldObjectText->TextMode >> 8) * 90.0);
      strcpy(ObjectText->Text,OldObjectText->Text);
      ObjectText->Thickness=(float)STANDARD_LINE_THICKNESS;
    } else {
      BytesToRead=sizeof(SchObjectTextRecord);
      FileRead(Designfp,ObjectText ,BytesToRead,&result);
    }
    sprintf(str,"%s<Text>",TabStrings[2]);
    AddToMessageBuf(str);
    XmlWriteFloat(3,"Height",ObjectText->FontHeight,StandardUnits);
    XmlWriteFloat2(3,"Rotation",ObjectText->Rotation,1);
    XmlWriteFloat(3,"LineWidth",ObjectText->Thickness,StandardUnits);
//    XmlWriteInt(3,"FontNr",ObjectText->FontNr);
    XmlWriteInt(3,"TextMode",ObjectText->TextMode);
    XmlWriteString(3,"TextValue",ObjectText->Text);

    Coor[0]=ObjectText->X;
    Coor[1]=ObjectText->Y;

    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    sprintf(str,"%s</Text>",TabStrings[2]);
    AddToMessageBuf(str);
  }

// ********************************************************************************************************

  RedefinedPinBus=(RedefinedPinBusRecord *)TempMem;
  BytesToRead=(int)Design.NrRedefinedPinBusses*sizeof(RedefinedPinBusRecord);
  FileRead(Designfp,TempMem        ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrRedefinedPinBusses;cnt++) {
    sprintf(str,"%s<RedefinedPinBus>",TabStrings[2]);
    AddToMessageBuf(str);
    XmlWriteString(3,"Name",RedefinedPinBus->Name);
    XmlWriteString(3,"Reference",RedefinedPinBus->Reference);
    for (cnt2=0;cnt2<64;cnt2++) {
      Values[cnt2]=RedefinedPinBus->Order[cnt2];
    }
    XmlWriteInts(3,"Order",&Values[0],64);
    sprintf(str,"%s</RedefinedPinBus>",TabStrings[2]);
    AddToMessageBuf(str);

    RedefinedPinBus++;
  }

// ********************************************************************************************************

  OnePinNet=(OnePinNetRecord *)TempMem;
  BytesToRead=(int)Design.NrOnePinNets*sizeof(OnePinNetRecord);
  FileRead(Designfp,TempMem    ,BytesToRead,&result);
  for (cnt=0;cnt<Design.NrOnePinNets;cnt++) {
    sprintf(str,"%s<OnePinNet>",TabStrings[2]);
    AddToMessageBuf(str);
    Coor[0]=OnePinNet->X;
    Coor[1]=OnePinNet->Y;
    XmlWritePoints(3,"Position",(double *)&Coor[0],2,StandardUnits);
    sprintf(str,"%s</OnePinNet>",TabStrings[2]);
    AddToMessageBuf(str);

    OnePinNet++;
  }

// ********************************************************************************************************
  FileClose(Designfp);

  sprintf(str,"%s</Data>",TabStrings[1]);
  AddToMessageBuf(str);
  strcpy(str,"</PcbEleganceSchematic>");
  AddToMessageBuf(str);

  strcpy(str,FileName);
  CutExtensionFileName(str);
  strcat(str,".xml");
  fp=FileOpenWrite(str);
  if (fp>0) {
    FileWrite(fp,MessageBuf,MessageBufPos,&result);
    FileClose(fp);
  }
  printf("Pcb elegance xml schematic file %s has been created\n",str);

  return 0;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

int32 main(int32 argc,char **argv)

{
  char  str[200],str2[200],Identification[32];
  int32 SizeFile,Designfp,result;

  memset(&Identification,0,sizeof(Identification));
  SizeFile=FileSize(argv[1]);
  AllocateMemTemp(SizeFile);
  AllocateMemTemp2(1024*1024);

  if (argc<=1) {
    printf("\nUsage:\n\n");
    printf("pcbeleg_to_xml <geometry/schematic/symbol/layout file>\n\n");
    return -1;
  }
  if ((Designfp=FileOpenReadOnly(argv[1]))==-1) {
    printf("Could not open file %s\n",argv[1]);
    return -1;
  }
  if (FileRead(Designfp,&Identification,sizeof(Identification)-1,&result)==-1) {
    printf("Could not read from file %s\n",argv[1]);
    return -1;
  }
  FileClose(Designfp);

  if ((strcmp(Identification,SheetCode1)==0)
     ||
     (strcmp(Identification,SheetCode2)==0)
     ||
     (strcmp(Identification,SheetCode3)==0)
     ||
     (strcmp(Identification,SheetCode4)==0)
     ||
     (strcmp(Identification,SheetCode5)==0)) {
    XmlExportSchematic(argv[1]);
    return 0;
  }

  if ((strcmp(Identification,SymbolCode1)==0)
     ||
     (strcmp(Identification,SymbolCode2)==0)
     ||
     (strcmp(Identification,SymbolCode3)==0)) {
    XmlExportSymbol(argv[1]);
    return 0;
  }

  if ((strcmp(Identification,PCBCode)==0)
     ||
     (strcmp(Identification,PCBCode2)==0)
     ||
     (strcmp(Identification,PCBCode3)==0)) {
    XmlExportLayout(argv[1]);
    return 0;
  }

  if ((strcmp(Identification,ShapeCode)==0)
     ||
     (strcmp(Identification,ShapeCode2)==0)
     ||
     (strcmp(Identification,ShapeCode3)==0)) {
    XmlExportGeometry(argv[1]);
    return 0;
  }
  printf("Could not identify file %s as a geometry/schematic/symbol/layout\n",argv[1]);
  return -2;
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

