import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Cst.kPrimaryColor,
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1:
        GoogleFonts.roboto(fontSize: Cst.k4xl, fontWeight: FontWeight.bold),
    headline2:
        GoogleFonts.roboto(fontSize: Cst.k2xl, fontWeight: FontWeight.bold),
    headline3:
        GoogleFonts.roboto(fontSize: Cst.kxl, fontWeight: FontWeight.bold),
    headline4:
        GoogleFonts.roboto(fontSize: Cst.klg, fontWeight: FontWeight.w400),
    bodyText1:
        GoogleFonts.roboto(fontSize: Cst.kbase, fontWeight: FontWeight.normal),
    bodyText2:
        GoogleFonts.montserrat(fontSize: Cst.ksm, fontWeight: FontWeight.w400),
  ),
);
