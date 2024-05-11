import 'package:cripto_coins/router/router.dart';
import 'package:cripto_coins/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coins App',
      theme: darkTheme,
      routes: routes,
    );
  }
}