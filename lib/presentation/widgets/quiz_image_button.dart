import 'package:flutter/material.dart';
import 'package:history_kg/presentation/utils/styles.dart';

import '../../domain/models/quiz.dart';
import '../screens/quiz_screen.dart';

class QuizImageButton extends StatelessWidget {
  final Quiz quiz;
  const QuizImageButton(this.quiz, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, right: 27, bottom: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuizScreen(quiz.questions)));
        },
        child: Container(
          width: 360,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9FF),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4644AA).withOpacity(0.1),
                blurRadius: 24,
                offset: const Offset(9, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Image.asset(
                  "assets/images/Multiple Choice.png",
                  width: 44,
                  height: 44,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 245,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      quiz.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: titleTS,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      quiz.questions.length.toString() + " вопросов",
                      style: const TextStyle(
                        color: Color(0xFF8F8A82),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
