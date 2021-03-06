/*
 * PCB elegance (Open source tools for making printed circuit boards)
 *
 * Copyright (C) 2012  Herman Morsink Vollenbroek
 *
 * File: import.h
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



#ifndef _IMPORT

#define _IMPORT

#include "types.h"

int32 FindCompNr(LPSTR CompName, int32 mode);

int32 ImportNetList(int32 mode);

int32 MakeNetlistFromDesign(int32 mode);

int32 CountNrPinsNet(int32 NetNr);

int32 UpdateNetList(int32 mode);

int32 GetNetNr(LPSTR NetName);

#endif
