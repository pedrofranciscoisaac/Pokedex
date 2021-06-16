import 'package:flutter/material.dart';
import 'package:pokedex_manha/core/app_theme.dart';
import 'package:pokedex_manha/pages/home_page.dart';

import 'core/app_const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: kAppTheme,
      home: HomePage(),
    );
  }
}
