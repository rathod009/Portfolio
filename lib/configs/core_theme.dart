import 'package:flutter/material.dart';

const fontFamily = 'Poppins';
const neonBlue = Color.fromARGB(255, 0, 174, 255); // Neon Blue Color

final themeLight = ThemeData(
  primaryColorLight: neonBlue,
  brightness: Brightness.light,
  primaryColor: neonBlue,
  highlightColor: Colors.black,
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan).copyWith(
    secondary: Colors.black,
    brightness: Brightness.light,
  ).copyWith(surface: Colors.white),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: neonBlue,
  primaryColor: neonBlue,
  highlightColor: neonBlue,
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white38,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan).copyWith(
    secondary: neonBlue,
    brightness: Brightness.dark,
  ).copyWith(surface: Colors.blueGrey),
);


// import 'package:flutter/material.dart';

// const fontFamily = 'Poppins';

// final themeLight = ThemeData(
//   primaryColorLight: const Color(0xffC0392B),
//   brightness: Brightness.light,
//   primaryColor: const Color(0xffC0392B),
//   highlightColor: Colors.black,
//   canvasColor: Colors.white,
//   fontFamily: fontFamily,
//   splashColor: Colors.transparent,
//   scaffoldBackgroundColor: Colors.white, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
//     secondary: Colors.black,
//     brightness: Brightness.light,
//   ).copyWith(surface: Colors.white),
// );

// final themeDark = ThemeData(
//   brightness: Brightness.dark,
//   primaryColorDark: const Color(0xffC0392B),
//   primaryColor: const Color(0xffC0392B),
//   highlightColor: const Color(0xffC0392B),
//   canvasColor: Colors.white,
//   fontFamily: fontFamily,
//   splashColor: Colors.transparent,
//   scaffoldBackgroundColor: Colors.black, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
//     secondary: const Color(0xffC0392B),
//     brightness: Brightness.dark,
//   ).copyWith(surface: Colors.grey[800]),
// );
