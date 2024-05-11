import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 246, 246, 7),
      inversePrimary: const Color.fromARGB(255, 28, 28, 28)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 28, 28, 28),
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 28, 28, 28),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      )),
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w500,
        fontSize: 14,
      )),
  useMaterial3: true,
);
