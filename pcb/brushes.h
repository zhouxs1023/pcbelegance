/*
 * PCB elegance (Open source tools for making printed circuit boards)
 *
 * Copyright (C) 2012  Herman Morsink Vollenbroek
 *
 * File: brushes.h
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



#ifndef _BRUSHES

#define _BRUSHES


#include  "types.h"

uint8 SpecialBrushBitmapBytes[31][16 * 4] = {
	{
		0x66, 0x66, 0x00, 0x00,	// 1
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 2
		0xFF, 0xFF, 0x00, 0x00,
		0xFF, 0xFF, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0xFF, 0xFF, 0x00, 0x00,
		0xFF, 0xFF, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0xFF, 0xFF, 0x00, 0x00,
		0xFF, 0xFF, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0xFF, 0xFF, 0x00, 0x00,
		0xFF, 0xFF, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0xF0, 0xF0, 0x00, 0x00,	// 3
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 4
		0x10, 0x10, 0x00, 0x00,
		0x38, 0x38, 0x00, 0x00,
		0x7C, 0x7C, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x01, 0x01, 0x00, 0x00,
		0x83, 0x83, 0x00, 0x00,
		0xC7, 0xC7, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x10, 0x10, 0x00, 0x00,
		0x38, 0x38, 0x00, 0x00,
		0x7C, 0x7C, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x01, 0x01, 0x00, 0x00,
		0x83, 0x83, 0x00, 0x00,
		0xC7, 0xC7, 0x00, 0x00,
	}
	,
	{
		0x07, 0x07, 0x00, 0x00,	// 5
		0x03, 0x03, 0x00, 0x00,
		0x11, 0x11, 0x00, 0x00,
		0x30, 0x30, 0x00, 0x00,
		0x70, 0x70, 0x00, 0x00,
		0x30, 0x30, 0x00, 0x00,
		0x11, 0x11, 0x00, 0x00,
		0x03, 0x03, 0x00, 0x00,
		0x07, 0x07, 0x00, 0x00,
		0x03, 0x03, 0x00, 0x00,
		0x11, 0x11, 0x00, 0x00,
		0x30, 0x30, 0x00, 0x00,
		0x70, 0x70, 0x00, 0x00,
		0x30, 0x30, 0x00, 0x00,
		0x11, 0x11, 0x00, 0x00,
		0x03, 0x03, 0x00, 0x00,
	}
	,
	{
		0x1F, 0x86, 0x00, 0x00,	// 6
		0x3F, 0xC0, 0x00, 0x00,
		0x79, 0xE0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xE0, 0x79, 0x00, 0x00,
		0xC0, 0x3F, 0x00, 0x00,
		0x86, 0x1F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x1F, 0x86, 0x00, 0x00,
		0x3F, 0xC0, 0x00, 0x00,
		0x79, 0xE0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xE0, 0x79, 0x00, 0x00,
		0xC0, 0x3F, 0x00, 0x00,
		0x86, 0x1F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
	}
	,
	{
		0x78, 0x78, 0x00, 0x00,	// 7
		0x3C, 0x3C, 0x00, 0x00,
		0x1E, 0x1E, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x87, 0x87, 0x00, 0x00,
		0xC3, 0xC3, 0x00, 0x00,
		0xC3, 0xC3, 0x00, 0x00,
		0x87, 0x87, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x1E, 0x1E, 0x00, 0x00,
		0x3C, 0x3C, 0x00, 0x00,
		0x78, 0x78, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xE1, 0xE1, 0x00, 0x00,
		0xE1, 0xE1, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 8
		0x22, 0x22, 0x00, 0x00,
		0x77, 0x77, 0x00, 0x00,
		0x22, 0x22, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x88, 0x88, 0x00, 0x00,
		0xDD, 0xDD, 0x00, 0x00,
		0x88, 0x88, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x22, 0x22, 0x00, 0x00,
		0x77, 0x77, 0x00, 0x00,
		0x22, 0x22, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x88, 0x88, 0x00, 0x00,
		0xDD, 0xDD, 0x00, 0x00,
		0x88, 0x88, 0x00, 0x00,
	}
	,
	{
		0xCC, 0xCC, 0x00, 0x00,	// 9
		0x66, 0x66, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
	}
	,
	{
		0x33, 0x33, 0x00, 0x00,	// 10
		0x66, 0x66, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x66, 0x66, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x99, 0x99, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 11
		0x1C, 0x1C, 0x00, 0x00,
		0x3E, 0x3E, 0x00, 0x00,
		0x7F, 0x7F, 0x00, 0x00,
		0x7F, 0x7F, 0x00, 0x00,
		0x7F, 0x7F, 0x00, 0x00,
		0x3E, 0x3E, 0x00, 0x00,
		0x1C, 0x1C, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0xC1, 0xC1, 0x00, 0x00,
		0xE3, 0xE3, 0x00, 0x00,
		0xF7, 0xF7, 0x00, 0x00,
		0xF7, 0xF7, 0x00, 0x00,
		0xF7, 0xF7, 0x00, 0x00,
		0xE3, 0xE3, 0x00, 0x00,
		0xC1, 0xC1, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 12
		0x18, 0x18, 0x00, 0x00,
		0x3C, 0x3C, 0x00, 0x00,
		0x7E, 0x7E, 0x00, 0x00,
		0x7E, 0x7E, 0x00, 0x00,
		0x3C, 0x3C, 0x00, 0x00,
		0x18, 0x18, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x18, 0x18, 0x00, 0x00,
		0x3C, 0x3C, 0x00, 0x00,
		0x7E, 0x7E, 0x00, 0x00,
		0x7E, 0x7E, 0x00, 0x00,
		0x3C, 0x3C, 0x00, 0x00,
		0x18, 0x18, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0xF0, 0xF0, 0x00, 0x00,	// 13
		0xF0, 0xF0, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0xF0, 0xF0, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
		0x0F, 0x0F, 0x00, 0x00,
	}
	,
	{
		0x33, 0x33, 0x00, 0x00,	// 14
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
	}
	,
	{
		0xCC, 0xCC, 0x00, 0x00,	// 15
		0xCC, 0xCC, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0xCC, 0xCC, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
		0x33, 0x33, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 16
		0x01, 0x01, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x01, 0x01, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x01, 0x01, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x01, 0x01, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 17
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 18
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 19
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 20
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 21
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 22
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 23
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 24
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 25
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 26
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 27
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 28
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 29
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 30
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
	{
		0x00, 0x00, 0x00, 0x00,	// 31
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	,
};

#endif
