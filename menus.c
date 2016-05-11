/*
 * PCB elegance (Open source tools for making printed circuit boards)
 *
 * Copyright (C) 2012  Herman Morsink Vollenbroek
 *
 * File: menus.c 
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



#include "types.h"
#include "menus.h"
#include "graphics.h"
#include "memory.h"
#include "mainloop.h"
#include "stdlib.h"
#include "resource.h"
#include "resource2.h"
#include "pcb.h"
#include "calc.h"
#include "calcdef.h"
#include "calc3.h"
#include "calc4.h"
#include "select.h"
#include "stdio.h"
#include "toets.h"
#include "files2.h"

#define PopUpMenuX     30
#define PopUpMenuY     30

#define NrDefaultObjectLayers  17

HMENU   CheckLayerMenu=0;
HMENU   CheckMenu=0;


HBITMAP BitMapCircle_F;
HBITMAP BitMapCircle_3;
HBITMAP BitMapCircle_6;
HBITMAP BitMapCircle_C;
HBITMAP BitMapCircle_9;
HBITMAP BitMapCircle_1;
HBITMAP BitMapCircle_2;
HBITMAP BitMapCircle_4;
HBITMAP BitMapCircle_8;
HBITMAP BitMapHatch1;
HBITMAP BitMapHatch2;
HBITMAP BitMapHatch3;
HBITMAP BitMapHatch4;
HBITMAP BitMapCross1;
HBITMAP BitMapCross2;
HBITMAP BitMapRectangle;
HBITMAP BitMapPolyline;
HBITMAP BitMapCircle2;
HBITMAP BitMapHorTrace;
HBITMAP BitMapVerTrace;
HBITMAP BitMapLine2;
HBITMAP BitMapLine3;
HBITMAP BitMapLine4;
HBITMAP BitMapDimension1;
HBITMAP BitMapDimension2;
HBITMAP BitMapLeft;
HBITMAP BitMapRight;

HMENU   PCBMenu,
        PCBMenu1,
        PCBMenu1a,
        PCBMenu1b,
        PCBMenu1c,
        PCBMenu1d,
        PCBMenu1e,
        PCBMenu2,
        PCBMenu2a,
        PCBMenu3,
        PCBMenu4,
        PCBMenu5,
        PCBMenu6,
        PCBMenu6a,
        PCBMenu6b,
        PCBMenu7,
        PCBMenu8,
        PCBMenu9,
        PCBMenu10;

HMENU  PopUpMenu,
       PopUpMenu1,
       PopUpMenu11,
       PopUpMenu12,
       PopUpMenu13Copy,
       PopUpMenu13,
       PopUpMenu14,
       PopUpMenu15,
       PopUpMenu16,
       PopUpMenu17,
       PopUpMenu18,
       PopUpMenu19,
       PopUpMenu20,
       PopUpMenu2,
       PopUpMenu21,
       PopUpMenu22,
       PopUpMenu23,
       PopUpMenu24,
       PopUpMenu25,
       PopUpMenu26,
       PopUpMenu27,
       PopUpMenu30,
       PopUpMenu31,
       PopUpMenu32,
       PopUpMenu33,
       PopUpMenu34,
       PopUpMenu35,
       PopUpMenu36,
       PopUpMenu3,
       PopUpMenu100,
       PopUpMenu101,
       PopUpMenu102,
       PopUpMenu110,
       PopUpMenu111,
       PopUpMenu120,
       PopUpMenu121,
       PopUpMenu130,
       PopUpMenu131,
       PopUpMenu140,
       PopUpMenu141,
       PopUpMenu150,
       PopUpMenu151,
       PopUpMenu152,
       PopUpMenu153,
       PopUpMenu160,
       PopUpMenu170,
       PopUpMenu180,
       PopUpMenu190,
       PopUpMenu200,
       PopUpMenu201,
       PopUpMenu210,
       PopUpMenu211,
       PopUpMenu220,
       PopUpMenu221,
       PopUpMenu230,
       PopUpMenu240,
       RoutingKeepoutPopUpMenu[32],
       TraceLayerPopUpMenu[32],
       DynamicPopUpMenus[128],
       PopUpMenu1000;


int32 ObjectsLayers[120]={
          BOARD_OUTLINE_LAYER,
          INFO_LAYER,
          INFO_LAYER2,
          INFO_LAYER3,
          INFO_LAYER4,
          -1,
          SILKSCREEN_TOP,
          SILKSCREEN_BOTTOM,
          -1,
          SOLD_MASK_BOTTOM,
          SOLD_MASK_TOP,
          PASTE_MASK_BOTTOM,
          PASTE_MASK_TOP,
          -1,
          DRILL_LAYER,
          DRILL_UNPLATED_LAYER,
          -1};

int32   NrObjectLayers,DynamicPopUpMenuNr;
int32   MenuCodes[4096];
int32   NrMenuCodes=0;

int32   ExtendedResource[4096];
int32   NrExtendedResources;

extern    int32              CrossHairType,ProjectIndexNr,TraceDrawingMode;
extern    ProjectInfoRecord  *ProjectInfo;


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 GetExtendedResource(int32 index)

{
  return ExtendedResource[index];
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 GetMenuCode(int32 MenuCommand,int32 mode)

{
  int32  cnt;

  if (mode==0) {
    cnt=0;
    while ((cnt<NrMenuCodes)
          &&
          (MenuCodes[cnt]!=MenuCommand)) cnt++;
    if (cnt==NrMenuCodes) { // Add menu command
      if (NrMenuCodes<4095) {
        MenuCodes[NrMenuCodes++]=MenuCommand;
        return MENU_CODE_START+cnt;
      }
      return MENU_CODE_START+4095;
    } else {
      return MENU_CODE_START+cnt;
    }
  } else {
    cnt=MenuCommand-MENU_CODE_START;
    if ((MenuCommand>=MENU_CODE_START)
       &&
       (cnt<NrMenuCodes)) {
      return MenuCodes[cnt];
    }
  }
  return 0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************


int32 LoadBitMaps()


{
  BitMapCircle_F           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_F));
  BitMapCircle_3           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_3));
  BitMapCircle_6           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_6));
  BitMapCircle_C           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_C));
  BitMapCircle_9           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_9));
  BitMapCircle_1           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_1));
  BitMapCircle_2           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_2));
  BitMapCircle_4           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_4));
  BitMapCircle_8           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE_8));
  BitMapHatch1             = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_HATCH1));
  BitMapHatch2             = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_HATCH2));
  BitMapHatch3             = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_HATCH3));
  BitMapHatch4             = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_HATCH4));
  BitMapRectangle          = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_RECTANGLE));
  BitMapPolyline           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_POLYLINE));
  BitMapCircle2            = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CIRCLE2));
  BitMapHorTrace           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_HOR_TRACE));
  BitMapVerTrace           = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_VER_TRACE));

  BitMapLine2              = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_LINE2));
  BitMapLine3              = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_LINE3));
  BitMapLine4              = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_LINE4));
  BitMapDimension1         = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_DIMENSION1));
  BitMapDimension2         = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_DIMENSION2));
  BitMapCross1             = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CROSS1));
  BitMapCross2             = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_CROSS2));
  return 0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void CreatePopupMenus()

{
  int32 cnt;
  NrExtendedResources=0;
  PopUpMenu=CreatePopupMenu();
  PopUpMenu1=CreatePopupMenu();
  PopUpMenu11=CreatePopupMenu();
  PopUpMenu12=CreatePopupMenu();
  PopUpMenu13=CreatePopupMenu();
  PopUpMenu13Copy=CreatePopupMenu();
  PopUpMenu14=CreatePopupMenu();
  PopUpMenu15=CreatePopupMenu();
  PopUpMenu14=CreatePopupMenu();
  PopUpMenu15=CreatePopupMenu();
  PopUpMenu16=CreatePopupMenu();
  PopUpMenu17=CreatePopupMenu();
  PopUpMenu18=CreatePopupMenu();
  PopUpMenu19=CreatePopupMenu();
  PopUpMenu20=CreatePopupMenu();
  PopUpMenu21=CreatePopupMenu();
  PopUpMenu22=CreatePopupMenu();
  PopUpMenu23=CreatePopupMenu();
  PopUpMenu24=CreatePopupMenu();
  PopUpMenu25=CreatePopupMenu();
  PopUpMenu26=CreatePopupMenu();
  PopUpMenu27=CreatePopupMenu();
  PopUpMenu30=CreatePopupMenu();
  PopUpMenu31=CreatePopupMenu();
  PopUpMenu32=CreatePopupMenu();
  PopUpMenu33=CreatePopupMenu();
  PopUpMenu34=CreatePopupMenu();
  PopUpMenu35=CreatePopupMenu();
  PopUpMenu36=CreatePopupMenu();
  PopUpMenu100=CreatePopupMenu();
  PopUpMenu101=CreatePopupMenu();
  PopUpMenu102=CreatePopupMenu();
  PopUpMenu110=CreatePopupMenu();
  PopUpMenu111=CreatePopupMenu();
  PopUpMenu120=CreatePopupMenu();
  PopUpMenu121=CreatePopupMenu();
  PopUpMenu130=CreatePopupMenu();
  PopUpMenu131=CreatePopupMenu();
  PopUpMenu140=CreatePopupMenu();
  PopUpMenu141=CreatePopupMenu();
  PopUpMenu150=CreatePopupMenu();
  PopUpMenu151=CreatePopupMenu();
  PopUpMenu152=CreatePopupMenu();
  PopUpMenu153=CreatePopupMenu();
  PopUpMenu150=CreatePopupMenu();
  PopUpMenu160=CreatePopupMenu();
  PopUpMenu170=CreatePopupMenu();
  PopUpMenu180=CreatePopupMenu();
  PopUpMenu190=CreatePopupMenu();
  PopUpMenu200=CreatePopupMenu();
  PopUpMenu201=CreatePopupMenu();
  PopUpMenu210=CreatePopupMenu();
  PopUpMenu211=CreatePopupMenu();
  PopUpMenu220=CreatePopupMenu();
  PopUpMenu221=CreatePopupMenu();
  PopUpMenu230=CreatePopupMenu();
  PopUpMenu240=CreatePopupMenu();
  PopUpMenu1000=CreatePopupMenu();
  for (cnt=0;cnt<32;cnt++) {
    RoutingKeepoutPopUpMenu[cnt]=CreatePopupMenu();
    TraceLayerPopUpMenu[cnt]=CreatePopupMenu();
  }
  for (cnt=0;cnt<128;cnt++) {
    DynamicPopUpMenus[cnt]=CreatePopupMenu();
  }
  DynamicPopUpMenuNr=0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void DestroyPopupMenus()

{
  int32 cnt;
  DestroyMenu(PopUpMenu    );
  DestroyMenu(PopUpMenu1   );
  DestroyMenu(PopUpMenu11  );
  DestroyMenu(PopUpMenu12  );
  DestroyMenu(PopUpMenu13  );
  DestroyMenu(PopUpMenu13Copy  );
  DestroyMenu(PopUpMenu14  );
  DestroyMenu(PopUpMenu15  );
  DestroyMenu(PopUpMenu14  );
  DestroyMenu(PopUpMenu15  );
  DestroyMenu(PopUpMenu16  );
  DestroyMenu(PopUpMenu17  );
  DestroyMenu(PopUpMenu18  );
  DestroyMenu(PopUpMenu19  );
  DestroyMenu(PopUpMenu20  );
  DestroyMenu(PopUpMenu21  );
  DestroyMenu(PopUpMenu22  );
  DestroyMenu(PopUpMenu23  );
  DestroyMenu(PopUpMenu24  );
  DestroyMenu(PopUpMenu25  );
  DestroyMenu(PopUpMenu26  );
  DestroyMenu(PopUpMenu27  );
  DestroyMenu(PopUpMenu30  );
  DestroyMenu(PopUpMenu31  );
  DestroyMenu(PopUpMenu32  );
  DestroyMenu(PopUpMenu33  );
  DestroyMenu(PopUpMenu34  );
  DestroyMenu(PopUpMenu35  );
  DestroyMenu(PopUpMenu36  );
  DestroyMenu(PopUpMenu100 );
  DestroyMenu(PopUpMenu101 );
  DestroyMenu(PopUpMenu102 );
  DestroyMenu(PopUpMenu110 );
  DestroyMenu(PopUpMenu111 );
  DestroyMenu(PopUpMenu120 );
  DestroyMenu(PopUpMenu121 );
  DestroyMenu(PopUpMenu130 );
  DestroyMenu(PopUpMenu131 );
  DestroyMenu(PopUpMenu140 );
  DestroyMenu(PopUpMenu141 );
  DestroyMenu(PopUpMenu150 );
  DestroyMenu(PopUpMenu151 );
  DestroyMenu(PopUpMenu152 );
  DestroyMenu(PopUpMenu153 );
  DestroyMenu(PopUpMenu160 );
  DestroyMenu(PopUpMenu170 );
  DestroyMenu(PopUpMenu180 );
  DestroyMenu(PopUpMenu190 );
  DestroyMenu(PopUpMenu200 );
  DestroyMenu(PopUpMenu201 );
  DestroyMenu(PopUpMenu210 );
  DestroyMenu(PopUpMenu211 );
  DestroyMenu(PopUpMenu220 );
  DestroyMenu(PopUpMenu221 );
  DestroyMenu(PopUpMenu230 );
  DestroyMenu(PopUpMenu240 );
  DestroyMenu(PopUpMenu1000);
  for (cnt=0;cnt<32;cnt++) {
    DestroyMenu(RoutingKeepoutPopUpMenu[cnt]);
    DestroyMenu(TraceLayerPopUpMenu[cnt]);
  }
  for (cnt=0;cnt<128;cnt++) {
    DestroyMenu(DynamicPopUpMenus[cnt]);
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 OwnAppendMenu(HMENU Menu,UINT MenuOptions,UINT MenuId,LPSTR Text)

{
  char  str[MAX_LENGTH_STRING],str2[MAX_LENGTH_STRING];
  int32 res,ok,Mask;

  if (((MenuOptions & (MF_SEPARATOR|MF_POPUP))==0)
     &&
     (MenuId>0x10000)) {
    if (NrExtendedResources>=4096) {
      return 0;
    }
    ExtendedResource[NrExtendedResources]=MenuId;
    MenuId=ID_EXT_RESOURCE+NrExtendedResources;
    NrExtendedResources++;
  }
  ok=MF_STRING;
  Mask=MF_SEPARATOR|MF_BITMAP|MF_OWNERDRAW|MF_POPUP;
  if ((MenuOptions & Mask) == 0) {
    if (Text==NULL) {
      res=1;
    }
    sprintf(str,Text);
    if (GetKeyString(str2,MenuId,0x11)==1) {
      strcat(str,str2);
    }
    AppendMenuOwn(Menu,MenuOptions,MenuId,str);
  } else {
    AppendMenuOwn(Menu,MenuOptions,MenuId,Text);
  }
  return 0;
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpMoveComponentsTracesVias()

{
  int32 NrTracesSelected,NrViasSelected,NrCompsSelected;

  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)0);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,SC(685,"Drag traces/vias/components menu"));
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  NrTracesSelected=GetNrTracesSelected();
  NrViasSelected=GetNrViasSelected();
  NrCompsSelected=GetNrCompsSelected();
  if ((NrCompsSelected>0)
     ||
     (NrTracesSelected>0)
     ||
     (NrViasSelected>0)) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_DRAG_OBJECTS,SC(539,"Drag traces/components/vias"));
  } else {
    if ((OkToDrawErrors)
       &&
       (NrErrorObjects>0)) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_NEXT_ERROR,SC(540,"Cycle through design rule errors/warnings"));
    }
  }
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpRouting()

{
  int32 cnt;

  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)1);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,SC(677,"Routing menu"));
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_ADD_EXTRA_TRACE,SC(541,"Add extra trace"));
  if (Design.NrBoardLayers==2) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_NEAREST_LAYER,SC(542,"Switch to other layer"));
  } else {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_NEAREST_LAYER,SC(543,"Switch to nearest layer"));
  }
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu11,SC(544,"Select layer"));
  for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
    OwnAppendMenu(PopUpMenu11,MF_OWNERDRAW,
               ID_SELECT_LAYER+ID_SWITCH_TO_LAYER+Design.NrBoardLayers-1-cnt,
               (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt]));
  }
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_FIND_UNROUTED_NET,SC(545,"Start routing with the shortest net"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_RESET_FIRST_UNROUTED_NET,SC(546,"Reset find shortest net"));


  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_CENTER_ON_CONNECTION,SC(547,"Center view on next connection"));
  if ((OkToDrawErrors)
     &&
     (NrErrorObjects>0)) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_NEXT_ERROR,SC(540,"Cycle through design rule errors/warnings"));
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpDragOneTrace()

{
  int32  NrTracesSelected;

  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)2);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,SC(678,"Trace drag menu"));
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  NrTracesSelected=GetNrTracesSelected();
  if (NrTracesSelected==1) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_DRAG_OBJECTS,SC(548,"Drag trace"));
    LastAction=2;
  }
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpComponents()

{
  int32 cnt,NrCompsSelected,CodedLayer,Layer;
  CompRecord  *Comp;
  char  str[MAX_LENGTH_STRING];


  NrObjectLayers=NrDefaultObjectLayers;
  for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
    ObjectsLayers[NrObjectLayers++]=Design.NrBoardLayers-cnt-1;
  }
  ObjectsLayers[NrObjectLayers++]=-1;
  for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
    ObjectsLayers[NrObjectLayers++]=Design.NrBoardLayers-cnt-1+ROUTING_KEEPOUT_LAYER;
  }

  NrCompsSelected=GetNrCompsSelected();
  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)3);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,"Components menu");
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  if (NrCompsSelected>0) {
// ********************************************************************************************************
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_MOVE_OBJECTS,SC(345,"Move"));

    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu30,SC(549,"Rotate"));
    OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_ROTATE_OBJECTS,SC(1294,"Rotate 90 degrees CCW"));
    OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_ROTATE_OBJECTS2,SC(1295,"Rotate at any angle CCW"));
    OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_ROTATE_COMPONENTS_EACH_45,SC(1296,"Rotate each at 45 degrees CCW"));
    OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_ROTATE_COMPONENTS_EACH_90,SC(1297,"Rotate each at 90 degrees CCW"));
    OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_ROTATE_COMPONENTS_EACH_ANGLE,SC(1298,"Rotate each at any angle CCW"));

    if (NrCompsSelected>1) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_REGROUP_COMP,SC(551,"Regroup"));
    }
    if (NrCompsSelected==2) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWAP_COMPONENTS,"Swap components");
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_PROTECT_COMP,SC(552,"Protect"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_MOVE_COMP_TO_TOP,SC(553,"Move components to top layer"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_MOVE_COMP_TO_BOTTOM,SC(554,"Move components to bottom layer"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_INFOSELECTEDOBJECTS,SC(555,"Component info"));
    if (NrCompsSelected==1) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
      for (cnt=0;cnt<Design.NrComps;cnt++) {
        Comp=(CompRecord *)&(CompsMem[(*Comps)[cnt]]);
        if ((Comp->Info & (OBJECT_NOT_VISIBLE|OBJECT_SELECTED)) == OBJECT_SELECTED) {
          sprintf(str,SC(556,"Edit geometry %s"),Comp->ShapeName);
          OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_GEOMETRIE,str);
          sprintf(str,SC(557,"Change geometry %s"),Comp->ShapeName);
          OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_CHANGE_GEOMETRIE,str);
          sprintf(str,SC(1232,"Edit schematic containing reference %s"),Comp->Name);
          OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_SCHEMATIC_ON_REF,str);
          if (Comp->PartNr[0]!=0) {
            sprintf(str,SC(1233,"Select all components with partnr %s"),Comp->PartNr);
            OwnAppendMenu(PopUpMenu27,MF_ENABLED|MF_STRING,ID_SELECT_BY_PARTNR,str);
          }
          sprintf(str,SC(1234,"Select all components with geometry %s"),Comp->ShapeName);
          OwnAppendMenu(PopUpMenu27,MF_ENABLED|MF_STRING,ID_SELECT_BY_GEOMETRY,str);
          sprintf(str,SC(1235,"Select all components with value %s"),Comp->Value);
          OwnAppendMenu(PopUpMenu27,MF_ENABLED|MF_STRING,ID_SELECT_BY_VALUE,str);
          if (Comp->PartNr[0]!=0) {
            sprintf(str,SC(1236,"Deselect all components with partnr %s"),Comp->PartNr);
            OwnAppendMenu(PopUpMenu27,MF_ENABLED|MF_STRING,ID_DESELECT_BY_PARTNR,str);
          }
          sprintf(str,SC(1237,"Deselect all components with geometry %s"),Comp->ShapeName);
          OwnAppendMenu(PopUpMenu27,MF_ENABLED|MF_STRING,ID_DESELECT_BY_GEOMETRY,str);
          sprintf(str,SC(1238,"Deselect all components with value %s"),Comp->Value);
          OwnAppendMenu(PopUpMenu27,MF_ENABLED|MF_STRING,ID_DESELECT_BY_VALUE,str);
          OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu27,SC(1239,"Component selections"));
          break;
        }
      }
    }
    if ((OkToDrawCompReference)
       ||
       (OkToDrawCompValue)) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
    }
    if (OkToDrawCompReference) {
      OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COMPREF_HIDE,SC(558,"Hide"));
      OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COMPREF_VISIBLE,SC(559,"Visible"));
      OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COMPREF_ONTOP,SC(560,"On top layer"));
      OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COMPREF_ONBOTTOM,SC(561,"On bottom layer"));
      OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COMPREF_HEIGHT,SC(226,"Height"));
      OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COMPREF_LINEWIDTH,SC(562,"Line width"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu11,SC(57,"Component references"));
    }
    if (OkToDrawCompValue) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_EDIT_TEXT,SC(563,"Edit"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_COMPVALUE_HIDE,SC(558,"Hide"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_COMPVALUE_VISIBLE,SC(559,"Visible"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_COMPVALUE_ONTOP,SC(560,"On top layer"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_COMPVALUE_ONBOTTOM,SC(561,"On bottom layer"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_COMPVALUE_HEIGHT,SC(226,"Height"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_COMPVALUE_LINEWIDTH,SC(562,"Line width"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu12,SC(58,"Component values"));
    }
//        AppendMenuOwn(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu13Copy,SC(564,"Copy objects component layer"));
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu13,SC(565,"Component outline to"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,BOARD_OUTLINE_LAYER);
//    MenuCommand=GetMenuCode(CodedLayer,0);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(61,"Board outline layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,INFO_LAYER);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(37,"Info layer 1"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,INFO_LAYER2);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(40,"Info layer 2"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,INFO_LAYER3);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(43,"Info layer 3"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,INFO_LAYER4);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(46,"Info layer 4"));
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_SEPARATOR,0,0);
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,SILKSCREEN_TOP);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(31,"Silkscreen top layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,SILKSCREEN_BOTTOM);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(35,"Silkscreen bottom layer"));
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_SEPARATOR,0,0);
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,SOLD_MASK_BOTTOM);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(65,"Solder mask bottom layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,SOLD_MASK_TOP);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(69,"Solder mask top layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,PASTE_MASK_BOTTOM);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(73,"Paste mask bottom layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,PASTE_MASK_TOP);
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,SC(77,"Paste mask top layer"));
    OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_SEPARATOR,0,0);
    for (cnt=Design.NrBoardLayers-1;cnt>=0;cnt--) {
      CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(COMP_OUTLINE_LAYER,ROUTING_KEEPOUT_LAYER+cnt);
      GetLayerTextObjects(ROUTING_KEEPOUT_LAYER+cnt,str,4);
      OwnAppendMenu(PopUpMenu13,MF_ENABLED|MF_STRING,CodedLayer,str);
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu14,SC(568,"Placement outline top to"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_TOP,BOARD_OUTLINE_LAYER);
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_STRING,CodedLayer,SC(61,"Board outline layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_TOP,INFO_LAYER);
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_STRING,CodedLayer,SC(37,"Info layer 1"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_TOP,INFO_LAYER2);
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_STRING,CodedLayer,SC(40,"Info layer 2"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_TOP,INFO_LAYER3);
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_STRING,CodedLayer,SC(43,"Info layer 3"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_TOP,INFO_LAYER4);
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_STRING,CodedLayer,SC(46,"Info layer 4"));
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_SEPARATOR,0,0);
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_TOP,SILKSCREEN_TOP);
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_STRING,CodedLayer,SC(31,"Silkscreen top layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_TOP,SILKSCREEN_BOTTOM);
    OwnAppendMenu(PopUpMenu14,MF_ENABLED|MF_STRING,CodedLayer,SC(35,"Silkscreen bottom layer"));
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu21,SC(568,"Placement outline bottom to"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_BOTTOM,BOARD_OUTLINE_LAYER);
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_STRING,CodedLayer,SC(61,"Board outline layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_BOTTOM,INFO_LAYER);
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_STRING,CodedLayer,SC(37,"Info layer 1"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_BOTTOM,INFO_LAYER2);
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_STRING,CodedLayer,SC(40,"Info layer 2"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_BOTTOM,INFO_LAYER3);
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_STRING,CodedLayer,SC(43,"Info layer 3"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_BOTTOM,INFO_LAYER4);
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_STRING,CodedLayer,SC(46,"Info layer 4"));
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_SEPARATOR,0,0);
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_BOTTOM,SILKSCREEN_TOP);
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_STRING,CodedLayer,SC(31,"Silkscreen top layer"));
    CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PLACEMENT_OUTLINE_BOTTOM,SILKSCREEN_BOTTOM);
    OwnAppendMenu(PopUpMenu21,MF_ENABLED|MF_STRING,CodedLayer,SC(35,"Silkscreen bottom layer"));
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu15,SC(569,"Silkscreen top to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(SILKSCREEN_TOP,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu15,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu15,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu16,SC(570,"Silkscreen bottom to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(SILKSCREEN_BOTTOM,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu16,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu16,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu17,SC(571,"Info objects 1 to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(INFO_LAYER,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu17,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu17,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu18,SC(572,"Info objects 2 to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(INFO_LAYER2,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu18,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu18,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu19,SC(573,"Info objects 3 to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(INFO_LAYER3,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu19,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu19,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu20,SC(574,"Info objects 4 to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(INFO_LAYER4,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu20,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu20,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_SEPARATOR,0,0);
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerTextObjects(Layer+ROUTING_KEEPOUT_LAYER,str,4);
      strcat(str,SC(575," to"));
      OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) RoutingKeepoutPopUpMenu[Layer],str);
      for (cnt=0;cnt<NrObjectLayers;cnt++) {
        if (ObjectsLayers[cnt]!=-1) {
          CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(Layer+ROUTING_KEEPOUT_LAYER,ObjectsLayers[cnt]);
          GetLayerTextObjects(ObjectsLayers[cnt],str,4);
          OwnAppendMenu(RoutingKeepoutPopUpMenu[Layer],MF_ENABLED|MF_STRING,CodedLayer,str);
        } else {
          OwnAppendMenu(RoutingKeepoutPopUpMenu[Layer],MF_ENABLED|MF_SEPARATOR,0,0);
        }
      }
    }
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_SEPARATOR,0,0);
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu23,SC(576,"Solder mask top to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(SOLD_MASK_TOP,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu23,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu23,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu24,SC(577,"Solder mask bottom to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(SOLD_MASK_BOTTOM,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu24,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu24,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu25,SC(578,"Paste mask top to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PASTE_MASK_TOP,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu25,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu25,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu13Copy,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu26,SC(579,"Paste mask bottom to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_COPY_COMP_OTHER_LAYER+CompressSrcDestLayer(PASTE_MASK_BOTTOM,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu26,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu26,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SELECT_COMPS_BY_LIST,SC(1256,"Select components by list"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_UNSELECT_COMP_TOP,SC(1170,"Unselect top components"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_UNSELECT_COMP_BOTTOM,SC(1171,"Unselect bottom components"));
// ********************************************************************************************************
    if (NrCompsSelected>1) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_ALIGN_COMP,SC(580,"Component alignment/spacing"));
    }
  } else {
// ********************************************************************************************************
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_MOVE_COMPBYREF,SC(581,"Move component by reference"));
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_SELECT_BY_PARTNR2,SC(1240,"Select all components with partnr"));
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_SELECT_BY_GEOMETRY2,SC(1241,"Select all components with geometry"));
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_SELECT_BY_VALUE2,SC(1242,"Select all components with value"));
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_DESELECT_BY_PARTNR2,SC(1243,"Deselect all components with partnr"));
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_DESELECT_BY_GEOMETRY2,SC(1244,"Deselect all components with geometry"));
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_DESELECT_BY_VALUE2,SC(1245,"Deselect all components with value"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu1,SC(1246,"Component selections"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SELECT_COMPS_BY_LIST,SC(1256,"Select components by list"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_MOVE_MULTIPLE_COMPS,SC(582,"Move multiple components by list"));
    if ((OkToDrawErrors)
       &&
       (NrErrorObjects>0)) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_NEXT_ERROR,SC(540,"Cycle through design rule errors/warnings"));
    }
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void AddObjectsPopUpItems(HMENU PopUpMenu,int32 EnableMask,int32 NewLayer,int32 mode)

{
/*
  mode:

   bit 0 = 1 -> Board outline layer
   bit 1 = 1 -> Copper layer
   bit 2 = 1 -> Routing keepout layer
   bit 3 = 1 -> Solder paste mask

*/

  HMENU NewMenu;

  if ((mode & 4)==0) {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_LINE_OBJECT+NewLayer,SC(462,"Line"));
  }
  if ((mode & (8+4+2+1))==0) {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_BITMAP,ID_ADD_LINE_OBJECT_ARROW1+NewLayer,(LPSTR)BitMapLine2);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_BITMAP,ID_ADD_LINE_OBJECT_ARROW2+NewLayer,(LPSTR)BitMapLine3);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_BITMAP,ID_ADD_LINE_OBJECT_ARROW3+NewLayer,(LPSTR)BitMapLine4);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_BITMAP,ID_ADD_DIMENSION_OBJECT+NewLayer,(LPSTR)BitMapDimension1);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_BITMAP,ID_ADD_DIMENSION_OBJECT2+NewLayer,(LPSTR)BitMapDimension2);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
  }
  if ((mode & (8+4))==0) {
    if ((mode & 16)==0) {
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_RECT_OBJECT+NewLayer,SC(583,"Rect"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_RECT2_OBJECT+NewLayer,SC(584,"Rect (4 lines)"));
    } else {
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_RECT2_OBJECT+NewLayer,SC(583,"Rect"));
    }
  }
  if ((mode & 1)==0) {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_RECT_PAD_OBJECT+NewLayer,SC(585,"Rect pad"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_CIRCLE_PAD_OBJECT+NewLayer,SC(586,"Circle pad"));
  }
  if ((mode & 4)==0) {
    NewMenu=DynamicPopUpMenus[DynamicPopUpMenuNr];
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) NewMenu,SC(587,"Circle arcs"));
    DynamicPopUpMenuNr++;
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_F+NewLayer,(LPSTR)BitMapCircle_F);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_3+NewLayer,(LPSTR)BitMapCircle_3);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_6+NewLayer,(LPSTR)BitMapCircle_6);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_C+NewLayer,(LPSTR)BitMapCircle_C);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_9+NewLayer,(LPSTR)BitMapCircle_9);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_1+NewLayer,(LPSTR)BitMapCircle_1);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_2+NewLayer,(LPSTR)BitMapCircle_2);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_4+NewLayer,(LPSTR)BitMapCircle_4);
    OwnAppendMenu(NewMenu,EnableMask|MF_BITMAP,ID_ADD_CIRCLE_OBJECT_8+NewLayer,(LPSTR)BitMapCircle_8);
  }
  if ((mode & 4)==0) {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_ARC_OBJECT+NewLayer,SC(588,"Arc"));
  }
  if ((mode & (8+4+1))==0) {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_TEXT2_OBJECT+NewLayer,SC(589,"Text"));
  }
  if ((mode & (8+4+2))==0) {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_POLYLINE_OBJECT+NewLayer,SC(105,"Polyline"));
  }
  if ((mode & 1)==0) {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_POLYGON_OBJECT+NewLayer,SC(590,"Polygon pad"));
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpObjects()

