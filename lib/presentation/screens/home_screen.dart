import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/image_button.dart';

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
                      "/persons",
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
