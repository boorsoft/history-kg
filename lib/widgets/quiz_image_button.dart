import 'package:flutter/material.dart';
import 'package:history_kg/screens/quiz_screen.dart';

class QuizImageButton extends StatelessWidget {
  final int id;
  final String title;
  final List questions;
  const QuizImageButton(this.id, this.title, this.questions, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, right: 27, bottom: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => QuizScreen(questions)));
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
                padding: const EdgeInsets.only(left: 35),
                child: Image.asset(
                  "assets/images/Single Choice.png",
                  width: 44,
                  height: 44,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF28254A),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // ignore: unnecessary_const
                    Text(
                      questions.length.toString() + " вопросов",
                      style: const TextStyle(
                        color: Color(0xFF706CA4),
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    )
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