{
  int32 cnt,NrObjectsSelected,ok,NewLayer,Layer,CodedLayer;
  char  str[MAX_LENGTH_STRING];
  int32    res,EnableMask;


  NrObjectLayers=NrDefaultObjectLayers;
  for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
    ObjectsLayers[NrObjectLayers++]=Design.NrBoardLayers-cnt-1;
  }
  ObjectsLayers[NrObjectLayers++]=-1;
  for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
    ObjectsLayers[NrObjectLayers++]=Design.NrBoardLayers-cnt-1+ROUTING_KEEPOUT_LAYER;
  }

  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)6);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,SC(682,"Specials menu"));
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  NrObjectsSelected=GetNrObjectSelections(0,-1);
  if (NrObjectsSelected>0) {
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_MOVE_OBJECTS,SC(591,"Move objects"));
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_COPY_OBJECTS,SC(592,"Copy objects"));
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu11,SC(593,"Copy/move special"));
    OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COPY_ARRAY_OBJECTS,SC(594,"Copy objects using a 2D array"));
    OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_STRING,ID_COPY_POLAR_OBJECTS,SC(595,"Copy objects polar"));
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu34,SC(596,"Copy objects to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
#ifdef _DEBUG
        if (ObjectsLayers[cnt]==ROUTING_KEEPOUT_LAYER+2) {
          ok=1;
        }
#endif
        CodedLayer=ID_COPY_OTHER_LAYER+CompressSrcDestLayer(0,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu34,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu34,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
    OwnAppendMenu(PopUpMenu11,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu35,SC(494,"Move objects to"));
    for (cnt=0;cnt<NrObjectLayers;cnt++) {
      if (ObjectsLayers[cnt]!=-1) {
        CodedLayer=ID_MOVE_OTHER_LAYER+CompressSrcDestLayer(0,ObjectsLayers[cnt]);
        GetLayerTextObjects(ObjectsLayers[cnt],str,4);
        OwnAppendMenu(PopUpMenu35,MF_ENABLED|MF_STRING,CodedLayer,str);
      } else {
        OwnAppendMenu(PopUpMenu35,MF_ENABLED|MF_SEPARATOR,0,0);
      }
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu12,SC(597,"Modify object"));
    OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_ROTATE_OBJECTS,SC(598,"Rotate objects"));
    OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_SCALE_OBJECTS,SC(599,"Scale objects"));
    OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_MIRRORX_OBJECTS,SC(600,"Mirror objects X"));
    OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_MIRRORY_OBJECTS,SC(601,"Mirror objects Y"));
    if (GetNrObjectSelections(0,30)>0) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_CHANGE_CLEARANCE_WIDTH,SC(651,"Change clearance"));
    }
    if (GetNrObjectSelections(0,20)>0) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_CHANGE_LINE_WIDTH,SC(602,"Change line thickness"));
    }
    if (GetNrObjectSelections(0,2)>0) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_CHANGE_CIRCLE_OBJECT,SC(603,"Change circle diameter"));
    }
    if (GetNrObjectSelections(0,3)>0) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_CHANGE_ARC_OBJECT,SC(604,"Change arc width/height"));
    }
    if (GetNrObjectSelections(0,3)>0) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_CHANGE_ARC_OBJECT2,SC(605,"Change angles arc"));
    }
    if (GetNrObjectSelections(0,1)>0) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_CHANGE_RECT_OBJECT,SC(606,"Change rectangle width/height"));
    }
    if (GetNrObjectSelections(0,4)>0) {
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_EDIT_TEXT,SC(563,"Edit"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_CHANGE_TEXT_HEIGHT,SC(195,"Change text height"));
      OwnAppendMenu(PopUpMenu12,MF_ENABLED|MF_STRING,ID_MIRROR_TEXT,SC(607,"Mirror text"));
    }
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_ASSIGN_OBJECTS_TO_NET,SC(608,"Assign objects to a net"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_ASSIGN_OBJECTS_TO_NET2,SC(609,"Assign objects to a not used net"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_INFOSELECTEDOBJECTS,SC(610,"Info on selected objects"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
// ********************************************************************************************************

    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu31,SC(611,"Select only"));
    if (GetNrObjectSelections(0,0)>0) {
      OwnAppendMenu(PopUpMenu31,MF_ENABLED|MF_STRING,ID_SEL_ONLY_LINES,SC(612,"Lines"));
    }
    if (GetNrObjectSelections(0,1)>0) {
      OwnAppendMenu(PopUpMenu31,MF_ENABLED|MF_STRING,ID_SEL_ONLY_RECTANGLES,SC(613,"Rectangles"));
    }
/*
    if (GetNrObjectSelections(0,2)>0) {
      OwnAppendMenu(PopUpMenu31,MF_ENABLED|MF_STRING,ID_SEL_ONLY_CIRCLES,"Circles");
    }
*/
    if (GetNrObjectSelections(0,3)>0) {
      OwnAppendMenu(PopUpMenu31,MF_ENABLED|MF_STRING,ID_SEL_ONLY_ARCS,SC(614,"Arcs"));
    }
    if (GetNrObjectSelections(0,4)>0) {
      OwnAppendMenu(PopUpMenu31,MF_ENABLED|MF_STRING,ID_SEL_ONLY_TEXTS2,SC(589,"Text"));
    }
    if (GetNrObjectSelections(0,5)>0) {
      OwnAppendMenu(PopUpMenu31,MF_ENABLED|MF_STRING,ID_SEL_ONLY_POLYGONS,SC(615,"Polygons"));
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu30,SC(616,"Select only objects on layer"));
    if (GetNrObjectSelections(BOARD_OUTLINE_LAYER,100)>0) {
      OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_BOARDOUTLINE,SC(59,"Board outline"));
    }
    if (GetNrObjectSelections(INFO_LAYER,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_INFO,SC(617,"Info"));
      ok=1;
    }
    if (GetNrObjectSelections(INFO_LAYER2,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_INFO2,SC(39,"Info2"));
      ok=1;
    }
    if (GetNrObjectSelections(INFO_LAYER3,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_INFO3,SC(42,"Info3"));
      ok=1;
    }
    if (GetNrObjectSelections(INFO_LAYER4,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_INFO4,SC(45,"Info4"));
      ok=1;
    }
    if (GetNrObjectSelections(SILKSCREEN_TOP,100)>0) {
      OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_SILK_TOP,SC(28,"Silkscreen top"));
    }
    if (GetNrObjectSelections(SILKSCREEN_BOTTOM,100)>0) {
      OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_SILK_BOT,SC(32,"Silkscreen bottom"));
    }
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerTextObjects(Layer,str,4);
      if (GetNrObjectSelections(Layer,100)>0) {
        res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_PCB_LAYER+Layer,str);
        ok=1;
      }
    }
    if (GetNrObjectSelections(SOLD_MASK_BOTTOM,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_SOLD_BOTTOM,SC(62,"Solder mask bottom"));
      ok=1;
    }
    if (GetNrObjectSelections(SOLD_MASK_TOP,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_SOLD_TOP,SC(66,"Solder mask top"));
      ok=1;
    }
    if (GetNrObjectSelections(PASTE_MASK_BOTTOM,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_PASTE_BOTTOM,SC(70,"Paste mask bottom"));
      ok=1;
    }
    if (GetNrObjectSelections(PASTE_MASK_TOP,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_PASTE_TOP,SC(74,"Paste mask top"));
      ok=1;
    }
    if (GetNrObjectSelections(DRILL_LAYER,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_DRILLS,SC(618,"Drills (plated)"));
      ok=1;
    }
    if (GetNrObjectSelections(DRILL_UNPLATED_LAYER,100)>0) {
      res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_DRILLS_UNPLATED,SC(619,"Drills (unplated)"));
      ok=1;
    }
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerTextObjects(Layer+ROUTING_KEEPOUT_LAYER,str,4);
      if (GetNrObjectSelections(Layer+ROUTING_KEEPOUT_LAYER,100)>0) {
        res=OwnAppendMenu(PopUpMenu30,MF_ENABLED|MF_STRING,ID_SEL_ONLY_ROUT_KEEPOUT+Layer,str);
        ok=1;
      }
    }
