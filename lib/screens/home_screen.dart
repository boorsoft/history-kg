import 'package:flutter/material.dart';
import 'package:history_kg/widgets/image_button.dart';

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
        body: Column(
          children: <Widget>[
            const CustomAppBar(
              "История Кыргызстана",
              isHome: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const <Widget>[
                    ImageButton(
                      "Параграфы",
                      "assets/images/home-pic1.jpg",
                      "/paragraphs",
                    ),
                    ImageButton(
                      "Личности",
                      "assets/images/home-pic2.jpg",
                      "",
                    ),
                    ImageButton(
                      "Тестирование",
                      "assets/images/home-pic3.jpg",
                      "/quizMenu",
                    ),
                    ImageButton(
                      "О прилложении",
                      "assets/images/home-pic4.jpg",
                      "",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
