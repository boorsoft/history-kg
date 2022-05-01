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
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              CustomAppBar("История Кыргызстана"),
              ImageButton(
                "Параграфы",
                "assets/images/home-pic1.jpg",
                "/paragraphs",
              ),
              ImageButton(
                "Исторические личности",
                "assets/images/home-pic2.jpg",
                "",
              ),
              ImageButton(
                "Тест",
                "assets/images/home-pic3.jpg",
                "",
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
    );
  }
}