// ********************************************************************************************************

    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu32,SC(620,"Unselect"));
    if (GetNrObjectSelections(0,0)>0) {
      OwnAppendMenu(PopUpMenu32,MF_ENABLED|MF_STRING,ID_UNSEL_LINES,SC(612,"Lines"));
    }
    if (GetNrObjectSelections(0,1)>0) {
      OwnAppendMenu(PopUpMenu32,MF_ENABLED|MF_STRING,ID_UNSEL_RECTANGLES,SC(613,"Rectangles"));
    }
/*
    if (GetNrObjectSelections(0,2)>0) {
      OwnAppendMenu(PopUpMenu32,MF_ENABLED|MF_STRING,ID_UNSEL_CIRCLES,"Circles");
    }
*/
    if (GetNrObjectSelections(0,3)>0) {
      OwnAppendMenu(PopUpMenu32,MF_ENABLED|MF_STRING,ID_UNSEL_ARCS,SC(614,"Arcs"));
    }
    if (GetNrObjectSelections(0,4)>0) {
      OwnAppendMenu(PopUpMenu32,MF_ENABLED|MF_STRING,ID_UNSEL_TEXTS2,SC(589,"Text"));
    }
    if (GetNrObjectSelections(0,5)>0) {
      OwnAppendMenu(PopUpMenu32,MF_ENABLED|MF_STRING,ID_UNSEL_POLYGONS,SC(615,"Polygons"));
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu33,SC(621,"Unselect objects on layer"));
    if (GetNrObjectSelections(BOARD_OUTLINE_LAYER,100)>0) {
      OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_BOARDOUTLINE,SC(59,"Board outline"));
    }
    if (GetNrObjectSelections(INFO_LAYER,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_INFO,SC(617,"Info"));
      ok=1;
    }
    if (GetNrObjectSelections(INFO_LAYER2,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_INFO2,SC(39,"Info2"));
      ok=1;
    }
    if (GetNrObjectSelections(INFO_LAYER3,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_INFO3,SC(42,"Info3"));
      ok=1;
    }
    if (GetNrObjectSelections(INFO_LAYER4,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_INFO4,SC(45,"Info4"));
      ok=1;
    }
    if (GetNrObjectSelections(SILKSCREEN_TOP,100)>0) {
      OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_SILK_TOP,SC(28,"Silkscreen top"));
    }
    if (GetNrObjectSelections(SILKSCREEN_BOTTOM,100)>0) {
      OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_SILK_BOT,SC(32,"Silkscreen bottom"));
    }
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerTextObjects(Layer,str,4);
      if (GetNrObjectSelections(Layer,100)>0) {
        res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_PCB_LAYER+Layer,str);
        ok=1;
      }
    }
    if (GetNrObjectSelections(SOLD_MASK_BOTTOM,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_SOLD_BOTTOM,SC(62,"Solder mask bottom"));
      ok=1;
    }
    if (GetNrObjectSelections(SOLD_MASK_TOP,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_SOLD_TOP,SC(66,"Solder mask top"));
      ok=1;
    }
    if (GetNrObjectSelections(PASTE_MASK_BOTTOM,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_PASTE_BOTTOM,SC(70,"Paste mask bottom"));
      ok=1;
    }
    if (GetNrObjectSelections(PASTE_MASK_TOP,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_PASTE_TOP,SC(74,"Paste mask top"));
      ok=1;
    }
    if (GetNrObjectSelections(DRILL_LAYER,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_DRILLS,SC(618,"Drills (plated)"));
      ok=1;
    }
    if (GetNrObjectSelections(DRILL_UNPLATED_LAYER,100)>0) {
      res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_DRILLS_UNPLATED,SC(619,"Drills (unplated)"));
      ok=1;
    }
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerTextObjects(Layer+ROUTING_KEEPOUT_LAYER,str,4);
      if (GetNrObjectSelections(Layer+ROUTING_KEEPOUT_LAYER,100)>0) {
        res=OwnAppendMenu(PopUpMenu33,MF_ENABLED|MF_STRING,ID_UNSEL_ROUT_KEEPOUT+Layer,str);
        ok=1;
      }
    }
