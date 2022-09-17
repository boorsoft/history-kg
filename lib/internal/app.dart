import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/internal/dependencies/repository_modules/book_repository_module.dart';
import 'package:history_kg/presentation/screens/home_screen.dart';
import 'package:history_kg/presentation/screens/persons_screen.dart';
import 'package:history_kg/presentation/screens/quiz_menu_screen.dart';
import 'package:history_kg/presentation/state/book_bloc/book_bloc.dart';

import '../presentation/screens/paragraphs_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                BookBloc(BookRepositoryModule.bookRepository()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'RobotoFlex'),
        home: const HomeScreen(),
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => const HomeScreen(),
          "/paragraphs": (BuildContext context) => const ParagraphsScreen(),
          // "/quizMenu": (BuildContext context) => const QuizMenuScreen(),
          // "/persons": (BuildContext context) => const PersonsScreen(),
        },
      ),
    );
  }
}
