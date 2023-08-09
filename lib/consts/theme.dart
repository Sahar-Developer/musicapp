import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';

//light color scheme
ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.lwhiteColor,
    onPrimary: AppColor.lwhiteColor,
    secondary: AppColor.lslideColor,
    onSecondary: AppColor.lslideColor,
    error: Colors.red.shade600,
    onError: Colors.redAccent,
    background: AppColor.lbgColor,
    onBackground: AppColor.lbgDarkColor,
    surface: AppColor.lbuttonColor,
    onSurface: AppColor.lbuttonnColor);

//dark color scheme
ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColor.dwhiteColor,
    onPrimary: AppColor.dwhiteColor,
    secondary: AppColor.dslideColor,
    onSecondary: AppColor.dslideColor,
    error: Colors.red.shade600,
    onError: Colors.redAccent,
    background: AppColor.dbgColor,
    onBackground: AppColor.dbgDarkColor,
    surface: AppColor.lslideColor,
    onSurface: AppColor.dbuttonnColor);

final Color _lightFocusData =
    Color.fromARGB(255, 44, 181, 156).withOpacity(0.16);
final Color _darkFocusData =
    Color.fromARGB(255, 168, 173, 176).withOpacity(0.16);

final ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusData);
final ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusData);

ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
  return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.montserrat(
            fontSize: 22,
            color: colorScheme.brightness == Brightness.light
                ? colorScheme.primary
                : darkColorScheme.surface,
            fontWeight: FontWeight.w800),
        color: colorScheme.brightness == Brightness.light
            ? colorScheme.onBackground
            : darkColorScheme.onSurface,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: colorScheme.brightness,
          systemNavigationBarColor: colorScheme.brightness == Brightness.light
              ? lightColorScheme.secondary
              : darkColorScheme.background,
          systemNavigationBarIconBrightness:
              colorScheme.brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: colorScheme.brightness == Brightness.light
              ? colorScheme.primary
              : darkColorScheme.surface,
        ),
      ),
      canvasColor: colorScheme.brightness == Brightness.light
          ? AppColor.lbgColor
          : AppColor.dbgColor,
      scaffoldBackgroundColor: colorScheme.background,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.brightness == Brightness.light
              ? lightColorScheme.onBackground
              : darkColorScheme.onBackground,
          selectedItemColor: colorScheme.brightness == Brightness.light
              ? colorScheme.primary
              : darkColorScheme.surface,
          unselectedItemColor: colorScheme.brightness == Brightness.light
              ? lightColorScheme.background
              : darkColorScheme.background,
          selectedIconTheme: IconThemeData(
            color: colorScheme.brightness == Brightness.light
                ? colorScheme.primary
                : darkColorScheme.surface,
          )),
      highlightColor: Color.fromARGB(71, 40, 40, 40),
      focusColor: focusColor,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        titleSmall: GoogleFonts.montserrat(
          fontSize: 14,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        displayLarge: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 14,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        displaySmall: GoogleFonts.montserrat(
          fontSize: 12,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        bodySmall: GoogleFonts.montserrat(
          fontSize: 12,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 16,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
        headlineSmall: GoogleFonts.montserrat(
          fontSize: 12,
          color: colorScheme.brightness == Brightness.light
              ? Color.fromARGB(255, 31, 31, 31)
              : Color.fromARGB(255, 213, 208, 208),
        ),
      ),
      dividerColor: colorScheme.brightness == Brightness.light
          ? AppColor.lslideColor
          : AppColor.dslideColor);
}