// ********************************************************************************************************
    if (GetNrObjectSelections(0,5)>0) {
      OwnAppendMenu(PopUpMenu36,MF_ENABLED|MF_BITMAP,ID_CUT_POLYLINE_POLYGON,(LPSTR)BitMapPolyline);
      OwnAppendMenu(PopUpMenu36,MF_ENABLED|MF_BITMAP,ID_CUT_RECTANGLE_POLYGON,(LPSTR)BitMapRectangle);
      OwnAppendMenu(PopUpMenu36,MF_ENABLED|MF_BITMAP,ID_CUT_CIRCLE_POLYGON,(LPSTR)BitMapCircle2);
      OwnAppendMenu(PopUpMenu36,MF_ENABLED|MF_BITMAP,ID_CUT_HOR_TRACE_POLYGON,(LPSTR)BitMapHorTrace);
      OwnAppendMenu(PopUpMenu36,MF_ENABLED|MF_BITMAP,ID_CUT_VER_TRACE_POLYGON,(LPSTR)BitMapVerTrace);
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu36,SC(622,"Cut from polygon"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_VERTICES,SC(623,"View vertices polygon"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_CALC_AREA_POLYGON,SC(624,"Calculate area polygon"));
    }
#ifdef _DEBUG
    if (GetNrObjectSelections(0,5)>0) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_POLYGON_TO_SOURCE_CODE,"Polygon to source code");
    }
#endif
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_DELETE,SC(344,"Delete"));
  } else {
/*
#define SOLD_MASK_BOTTOM                        100
#define SOLD_MASK_TOP                           101
#define PASTE_MASK_BOTTOM                       200
#define PASTE_MASK_TOP                          201
#define INFO_LAYER                              1500
#define BOARD_OUTLINE_LAYER                     1600
#define SILKSCREEN_BOTTOM                       2000
#define SILKSCREEN_TOP                          2001
#define PLACEMENT_OUTLINE_LAYER                 3000
#define PLACEMENT_OUTLINE_LAYER2                3001
#define COMP_OUTLINE_LAYER                      4000
#define PCB_TOP                                 5000
#define PCB_BOTTOM                              5500
#define DRILL_LAYER                             6000

// Layer range
//
// 100  .. 65000  ( increments 100)
// 101  .. 65001  ( increments 100)

*/
// ********************************************************************************************************

    EnableMask=MF_ENABLED;
    NewLayer=SILKSCREEN_TOP;
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu11,SC(625,"Add on silkscreen"));
    if (OkToDrawSilkScreenTop) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    OwnAppendMenu(PopUpMenu11,EnableMask|MF_POPUP,(UINT) PopUpMenu100,SC(626,"Top"));
/*
#define ID_ADD_LINE_OBJECT_ARROW1       0x530000
#define ID_ADD_LINE_OBJECT_ARROW2       0x540000
#define ID_ADD_LINE_OBJECT_ARROW3       0x550000
#define ID_ADD_DIMENSION_OBJECT         0x560000
#define ID_ADD_DIMENSION_OBJECT2        0x570000
*/
    AddObjectsPopUpItems(PopUpMenu100,EnableMask,NewLayer,16);
