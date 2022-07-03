import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import 'color_const.dart';

class CustomTheme {
  static ThemeData getTheme() {
    return _themeData();
  }

  static TextStyle largeText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 25.0.sp,
          fontWeight: FontWeight.w700,
          color: ColorConst.blackColor,
          fontFamily: GoogleFonts.karla().fontFamily,
        );
  }

  static TextStyle semiLargeText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: ColorConst.blackColor,
          fontFamily: GoogleFonts.karla().fontFamily,
        );
  }

  static TextStyle mediumText(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w700,
          color: ColorConst.blackColor,
          fontFamily: GoogleFonts.karla().fontFamily,
        );
  }

  static TextStyle normalText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.blackColor,
          fontFamily: GoogleFonts.karla().fontFamily,
        );
  }

  static TextStyle smallText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w300,
          color: ColorConst.blackColor,
          fontFamily: GoogleFonts.karla().fontFamily,
        );
  }

  static TextStyle smallestText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 10.0.sp,
          fontWeight: FontWeight.w300,
          color: ColorConst.blackColor,
          fontFamily: GoogleFonts.karla().fontFamily,
        );
  }

  static ThemeData _themeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      primaryColor: ColorConst.primaryColor,
      fontFamily: GoogleFonts.karla().fontFamily,
      //accentColor: Colors.black,
      // textTheme: _textTheme(),
      //typography: Typography(),
      //platform: TargetPlatform.,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}
