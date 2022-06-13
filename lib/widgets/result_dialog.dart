import 'package:flutter/material.dart';
import 'package:history_kg/screens/home_screen.dart';
import 'package:history_kg/screens/quiz_menu_screen.dart';

void dialog(BuildContext context, int countCorrect, int quizLength) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(35),
        backgroundColor: const Color(0xFFF9F9FF),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
        content: Text(
          "Вы ответили правильно на $countCorrect вопросов из $quizLength",
          style: const TextStyle(
            color: Color(0xFF28254A),
            fontSize: 18,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                int count = 0;
                Navigator.of(context).popUntil((route) => count++ == 2);
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 100,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5547F0),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: const Color(0xff33333340).withOpacity(0.25),
                        blurRadius: 4.0,
                        offset: const Offset(0, 4.0),
                      ),
                    ],
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      color: Color(0xFFF9F9FF),
                      fontSize: 14,
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