// ********************************************************************************************************
    if (OkToDrawSilkScreenBottom) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    NewLayer=SILKSCREEN_BOTTOM;
    OwnAppendMenu(PopUpMenu11,EnableMask|MF_POPUP,(UINT) PopUpMenu110,SC(627,"Bottom"));
    AddObjectsPopUpItems(PopUpMenu110,EnableMask,NewLayer,16);
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu12,SC(628,"Add on info"));

    if (OkToDrawInfoObjects) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    NewLayer=INFO_LAYER;
//        AppendMenuOwn(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu120,"Add info layer");
    OwnAppendMenu(PopUpMenu12,EnableMask|MF_POPUP,(UINT) PopUpMenu120,SC(629,"Layer1"));
    AddObjectsPopUpItems(PopUpMenu120,EnableMask,NewLayer,16);
    if (OkToDrawInfo2Objects) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    NewLayer=INFO_LAYER2;
    OwnAppendMenu(PopUpMenu12,EnableMask|MF_POPUP,(UINT) PopUpMenu200,SC(630,"Layer2"));
    AddObjectsPopUpItems(PopUpMenu200,EnableMask,NewLayer,16);
    if (OkToDrawInfo3Objects) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    NewLayer=INFO_LAYER3;
    OwnAppendMenu(PopUpMenu12,EnableMask|MF_POPUP,(UINT) PopUpMenu210,SC(631,"Layer3"));
    AddObjectsPopUpItems(PopUpMenu210,EnableMask,NewLayer,16);
    if (OkToDrawInfo4Objects) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    NewLayer=INFO_LAYER4;
    OwnAppendMenu(PopUpMenu12,EnableMask|MF_POPUP,(UINT) PopUpMenu220,SC(632,"Layer4"));
    AddObjectsPopUpItems(PopUpMenu220,EnableMask,NewLayer,16);
// ********************************************************************************************************
    if (OkToDrawBoardOutline) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }

    NewLayer=BOARD_OUTLINE_LAYER;
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu130,SC(633,"Add board outline"));
    AddObjectsPopUpItems(PopUpMenu130,EnableMask,NewLayer,16+1);
//          OwnAppendMenu(PopUpMenu130,MF_ENABLED|MF_STRING,ID_ADD_TEXT_OBJECT+NewLayer,SC(589,"Text"));
// ********************************************************************************************************
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu13,SC(634,"Add on copper layers"));
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerTextObjects(Layer,str,0);
      if ((DrawLayerCode[Layer]>=0)
         &&
         (DrawLayerCode[Layer]<MAX_ACTIVE_DRAWING_LAYERS)) {
        EnableMask=MF_ENABLED;
      } else {
        EnableMask=MF_GRAYED|MF_ENABLED;
      }
      NewLayer=Layer;
      OwnAppendMenu(PopUpMenu13,EnableMask|MF_POPUP,(UINT) TraceLayerPopUpMenu[Layer],str);
      AddObjectsPopUpItems(TraceLayerPopUpMenu[Layer],EnableMask,NewLayer,16);
    }
// ********************************************************************************************************
    if ((OkToDrawRoutingKeepoutTop)
       ||
       (OkToDrawRoutingKeepoutInner)
       ||
       (OkToDrawRoutingKeepoutBottom)) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu14,SC(635,"Add on routing keepout"));
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerTextObjects(Layer,str,0);
//        GetLayerTextObjects(Layer+ROUTING_KEEPOUT_LAYER,str,4);
      if (CheckIfTopLayer(Layer)) {
        if ((DrawLayerCode[Layer]>=0)
           &&
           (DrawLayerCode[Layer]<MAX_ACTIVE_DRAWING_LAYERS)
           &&
           (OkToDrawRoutingKeepoutTop)) {
          EnableMask=MF_ENABLED;
        } else {
          EnableMask=MF_GRAYED|MF_ENABLED;
        }
      }
      if (CheckIfInnerLayer(Layer)) {
        if ((DrawLayerCode[Layer]>=0)
           &&
           (DrawLayerCode[Layer]<MAX_ACTIVE_DRAWING_LAYERS)
           &&
           (OkToDrawRoutingKeepoutInner)) {
          EnableMask=MF_ENABLED;
        } else {
          EnableMask=MF_GRAYED|MF_ENABLED;
        }
      }
      if (CheckIfBottomLayer(Layer)) {
        if ((DrawLayerCode[Layer]>=0)
           &&
           (DrawLayerCode[Layer]<MAX_ACTIVE_DRAWING_LAYERS)
           &&
           (OkToDrawRoutingKeepoutBottom)) {
          EnableMask=MF_ENABLED;
        } else {
          EnableMask=MF_GRAYED|MF_ENABLED;
        }
      }
      NewLayer=Layer+ROUTING_KEEPOUT_LAYER;
      OwnAppendMenu(PopUpMenu14,EnableMask|MF_POPUP,(UINT) RoutingKeepoutPopUpMenu[Layer],str);
      AddObjectsPopUpItems(RoutingKeepoutPopUpMenu[Layer],EnableMask,NewLayer,16+4);
    }
// ********************************************************************************************************
    EnableMask=MF_ENABLED;
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu15,SC(636,"Add on solder mask"));
    if (Design.NrBoardLayers>1) {
      if ((DrawLayerCode[Design.NrBoardLayers-1]>=0)
         &&
         (DrawLayerCode[Design.NrBoardLayers-1]<MAX_ACTIVE_DRAWING_LAYERS)
         &&
         (DrawSoldMaskTopMode>0)) {
        EnableMask=MF_ENABLED;
      } else {
        EnableMask=MF_GRAYED|MF_ENABLED;
      }
      NewLayer=SOLD_MASK_TOP;
      OwnAppendMenu(PopUpMenu15,EnableMask|MF_POPUP,(UINT) PopUpMenu170,SC(626,"Top"));
      AddObjectsPopUpItems(PopUpMenu170,EnableMask,NewLayer,16+2);
    }
    if ((DrawLayerCode[0]>=0)
       &&
       (DrawLayerCode[0]<MAX_ACTIVE_DRAWING_LAYERS)
       &&
       (DrawSoldMaskBottomMode>0)) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    NewLayer=SOLD_MASK_BOTTOM;
    OwnAppendMenu(PopUpMenu15,EnableMask|MF_POPUP,(UINT) PopUpMenu160,SC(627,"Bottom"));
    AddObjectsPopUpItems(PopUpMenu160,EnableMask,NewLayer,16+2);
// ********************************************************************************************************
    EnableMask=MF_ENABLED;
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu16,SC(637,"Add on paste mask"));
    if (Design.NrBoardLayers>1) {
      if ((DrawLayerCode[Design.NrBoardLayers-1]>=0)
         &&
         (DrawLayerCode[Design.NrBoardLayers-1]<MAX_ACTIVE_DRAWING_LAYERS)
         &&
         (DrawPasteMaskTopMode>0)) {
        EnableMask=MF_ENABLED;
      } else {
        EnableMask=MF_GRAYED|MF_ENABLED;
      }
      NewLayer=PASTE_MASK_TOP;
      OwnAppendMenu(PopUpMenu16,EnableMask|MF_POPUP,(UINT) PopUpMenu190,SC(626,"Top"));
      AddObjectsPopUpItems(PopUpMenu190,EnableMask,NewLayer,16+2);
    }
    if ((DrawLayerCode[0]>=0)
       &&
       (DrawLayerCode[0]<MAX_ACTIVE_DRAWING_LAYERS)
       &&
       (DrawPasteMaskBottomMode>0)) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    NewLayer=PASTE_MASK_BOTTOM;
    OwnAppendMenu(PopUpMenu16,EnableMask|MF_POPUP,(UINT) PopUpMenu180,SC(627,"Bottom"));
    AddObjectsPopUpItems(PopUpMenu180,EnableMask,NewLayer,16+2);
// ********************************************************************************************************
    if (DrawDrillMode>0) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_GRAYED|MF_ENABLED;
    }
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    NewLayer=DRILL_LAYER;
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_CIRCLE_OBJECT_F+NewLayer,SC(638,"Add drill holes (plated)"));
    NewLayer=DRILL_UNPLATED_LAYER;
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_CIRCLE_OBJECT_F+NewLayer,SC(639,"Add drill holes (unplated)"));
// ********************************************************************************************************
  }
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpAreafills()

