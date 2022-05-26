import 'package:flutter/material.dart';
import 'package:history_kg/screens/paragraphs_screen.dart';

import 'screens/home_screen.dart';
import 'screens/paragraphs_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'RobotoFlex'),
      home: const HomeScreen(),
      routes: <String, WidgetBuilder>{
        "/paragraphs": (BuildContext context) => const ParagraphsScreen()
      },
    );
  }
}
