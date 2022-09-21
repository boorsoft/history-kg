import 'package:flutter/material.dart';
import 'package:history_kg/presentation/screens/article_screen.dart';
import 'package:history_kg/presentation/screens/books_screen.dart';
import 'package:history_kg/presentation/screens/persons_screen.dart';
import 'package:history_kg/presentation/screens/quiz_menu_screen.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
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
                              SeeAll(
                                  "Исторические личности", '/personsAllScreen'),
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
    );
  }
}
