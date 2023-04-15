import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/screens/article_screen.dart';
import 'package:history_kg/presentation/screens/books_screen.dart';
import 'package:history_kg/presentation/screens/persons_screen.dart';
import 'package:history_kg/presentation/screens/quiz_menu_screen.dart';
import 'package:history_kg/presentation/state/article_bloc/article_bloc.dart';
import 'package:history_kg/presentation/state/book_bloc/book_bloc.dart';
import 'package:history_kg/presentation/state/persons_bloc/persons_bloc.dart';
import 'package:history_kg/presentation/state/quiz_bloc/quiz_bloc.dart';
import 'package:history_kg/presentation/utils/styles.dart';
import 'package:history_kg/presentation/widgets/see_all.dart';

import '../widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    BlocProvider.of<BookBloc>(context).add(GetBooksEvent());
    BlocProvider.of<PersonsBloc>(context).add(GetPersonsEvent());
    BlocProvider.of<QuizBloc>(context).add(GetQuizEvent());
    BlocProvider.of<ArticleBloc>(context).add(GetArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              const CustomAppBar(
                "История Кыргызстана",
                isHome: true,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        GestureDetector(
                          onTap: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                SeeAll("Книги", '/booksAllScreen'),
                                SizedBox(
                                  height: 10,
                                ),
                                BooksScreen(),
                                SeeAll("Исторические личности",
                                    '/personsAllScreen'),
                                SizedBox(
                                  height: 10,
                                ),
                                PersonsScreen(),
                                SeeAll("Тестирование", '/quizAllScreen'),
                                SizedBox(
                                  height: 10,
                                ),
                                QuizMenuScreen(),
                                SeeAll("Тестирование", '/articleAllScreen'),
                                SizedBox(
                                  height: 10,
                                ),
                                ArticleScreen(),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
