/*
  Copyright (c) 1998 Slaven Rezic. All rights reserved.
  This program is free software; you can redistribute it and/or
  modify it under the same terms as Perl itself.
*/

#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#include "pTk/tkPort.h"
#include "pTk/tkInt.h"
#include "pTk/tkVMacro.h"
#include "pTk/tkImgPhoto.h"
#include "pTk/tkImgPhoto.m"
#include "tkGlue.h"
#include "tkGlue.m"

extern Tk_PhotoImageFormat      imgFmtTIFF;

DECLARE_VTABLES;
TkimgphotoVtab *TkimgphotoVptr;

MODULE = Tk::TIFF	PACKAGE = Tk::TIFF

PROTOTYPES: DISABLE

BOOT:
 {
  IMPORT_VTABLES;
  TkimgphotoVptr = (TkimgphotoVtab *) SvIV(FindTkVarName("TkimgphotoVtab",1));
  Tk_CreatePhotoImageFormat(&imgFmtTIFF);
 }
