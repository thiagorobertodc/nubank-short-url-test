import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color.fromARGB(255, 142, 0, 207);
  const primaryColorDark = Color.fromARGB(255, 127, 0, 153);
  const secondaryColorDark = Color.fromRGBO(0, 37, 26, 1);
  const primaryColorLight = Color.fromARGB(255, 200, 138, 230);
  const disabledColor = Color.fromRGBO(170, 170, 170, 1);
  const inputDecorationTheme = InputDecorationTheme(
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: primaryColorLight)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
  );
  final buttonTheme = ButtonThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
      splashColor: primaryColorLight,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      disabledColor: disabledColor,
      primaryColorLight: primaryColorLight,
      secondaryHeaderColor: secondaryColorDark,
      accentColor: primaryColor,
      backgroundColor: Colors.white,
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: primaryColorDark),
      ),
      inputDecorationTheme: inputDecorationTheme,
      buttonTheme: buttonTheme);
}
