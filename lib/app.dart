import 'package:flutter/material.dart';
import 'package:history_kg/screens/paragraphs_screen.dart';
import 'package:history_kg/screens/quiz_menu_screen.dart';

import 'screens/home_screen.dart';
import 'screens/paragraphs_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'RobotoFlex'),
      home: const HomeScreen(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => const HomeScreen(),
        "/paragraphs": (BuildContext context) => const ParagraphsScreen(),
        "/quizMenu": (BuildContext context) => const QuizMenuScreen()
      },
    );
  }
}