{
  int32 cnt,NrAreaFillsSelected,ok,Found;
  int32    EnableMask,MenuChanged;
  AreaFillRecord *AreaFill;

  NrAreaFillsSelected=GetNrAreaFillsSelected();
  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)7);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,SC(683,"Areafills/powerplanes menu"));
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  if (OkToDrawAreaFills) {
    EnableMask=MF_ENABLED;
  } else {
    EnableMask=MF_GRAYED|MF_ENABLED;
  }
  if (NrAreaFillsSelected>0) {
    if (NrAreaFillsSelected==1) {
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_REBUILD_AREAFILL,SC(640,"Rebuild areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_REBUILD_AREAFILL2,SC(641,"Remove user deletions"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_MOVE_OBJECTS,SC(642,"Move areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COPY_OBJECTS,SC(643,"Copy areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_STRETCH_AREAFILL,SC(644,"Stretch areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_POLYLINE_TO_AREAFILL,SC(645,"Add to areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_MIRRORX_OBJECTS,SC(646,"Mirror X areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_MIRRORY_OBJECTS,SC(647,"Mirror Y areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ADD_VIA,SC(1305,"Add via"));

      OwnAppendMenu(PopUpMenu22,EnableMask|MF_BITMAP,ID_CUT_POLYLINE_AREAFILL,(LPSTR)BitMapPolyline);
      OwnAppendMenu(PopUpMenu22,EnableMask|MF_BITMAP,ID_CUT_RECTANGLE_AREAFILL,(LPSTR)BitMapRectangle);
      OwnAppendMenu(PopUpMenu22,EnableMask|MF_BITMAP,ID_CUT_CIRCLE_AREAFILL,(LPSTR)BitMapCircle2);
      OwnAppendMenu(PopUpMenu22,EnableMask|MF_BITMAP,ID_CUT_HOR_TRACE_AREAFILL,(LPSTR)BitMapHorTrace);
      OwnAppendMenu(PopUpMenu22,EnableMask|MF_BITMAP,ID_CUT_VER_TRACE_AREAFILL,(LPSTR)BitMapVerTrace);
      OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu22,SC(648,"Cut from areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_CUT_AREAFILL_START_POLYGON,SC(1306,"Cut from areafill start polygon"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_CHANGE_AREAFILL,SC(649,"Change areafill"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_SELECT_NET_AREAFILLS,SC(1303,"Select areafills from the same net"));
    }
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_VIEW_VERTICES,SC(650,"View vertices areafill polygon"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_AREAFILL_COPY_TO_INFO4,SC(1275,"Copy start polygon to info4 layer"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_CHANGE_CLEARANCE_AREAFILL,SC(651,"Change clearance"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_CHANGE_NET_AREAFILL,SC(1291,"Change net"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    if (NrAreaFillsSelected>1) {
      OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_AREAFILL_MERGE,SC(652,"Merge"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    }
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_EDIT_DELETE,SC(344,"Delete"));
#ifdef _DEBUG
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_AREAFILL_TO_TEXT,"Get areafill text info");
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_POLYGON_TO_SOURCE_CODE,"Areafill to source code");
#endif
    MenuChanged=1;
  } else {
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu11,SC(653,"Add areafill"));
    for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
      OwnAppendMenu(PopUpMenu11,MF_OWNERDRAW,
                 ID_SELECT_LAYER+ID_ADD_AREAFILL+
                 Design.NrBoardLayers-1-cnt,
                 (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
    }
    OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu12,SC(654,"Add areafill with no net"));
    for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
      OwnAppendMenu(PopUpMenu12,MF_OWNERDRAW,
                 ID_SELECT_LAYER+ID_ADD_AREAFILL2+
                 Design.NrBoardLayers-1-cnt,
                 (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
    }
    ok=1;
    if ((GetNrPowerPlanes()>0)
       &&
       (Design.NrBoardLayers>1)) {
//          OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu12,"Rebuild areafill powerplane");
//        OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu13,"Change clearance powerplane");
      OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
      OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu14,SC(655,"Cut from powerplane"));
      OwnAppendMenu(PopUpMenu14,EnableMask|MF_BITMAP|MF_POPUP,(UINT) PopUpMenu21,(LPSTR)BitMapPolyline);
      OwnAppendMenu(PopUpMenu14,EnableMask|MF_BITMAP|MF_POPUP,(UINT) PopUpMenu23,(LPSTR)BitMapRectangle);
      OwnAppendMenu(PopUpMenu14,EnableMask|MF_BITMAP|MF_POPUP,(UINT) PopUpMenu22,(LPSTR)BitMapCircle2);
      OwnAppendMenu(PopUpMenu14,EnableMask|MF_BITMAP|MF_POPUP,(UINT) PopUpMenu24,(LPSTR)BitMapHorTrace);
      OwnAppendMenu(PopUpMenu14,EnableMask|MF_BITMAP|MF_POPUP,(UINT) PopUpMenu25,(LPSTR)BitMapVerTrace);
      OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu15,SC(656,"Change powerplane"));
      OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu16,SC(657,"Remove powerplane"));
      for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
        Found=GetPowerPlaneByLayer(Design.NrBoardLayers-1-cnt);
        if (Found!=-1) {
          AreaFill=(AreaFillRecord *)&(AreaFillMem[(*AreaFills)[Found]]);
          OwnAppendMenu(PopUpMenu21,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_CUT_POLYLINE_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
          OwnAppendMenu(PopUpMenu22,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_CUT_CIRCLE_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
          OwnAppendMenu(PopUpMenu23,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_CUT_RECTANGLE_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
          OwnAppendMenu(PopUpMenu24,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_CUT_HOR_TRACE_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
          OwnAppendMenu(PopUpMenu25,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_CUT_VER_TRACE_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
          OwnAppendMenu(PopUpMenu15,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_SWITCH_TO_LAYER+ID_CHANGE_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
          OwnAppendMenu(PopUpMenu16,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_SWITCH_TO_LAYER+ID_REMOVE_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
        }
      }
      MenuChanged=1;
    }
    if (Design.NrBoardLayers>1) {
      OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
      OwnAppendMenu(PopUpMenu,EnableMask|MF_POPUP,(UINT) PopUpMenu17,SC(658,"Add powerplane"));
      for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
        Found=GetPowerPlaneByLayer(Design.NrBoardLayers-1-cnt);
        if ((Found==-1)
           &&
           (cnt>0)
           &&
           (cnt<Design.NrBoardLayers-1)) {
          OwnAppendMenu(PopUpMenu17,MF_OWNERDRAW,
                     ID_SELECT_LAYER+ID_SWITCH_TO_LAYER+ID_ADD_POWERPLANE+
                     Design.NrBoardLayers-1-cnt,
                     (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x0f));
        }
      }
    }
    if ((OkToDrawErrors)
       &&
       (NrErrorObjects>0)) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_NEXT_ERROR,SC(540,"Cycle through design rule errors/warnings"));
    }
  }
}


// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpEditTracesVias()

{
  int32 cnt,NrTracesSelected,NrViasSelected,NrConnectionsSelected,MenuChanged;

  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)8);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,SC(684,"Change traces/vias menu"));
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_CENTER_ON_CONNECTION,SC(547,"Center view on next connection"));
  NrTracesSelected=GetNrTracesSelected();
  NrViasSelected=GetNrViasSelected();
  NrConnectionsSelected=GetNrConnectionsSelected();
  if ((NrTracesSelected>0)
     ||
     (NrConnectionsSelected>0)
     ||
     (NrViasSelected>0)) {
    MenuChanged=1;
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_DRAG_OBJECTS,SC(659,"Move traces/vias"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_COPY_OBJECTS,SC(660,"Copy traces/vias"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_COPY_TO_CLIPBOARD,SC(661,"Copy traces/vias to clipboard"));

    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu1,SC(611,"Select only"));
    if (NrTracesSelected>0) {
      OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_SELECT_ONLY_TRACES,SC(662,"Traces"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_CHANGE_TRACE_WIDTH,SC(193,"Change trace width"));
    }
    if ((NrTracesSelected==1)
       ||
       (NrViasSelected==1)) {
//    if (GetNrObjectSelections(0,0)>0) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_HIGHLIGHT_NET,SC(1284,"Switch highlight net on/off"));
    }
    if ((NrTracesSelected>0)
       ||
       (NrViasSelected>0)) {
      if (NrConnectionsSelected==0) {
        OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SELECT_NET_VIA_TRACES,SC(1302,"Select vias/traces from the same net"));
      }
    }
    if (NrViasSelected>0) {
      OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_SELECT_ONLY_VIAS,SC(91,"Vias"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_CHANGE_VIA,SC(663,"Change via"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_CHANGE_NET_VIAS,SC(1291,"Change net"));
    }
    if (NrConnectionsSelected>0) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_HIDE_CONNECTIONS,SC(664,"Hide connection(s)"));
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_CHANGE_CLEARANCE_WIDTH,SC(651,"Change clearance"));
    if (NrTracesSelected==2) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWAP_TRACES,SC(665,"Swap nets"));
    }
    if (NrTracesSelected==1) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_DELETE_TRACESVIASNET,SC(666,"Delete traces/vias net selected trace"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_GET_TRACELENGTH,SC(667,"Calculate length trace"));
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_DESIGN_RULES_NET,SC(1180,"Change design rules net"));
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_INFOSELECTEDOBJECTS,SC(610,"Info on selected objects"));
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_DELETE,SC(344,"Delete"));
  } else {
    if (Design.NrBoardLayers==2) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_NEAREST_LAYER,SC(542,"Switch to other layer"));
    } else {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_NEAREST_LAYER,SC(543,"Switch to nearest layer"));
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu11,SC(544,"Select layer"));
    for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
      OwnAppendMenu(PopUpMenu11,MF_OWNERDRAW,
                 ID_SELECT_LAYER+ID_SWITCH_TO_LAYER+Design.NrBoardLayers-1-cnt,
                 (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt]));
    }
    if ((OkToDrawErrors)
       &&
       (NrErrorObjects>0)) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_NEXT_ERROR,SC(668,"Cycle through design rule errors"));
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_INSERT_FROM_CLIPBOARD,SC(669,"Load traces/vias from clipboard"));
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpComponentReferences()

