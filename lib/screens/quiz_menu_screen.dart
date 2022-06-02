import 'package:flutter/material.dart';
import 'package:history_kg/utils/styles.dart';
import 'package:history_kg/widgets/app_bar.dart';
import 'package:history_kg/widgets/quiz_image_button.dart';

import '../services/quiz_service.dart';

class QuizMenuScreen extends StatefulWidget {
  const QuizMenuScreen({Key? key}) : super(key: key);

  @override
  State<QuizMenuScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizMenuScreen> {
  List quizData = [];
  bool isLoading = true;

  QuizService quizService = QuizService();

  @override
  void initState() {
    super.initState();
    getQuiz();
  }

  Future<void> getQuiz() async {
    try {
      quizData = await quizService.fetchQuiz();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? circularIndicator
        : Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  const CustomAppBar("Тестирование"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: quizData.length,
                      itemBuilder: (BuildContext context, int index) {
                        var quiz = quizData[index];
                        print(quiz['questions']);
                        List questions = quiz['questions'];
                        return QuizImageButton(
                          quiz['id'],
                          quiz['title'],
                          questions,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
