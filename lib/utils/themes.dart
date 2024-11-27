import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static Color dark = const Color(0xff000000);
  static Color light = const Color(0xffFFFFFF);
  static Color card = const Color(0xff1B1B1B);
  static Color inactive = const Color(0xff979797);

  static Color primary = const Color(0xff496C39);
  static Color subPrimary = const Color(0xff0F2E00);
  static Color textPrimary = const Color(0xffFFED7A);
  static Color headButtonColor = const Color(0xff025061);
  static Color buttonColor = const Color(0xff0F2E00);

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.notoSansThai(fontSize: 20),
    displayMedium: GoogleFonts.notoSansThai(fontSize: 60.0),
    displaySmall: GoogleFonts.notoSansThai(fontSize: 48.0),
    //appbar
    headlineMedium: GoogleFonts.notoSansThai(fontSize: 20.0),
    //ชื่อ,หัวข้อ
    titleLarge: GoogleFonts.notoSansThai(fontSize: 18.0),
    titleMedium: GoogleFonts.notoSansThai(fontSize: 16.0),
    titleSmall: GoogleFonts.notoSansThai(fontSize: 14.0),
    //ข้อความ
    bodyLarge: GoogleFonts.notoSansThai(fontSize: 16.0),
    bodyMedium: GoogleFonts.notoSansThai(fontSize: 14.0),
    bodySmall: GoogleFonts.notoSansThai(fontSize: 10.0),
    //ปุ่ม
    labelLarge: GoogleFonts.notoSansThai(fontSize: 16.0),
    labelMedium: GoogleFonts.notoSansThai(fontSize: 14.0),
    labelSmall: GoogleFonts.notoSansThai(fontSize: 14.0),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    //fontFamily: "Noto Sans",
    primaryColor: light,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xff303030),
    appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.notoSansThai(color: Colors.white, fontWeight: FontWeight.w600),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff496C39),
        elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      border:
          OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      hintStyle: GoogleFonts.notoSansThai(fontSize: 12),
    ),
    cardColor: card,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: inactive),
    textTheme: _textTheme,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    // fontFamily: GoogleFonts.notoSansThai(),
    primaryColor: dark,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: dark,

    appBarTheme: AppBarTheme(
      backgroundColor: dark,
      titleTextStyle: GoogleFonts.notoSansThai(color: Colors.black, fontWeight: FontWeight.w600),
      elevation: 0,
      iconTheme: IconThemeData(color: light),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border:
          OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      hintStyle: GoogleFonts.notoSansThai(fontSize: 12),
    ),
    cardColor: card,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: inactive),
    textTheme: _textTheme,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.grey,
      onSurface: Colors.white,
    ),
  );
}