{
  int32 EnableMask;

  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)4);
  if (GetNrReferencesSelected()>0) {
    if (OkToDrawCompReference) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_DISABLED;
    }
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_MOVE_OBJECTS,SC(345,"Move"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE_OBJECTS,SC(670,"Rotate 90 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE_OBJECTS2,SC(550,"Rotate at any angle"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE0,SC(671,"Set angle to 0 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE90,SC(672,"Set angle to 90 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE180,SC(673,"Set angle to 180 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE270,SC(674,"Set angle to 270 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE_OBJECTS3,SC(675,"Set any angle"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPREF_HIDE,SC(558,"Hide"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPREF_VISIBLE,SC(559,"Visible"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPREF_ONTOP,SC(560,"On top layer"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPREF_ONBOTTOM,SC(561,"On bottom layer"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPREF_HEIGHT,SC(226,"Height"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPREF_LINEWIDTH,SC(562,"Line width"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_INFOSELECTEDOBJECTS,SC(555,"Component info"));
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUpComponentValues()

{
  int32 EnableMask;

  OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)4);
  if (GetNrCompValuesSelected()>0) {
    if (OkToDrawCompValue) {
      EnableMask=MF_ENABLED;
    } else {
      EnableMask=MF_DISABLED;
    }
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_MOVE_OBJECTS,SC(345,"Move"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE_OBJECTS,SC(670,"Rotate 90 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE_OBJECTS2,SC(550,"Rotate at any angle"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE0,SC(671,"Set angle to 0 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE90,SC(672,"Set angle to 90 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE180,SC(673,"Set angle to 180 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE270,SC(674,"Set angle to 270 degrees"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_ROTATE_OBJECTS3,SC(675,"Set any angle"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_EDIT_TEXT,SC(563,"Edit"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPVALUE_HIDE,SC(558,"Hide"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPVALUE_VISIBLE,SC(559,"Visible"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPVALUE_ONTOP,SC(560,"On top layer"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPVALUE_ONBOTTOM,SC(561,"On bottom layer"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPVALUE_HEIGHT,SC(226,"Height"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_STRING,ID_COMPVALUE_LINEWIDTH,SC(562,"Line width"));
    OwnAppendMenu(PopUpMenu,EnableMask|MF_SEPARATOR,0,0);
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_INFOSELECTEDOBJECTS,SC(555,"Component info"));
  }
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void MenuPopUp()

{
  int32   MenuChanged;

//         PopUpMenu31,
//         PopUpMenu32,
//         PopUpMenu33,
//         PopUpMenu34,
//         PopUpMenu4,
//         PopUpMenu5;

  CreatePopupMenus();

  MenuChanged=0;
  switch (SelectionMode) {
// ********************************************************************************************************
// ********************************************************************************************************
    case DRAG_TRACES_VIAS_COMPS_MODE:    //Drag traces/vias/components
      MenuPopUpMoveComponentsTracesVias();
      break;
// ********************************************************************************************************
// ********************************************************************************************************
    case ROUTING_MODE:                   // Routing
      MenuPopUpRouting();
      break;
// ********************************************************************************************************
// ********************************************************************************************************
    case MOVE_ONE_TRACE_MODE:            // Move one trace
      MenuPopUpDragOneTrace();
      break;
// ********************************************************************************************************
// ********************************************************************************************************
    case MOVE_COMPONENTS_MODE:           // Move and rotate components
      MenuPopUpComponents();
      break;
// ********************************************************************************************************
    case MOVE_COMPONENT_REFERENCES_MODE: // Component references
      MenuPopUpComponentReferences();
      break;
// ********************************************************************************************************
    case MOVE_COMPONENT_VALUES_MODE:     // Component values
      MenuPopUpComponentValues();
      break;
// ********************************************************************************************************
    case OBJECTS_MODE:                   // Objects menu
      MenuPopUpObjects();
      break;
// ********************************************************************************************************
    case AREAFILLS_MODE:                 // Areafill/powerplanes
      MenuPopUpAreafills();
      break;
// ********************************************************************************************************
    case MOVING_TRACES_VIAS_MODE:        // Moving traces and vias
      MenuPopUpEditTracesVias();
      break;
// ********************************************************************************************************
    case GATE_PINSWAP_MODE:              // Gate/pin swap
      OwnAppendMenu(PopUpMenu,MF_OWNERDRAW|MF_DISABLED,IDD_MENU_ITEM1,(LPSTR)9);
//      OwnAppendMenu(PopUpMenu,MF_DISABLED|MF_STRING,0,SC(686,"Gate/pin swap menu"));
//      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_CENTER_ON_COMPONENT,SC(676,"Find component"));
      break;
// ********************************************************************************************************
// ********************************************************************************************************

  }
// ********************************************************************************************************
// ********************************************************************************************************
//  if (MenuChanged) OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
//  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,0,SC(687,"Other menus"));
  if (SelectionMode!=ROUTING_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_ROUTE_TRACES,SC(677,"Routing menu"));
  }
  if (SelectionMode!=MOVE_ONE_TRACE_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_DRAG_TRACE,SC(678,"Trace drag menu"));
  }
  if (SelectionMode!=MOVE_COMPONENTS_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_MOVE_COMPS2,SC(679,"Component menu"));
  }
  if (SelectionMode!=MOVE_COMPONENT_REFERENCES_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_MOVE_REFS,SC(680,"Component references menu"));
  }
  if (SelectionMode!=MOVE_COMPONENT_VALUES_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_MOVE_COMPVALUES,SC(681,"Component values menu"));
  }
  if (SelectionMode!=OBJECTS_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_OBJECTS,SC(682,"Specials menu"));
  }
  if (SelectionMode!=AREAFILLS_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_AREAFILLS,SC(683,"Areafills/powerplanes menu"));
  }
  if (SelectionMode!=MOVING_TRACES_VIAS_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_DRAG_TRACES_VIAS,SC(684,"Change traces/vias menu"));
  }
  if (SelectionMode!=DRAG_TRACES_VIAS_COMPS_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_DRAG_COMP_TRACE_VIAS,SC(685,"Drag traces/vias/components menu"));
  }
  if (SelectionMode!=GATE_PINSWAP_MODE) {
    OwnAppendMenu(PopUpMenu1000,MF_ENABLED|MF_STRING,ID_ACTION_GATEPINSWAP,SC(686,"Gate/pin swap menu"));
  }
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu1000,SC(687,"Other menus"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_GOTOXY,SC(1204,"Goto x,y"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_MEASUREMENT,SC(1276,"Measurement"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_UNSELECT_ALL,SC(346,"Unselect all"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_PREVIOUS_VIEW,SC(688,"Previous view"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_VIEWFULL,SC(689,"View whole design"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_VIEW_REPAINT,SC(690,"Repaint"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_UNDO,SC(341,"Undo"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_REDO,SC(342,"Redo"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EXIT_POPUP,SC(691,"Exit popup menu"));

  TrackPopupMenu(PopUpMenu,TPM_LEFTALIGN+TPM_RIGHTBUTTON,
                 RealWindow.left+MousePosX+5,RealWindow.top+MousePosY+40,0,PCBWindow,NULL);

  DestroyPopupMenus();
#ifdef KEY
  SPECIALCRCCHECK(0);
#endif
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

void TraceMenuPopUp(int32 mode)

{
  int32  cnt;
  char   str[MAX_LENGTH_STRING];

  HMENU  PopUpMenu,
         PopUpMenu1,
         PopUpMenu2,
         PopUpMenu3,
         PopUpMenu4,
         PopUpMenu5,
         PopUpMenu6,
         PopUpMenu7;

  NetRecord *Net;

  PopUpMenu=CreatePopupMenu();
  PopUpMenu1=CreatePopupMenu();
  PopUpMenu2=CreatePopupMenu();
  PopUpMenu3=CreatePopupMenu();
  PopUpMenu4=CreatePopupMenu();
  PopUpMenu5=CreatePopupMenu();
  PopUpMenu6=CreatePopupMenu();
  PopUpMenu7=CreatePopupMenu();
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu1,SC(193,"Change trace width"));
  for (cnt=0;cnt<NrTraceWidths;cnt++) {
    sprintf(str,SC(692,"%.1f mils\t= %.4f mm"),TraceWidths[cnt]/2540.0,
                                               TraceWidths[cnt]/100000.0);
    OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_TRACE_WIDTH+cnt,str);
    if (InRange(TraceWidths[cnt],CurrentTraceWidth)) {
      CheckMenuItem(PopUpMenu1,ID_TRACE_WIDTH+cnt,MF_BYCOMMAND|MF_CHECKED);
    }
  }
  OwnAppendMenu(PopUpMenu1,MF_ENABLED|MF_STRING,ID_TRACE_WIDTH_DIALOG,SC(693,"Special trace width"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu2,SC(651,"Change clearance"));
  for (cnt=0;cnt<NrClearanceWidths;cnt++) {
    sprintf(str,SC(692,"%.1f mils\t= %.4f mm"),ClearanceWidths[cnt]/2540.0,
                                               ClearanceWidths[cnt]/100000.0);
    OwnAppendMenu(PopUpMenu2,MF_ENABLED|MF_STRING,ID_CLEARANCE_WIDTH+cnt,str);
    if (InRange(ClearanceWidths[cnt],CurrentClearance)) {
      CheckMenuItem(PopUpMenu2,ID_CLEARANCE_WIDTH+cnt,MF_BYCOMMAND|MF_CHECKED);
    }
  }
  OwnAppendMenu(PopUpMenu2,MF_ENABLED|MF_STRING,ID_CLEARANCE_WIDTH_DIALOG,SC(694,"Special clearance width"));

  if (TraceDrawingMode!=0) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_TRACE_MODE_NORMAL,SC(695,"Normal trace drawing"));
  }
  if (TraceDrawingMode!=1) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_TRACE_MODE_ALL_ANGLE,SC(696,"Trace drawing all angle"));
  }
  if (TraceDrawingMode!=2) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_TRACE_MODE_ARC90,SC(697,"Arc trace drawing (90 degrees)"));
  }
  if (TraceDrawingMode!=3) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_TRACE_MODE_ARC45,SC(698,"Arc trace drawing (45 degrees)"));
  }
  if (OkToSwitchDrawingLayers) {
    if (Design.NrBoardLayers==2) {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_NEAREST_LAYER,SC(542,"Switch to other layer"));
    } else {
      OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_NEAREST_LAYER,SC(543,"Switch to nearest layer"));
    }
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu7,SC(544,"Select layer"));
    for (cnt=0;cnt<Design.NrBoardLayers;cnt++) {
      if ((ViewSingleLayer)
         ||
         ((DrawLayerCode[Design.NrBoardLayers-1-cnt] & 0x10) == 0)) {
        if ((!IsLayerPowerPlane(Design.NrBoardLayers-1-cnt))
           &&
           (CurrentDrawingLayer!=Design.NrBoardLayers-1-cnt)) {
          OwnAppendMenu(PopUpMenu7,MF_OWNERDRAW,
                        ID_SELECT_LAYER+ID_SWITCH_TO_LAYER+Design.NrBoardLayers-1-cnt,
                        (LPSTR)(DrawLayerCode[Design.NrBoardLayers-1-cnt]));
        }
      }
    }
  }
  if (Design.NrBoardLayers>1) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_VIAINFO_ON_OFF,SC(699,"Via info on/off"));
  }
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_TWO_TRACES_ON_OFF,SC(700,"Draw two trying traces on/off"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_SWITCH_TRYING_CLEAR_ON_OFF,SC(701,"Draw clearance trying traces on/off"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_TRACE_FINISH,SC(702,"Finish trace"));

  Net=&((*Nets)[CurrentDrawingNetNr]);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_HILITE_SINGLE_NET_ON_OFF,SC(703,"Highlight net on/off"));
  if (CurrentWorkingTrace.Info2==3) {
    OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_DELETE,SC(704,"Delete trace"));
  }
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_EDIT_DESIGN_RULES_NET,SC(1180,"Change design rules net"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_TRACE_BACKWARDS,SC(705,"Trace backwards"));
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_POPUP,(UINT) PopUpMenu6,SC(706,"Cross hair type"));
  if (CrossHairType==1) {
    OwnAppendMenu(PopUpMenu6,MF_ENABLED|MF_BITMAP,ID_VIEW_CROSS_TYPE1,(LPSTR)BitMapCross1);
  } else {
    OwnAppendMenu(PopUpMenu6,MF_ENABLED|MF_BITMAP,ID_VIEW_CROSS_TYPE2,(LPSTR)BitMapCross2);
  }
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PopUpMenu,MF_ENABLED|MF_STRING,ID_ESCAPE,SC(691,"Exit popup menu"));
  TrackPopupMenu(PopUpMenu,TPM_LEFTALIGN+TPM_RIGHTBUTTON,
                 RealWindow.left+MousePosX+5,RealWindow.top+MousePosY+40,0,PCBWindow,NULL);
  DestroyMenu(PopUpMenu);
  DestroyMenu(PopUpMenu1);
  DestroyMenu(PopUpMenu2);
  DestroyMenu(PopUpMenu3);
  DestroyMenu(PopUpMenu4);
  DestroyMenu(PopUpMenu5);
  DestroyMenu(PopUpMenu6);
  DestroyMenu(PopUpMenu7);
}

// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************
// ********************************************************************************************************

int32 CheckIfSelectionActive(int32 mode)

{
  switch (SelectionMode) {
    case DRAG_TRACES_VIAS_COMPS_MODE:    //Drag traces/vias/components
      if ((GetNrTracesSelected()>0)
         ||
         (GetNrViasSelected()>0)
         ||
         (GetNrCompsSelected()>0)) {
        return 1;
      }
      break;
    case ROUTING_MODE:                   // Routing
      if (SystemBusyMode==1) {
        return 1;
      }
      break;
    case MOVE_ONE_TRACE_MODE:            // Move one trace
      return 0;
      break;
    case MOVE_COMPONENTS_MODE:           // Move and rotate components
      if ((GetNrCompsSelected()>0)) {
        return 1;
      }
      break;
    case MOVE_COMPONENT_REFERENCES_MODE: // Component references
      if (GetNrReferencesSelected()>0) {
        return 1;
      }
      break;
    case MOVE_COMPONENT_VALUES_MODE:     // Component values
      if (GetNrCompValuesSelected()>0) {
        return 1;
      }
      break;
    case OBJECTS_MODE:                   // Objects menu
      if (GetNrObjectSelections(0,-1)>0) {
        return 1;
      }
      break;
    case AREAFILLS_MODE:                 // Areafill/powerplanes
      if (GetNrAreaFillsSelected()>0) {
        return 1;
      }
      break;
    case MOVING_TRACES_VIAS_MODE:        // Moving traces and vias
      if ((GetNrTracesSelected()>0)
         ||
         (GetNrConnectionsSelected()>0)
         ||
         (GetNrViasSelected()>0)) {
        return 1;
      }
      break;
    case GATE_PINSWAP_MODE:              // Gate/pin swap
      break;
  }
  return 0;
}

// *****************************************************************************************
// *****************************************************************************************
// *****************************************************************************************
// *****************************************************************************************

void MakeCheckMenu()

{

  int32  Layer,res;
  char  TextStr[MAX_LENGTH_STRING];
  HMENU  MainMenu;

  MainMenu=GetMenu(PCBWindow);
  if (CheckMenu!=0) {
    DestroyMenu(CheckMenu);
  }
  if (CheckLayerMenu!=0) {
    DestroyMenu(CheckLayerMenu);
  }
  CheckMenu=CreatePopupMenu();
  CheckLayerMenu=CreatePopupMenu();
  res=OwnAppendMenu(CheckMenu,MF_ENABLED|MF_STRING,ID_CHECK_CONNECTIVITY,SC(707,"Connectivity"));
  res=OwnAppendMenu(CheckMenu,MF_ENABLED|MF_STRING,ID_CHECK_CONNECTIVITYNET,SC(708,"Connectivity net"));
  res=OwnAppendMenu(CheckMenu,MF_ENABLED|MF_POPUP,(UINT)CheckLayerMenu,SC(229,"Design rules"));
  res=OwnAppendMenu(CheckLayerMenu,MF_ENABLED|MF_STRING,ID_CHECK_LAYER_ALL,SC(709,"All layers"));
  OwnAppendMenu(CheckLayerMenu,MF_ENABLED|MF_SEPARATOR,0,0);
  if (Design.NrBoardLayers>0) {
    for (Layer=Design.NrBoardLayers-1;Layer>=0;Layer--) {
      GetLayerText(Layer,TextStr,0);
      res=OwnAppendMenu(CheckLayerMenu,MF_ENABLED|MF_STRING,ID_SELECT_LAYER+ID_CHECK_LAYERS+Layer,
                        TextStr);
    }
  }
  res=ModifyMenuOwn(MainMenu,(UINT)7,MF_BYPOSITION|MF_POPUP,(UINT)CheckMenu,(LPSTR)SC(710,"Check"));
  DrawMenuBar(PCBWindow);
}

// *****************************************************************************************
// *****************************************************************************************
// *****************************************************************************************
// *****************************************************************************************

void MakeMainMenu()

{

#define MENU_ID       MF_ENABLED|MF_STRING

  if (!BitMapLeft) {
    BitMapLeft               = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_LEFT));
    BitMapRight              = LoadBitmap(PCBClass.hInstance, MAKEINTRESOURCE(BITMAP_RIGHT));
  }
  PCBMenu=CreateMenu();

