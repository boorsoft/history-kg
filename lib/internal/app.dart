import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/internal/dependencies/repository_modules/book_repository_module.dart';
import 'package:history_kg/presentation/screens/books_all_screen.dart';
import 'package:history_kg/presentation/screens/home_screen.dart';
import 'package:history_kg/presentation/state/book_bloc/book_bloc.dart';
import 'package:history_kg/presentation/state/persons_bloc/persons_bloc.dart';
import 'package:history_kg/presentation/state/quiz_bloc/quiz_bloc.dart';
import 'package:history_kg/presentation/utils/styles.dart';

import '../presentation/screens/persons_all_screen.dart';
import '../presentation/screens/quiz_all_screen.dart';
import 'dependencies/repository_modules/person_repository_module.dart';
import 'dependencies/repository_modules/quiz_repository_module.dart';

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
          create: (context) => BookBloc(BookRepositoryModule.bookRepository())
            ..add(GetBooksEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) =>
              PersonsBloc(PersonRepositoryModule.personApiUtil())
                ..add(GetPersonsEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) =>
              QuizBloc(QuizRepositoryModule.quizApiUtil())..add(GetQuizEvent()),
          lazy: false,
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: accentColor),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(fontFamily: 'Roboto', backgroundColor: backgroundColor),
          initialRoute: "/home",
          routes: <String, WidgetBuilder>{
            "/home": (BuildContext context) => const HomeScreen(),
            "/booksAllScreen": (BuildContext context) => const BooksAllScreen(),
            "/personsAllScreen": (BuildContext context) =>
                const PersonsAllScreen(),
            "/quizAllScreen": (context) => const QuizAllScreen(),
          },
        ),
      ),
    );
  }
}