// *****************************************************************************************
  PCBMenu1=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu1,SC(711,"File"));
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_NEW                       ,SC(241,"New layout"));
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_OPEN                      ,SC(327,"Open"));
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_SAVE                      ,SC(328,"Save"));
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_SAVEAS                    ,SC(712,"Save as"));
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_SAVEAS_GEOM             ,SC(1131,"Save layout as a geometry"));
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_PRINT                     ,SC(714,"Print screen"));
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_IMPORTNETLIST             ,SC(715,"Import components/netlist"));
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_UPDATENETLISTCOMPONENTS   ,SC(716,"Update components/netlist"));
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_RELOADGEOMETRIES          ,SC(717,"Reload geometries"));
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_OUTPUTGERBERDRILL         ,SC(718,"Output gerber/drill"));
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_OUTPUTPENPLOT             ,SC(719,"Output penplot"));
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_OUTPUT_ODB                ,SC(1342,"Output ODB++"));
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_PRINTPLOTFILES            ,SC(720,"Print plotfiles"));
  PCBMenu1a=CreateMenu();
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu1a,SC(721,"Import"));
  OwnAppendMenu(PCBMenu1a,MENU_ID,ID_FILE_INPUT_GERBER              ,SC(495,"Import gerber file"));
  OwnAppendMenu(PCBMenu1a,MENU_ID,ID_FILE_IMPORT_COMPS              ,SC(722,"Import component positions from file"));
  OwnAppendMenu(PCBMenu1a,MENU_ID,ID_FILE_IMPORT_COMPS2             ,SC(1196,"Import component positions from clipboard"));
  OwnAppendMenu(PCBMenu1a,MENU_ID,ID_FILE_IMPORT_BITMAP             ,SC(723,"Import bitmap"));
  OwnAppendMenu(PCBMenu1a ,MF_ENABLED|MF_SEPARATOR,0,0);
  PCBMenu1d=CreateMenu();
  OwnAppendMenu(PCBMenu1a ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu1d,SC(724,"From DXF file to"));
  OwnAppendMenu(PCBMenu1d ,MENU_ID,ID_FILE_IMPORT_DXF1              ,SC(37,"Info layer 1"));
  OwnAppendMenu(PCBMenu1d ,MENU_ID,ID_FILE_IMPORT_DXF2              ,SC(40,"Info layer 2"));
  OwnAppendMenu(PCBMenu1d ,MENU_ID,ID_FILE_IMPORT_DXF3              ,SC(43,"Info layer 3"));
  OwnAppendMenu(PCBMenu1d ,MENU_ID,ID_FILE_IMPORT_DXF4              ,SC(46,"Info layer 4"));
  PCBMenu1b=CreateMenu();
  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu1b,SC(725,"Export"));
  OwnAppendMenu(PCBMenu1b ,MENU_ID,ID_FILE_EXPORT_BITMAP             ,SC(726,"Plotfiles as bitmap"));
  OwnAppendMenu(PCBMenu1b ,MENU_ID,ID_FILE_EXPORT_PDF                ,SC(727,"Plotfiles as pdf"));
  OwnAppendMenu(PCBMenu1b ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1b ,MENU_ID,ID_FILE_EXPORT_DXF                ,SC(728,"To DXF file"));
  OwnAppendMenu(PCBMenu1b ,MENU_ID,ID_FILE_OUTPUTNETLIST             ,SC(729,"Netlist"));
  OwnAppendMenu(PCBMenu1b ,MENU_ID,ID_FILE_OUTPUT_COMPPOS            ,SC(1283,"Component positions (Pick and Place)"));
  OwnAppendMenu(PCBMenu1b ,MF_ENABLED|MF_SEPARATOR,0,0);

// *****************************************************************************************
  PCBMenu1c=CreateMenu();

  OwnAppendMenu(PCBMenu1 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu1 ,MENU_ID,ID_FILE_EXIT                      ,SC(734,"Exit"));

// *****************************************************************************************
  PCBMenu2=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu2,SC(563,"Edit"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_UNDO                      ,SC(341,"Undo"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_REDO                      ,SC(342,"Redo"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_VIADEFINITION             ,SC(232,"Via definition"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_CHANGE_DESIGN_RULES       ,SC(735,"Change design rules"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_PROTECT_COMP              ,SC(736,"Component protection"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_MOVE_PCB                  ,SC(737,"Move entire PCB"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_ROTATE_PCB_90             ,SC(738,"Rotate entire PCB 90 degrees CCW"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_ROTATE_PCB_180            ,SC(739,"Rotate entire PCB 180 degrees"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_ROTATE_PCB_270            ,SC(740,"Rotate entire PCB 90 degrees CW"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_ZERORELATIVECURSOR        ,SC(741,"Zero relative cursor"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_VARS                      ,SC(1270,"Edit user variables file"));
  OwnAppendMenu(PCBMenu2 ,MF_ENABLED|MF_SEPARATOR,0,0);
  PCBMenu2a=CreateMenu();
  OwnAppendMenu(PCBMenu2 ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu2a,SC(266,"Layers"));
  OwnAppendMenu(PCBMenu2a,MENU_ID,ID_LAYER_INSERT                   ,SC(742,"Insert layer"));
  OwnAppendMenu(PCBMenu2a,MENU_ID,ID_LAYER_REMOVE                   ,SC(743,"Remove layer"));
  OwnAppendMenu(PCBMenu2a,MENU_ID,ID_LAYER_SWITCH                   ,SC(744,"Swap two layers"));
#ifdef _DEBUG
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_TRACE_CHECK_OFF           ,"Trace check on/off");
#endif
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_VIEW_CENTER_ON_CONNECTION      ,SC(547,"Center view on next connection"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_EDIT_GOTOXY                    ,SC(1204,"Goto x,y"));
  OwnAppendMenu(PCBMenu2 ,MENU_ID,ID_VIEW_OPTIONS                   ,SC(1200,"Options"));

// *****************************************************************************************
  PCBMenu3=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu3,SC(1085,"Units"));
  OwnAppendMenu(PCBMenu3 ,MENU_ID,ID_SETTINGS_UNITS_MILS            ,SC(747,"Mils"));
  OwnAppendMenu(PCBMenu3 ,MENU_ID,ID_SETTINGS_UNITS_MM              ,SC(748,"Mm"));

// *****************************************************************************************
  PCBMenu4=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu4,SC(749,"Nets"));
  OwnAppendMenu(PCBMenu4 ,MENU_ID,ID_NETS_TRACECLEARANCENET         ,SC(750,"Design rules nets"));
  OwnAppendMenu(PCBMenu4 ,MENU_ID,ID_VIEW_DISABLECONNECTIONSNETS    ,SC(751,"Disable connections nets"));
  OwnAppendMenu(PCBMenu4 ,MENU_ID,ID_VIEW_HILITEDNETS               ,SC(752,"Highlight/unhighlight nets"));
  OwnAppendMenu(PCBMenu4 ,MENU_ID,ID_VIEW_UNSELECTTRACESVIASNET     ,SC(753,"Unselect traces/vias net"));
  OwnAppendMenu(PCBMenu4 ,MENU_ID,ID_DELETE_TRACESVIASNET_FUNC      ,SC(754,"Delete traces/vias nets"));
  OwnAppendMenu(PCBMenu4 ,MENU_ID,ID_VIEW_HIDECONNECTIONSNETS       ,SC(755,"Hide connections nets"));

// *****************************************************************************************
  PCBMenu5=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu5,SC(756,"Connections"));
  OwnAppendMenu(PCBMenu5 ,MENU_ID,ID_VIEW_VIEWALLCONNECTIONS        ,SC(757,"View all connections"));
  OwnAppendMenu(PCBMenu5 ,MENU_ID,ID_VIEW_HIDEALLCONNECTIONS        ,SC(758,"Hide all connections"));
  OwnAppendMenu(PCBMenu5 ,MENU_ID,ID_VIEW_HILITEVISIBLECONN         ,SC(759,"Highlight visible connections"));
  OwnAppendMenu(PCBMenu5 ,MENU_ID,ID_VIEW_UNHILITEVISIBLECONN       ,SC(1289,"Unhighlight visible connections"));

  OwnAppendMenu(PCBMenu5 ,MENU_ID,ID_ENABLE_ALLCONNECTIONS          ,SC(760,"Enable all connections"));

// *****************************************************************************************
  PCBMenu6=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu6,SC(763,"View"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_ZOOMIN                    ,SC(764,"Zoom in"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_ZOOMOUT                   ,SC(765,"Zoom out"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_PAN                       ,SC(766,"Pan window"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_VIEWFULL                  ,SC(767,"Viewfull"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_REPAINT                   ,SC(690,"Repaint"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_PREVIOUS_VIEW             ,SC(688,"Previous view"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_OPTIONS                   ,SC(768,"Change grid"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_UNHILITEALL               ,SC(769,"Unhighlight all"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_COMPREF_ON_OFF            ,SC(770,"Component reference on/off"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_COMPVALUE_ON_OFF          ,SC(771,"Component value on/off"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_CENTER_ON_COMPONENT       ,SC(772,"Center display on component"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_SWITCH_CLEARANCE_ON_OF         ,SC(773,"Clearances on/off"));


  OwnAppendMenu(PCBMenu6 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_LAYERS                    ,SC(266,"Layers"));

  PCBMenu6a=CreateMenu();
  OwnAppendMenu(PCBMenu6 ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu6a,SC(774,"Colors"));
  OwnAppendMenu(PCBMenu6a,MENU_ID,ID_VIEW_CHANGECOLORS              ,SC(775,"Change colors"));
  OwnAppendMenu(PCBMenu6a,MENU_ID,ID_VIEW_LOADDEFAULTCOLORS         ,SC(776,"Load default colors"));
  OwnAppendMenu(PCBMenu6 ,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_GRIDONOFF                 ,SC(777,"Grid on/off"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_DRILLS_ON_OFF             ,SC(778,"Drills on/off"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_INFOSELECTEDOBJECTS       ,SC(347,"Info selected objects"));
  OwnAppendMenu(PCBMenu6 ,MENU_ID,ID_VIEW_SELECTERROR               ,SC(779,"Select error/warning"));

  PCBMenu6b=CreateMenu();
  OwnAppendMenu(PCBMenu6 ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu6b,SC(780,"View with 300-2400 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH300DPI            ,SC(781,"View with 300 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH360DPI            ,SC(782,"View with 360 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH600DPI            ,SC(783,"View with 600 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH720DPI            ,SC(784,"View with 720 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH1000DPI           ,SC(785,"View with 1000 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH1200DPI           ,SC(786,"View with 1200 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH1440DPI           ,SC(787,"View with 1440 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH2000DPI           ,SC(788,"View with 2000 dpi"));
  OwnAppendMenu(PCBMenu6b,MENU_ID,ID_VIEW_VIEWWITH2400DPI           ,SC(789,"View with 2400 dpi"));

// *****************************************************************************************
  PCBMenu7=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu7,SC(791,"Action"));
  OwnAppendMenu(PCBMenu7 ,MENU_ID,ID_ACTION_ACTIVESCHEMATICSELECT   ,SC(792,"Active schematic select"));

// *****************************************************************************************
  PCBMenu8=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu8,SC(710,"Check"));

// *****************************************************************************************
  PCBMenu9=CreateMenu();
  OwnAppendMenu(PCBMenu  ,MF_ENABLED|MF_POPUP,(UINT) PCBMenu9,SC(156,"Help"));
  OwnAppendMenu(PCBMenu9,MENU_ID,ID_HELP_TOPICS                    ,SC(796,"Topics"));
  OwnAppendMenu(PCBMenu9,MENU_ID,ID_HELP_CONTENTS                  ,SC(797,"Getting started"));
  OwnAppendMenu(PCBMenu9,MENU_ID,ID_HELP_ON_COMMAND                ,SC(798,"Help on current mode (command)"));
  OwnAppendMenu(PCBMenu9,MF_ENABLED|MF_SEPARATOR,0,0);
  OwnAppendMenu(PCBMenu9,MENU_ID,ID_HELP_ABOUT                     ,SC(801,"About layout editor"));



// *****************************************************************************************
  SetMenu(PCBWindow,PCBMenu);
}

// *****************************************************************************************
// *****************************************************************************************
// *****************************************************************************************
// *****************************************************************************************

