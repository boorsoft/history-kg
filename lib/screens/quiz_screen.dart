import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:history_kg/widgets/answer_button.dart';
import 'package:history_kg/widgets/app_bar.dart';
import 'package:history_kg/widgets/confirm_button.dart';
import 'package:history_kg/widgets/result_dialog.dart';

class QuizScreen extends StatefulWidget {
  final List questions;
  const QuizScreen(this.questions, {Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int correctAnswersCount = 0;
  int currentIndex = 0;
  bool isButtonActive = false;
  bool isAnswerDisabled = false;
  bool quizFinished = false;
  bool hasMultipleCorrectAnswers = false;
  List selectedAnswers = [];
  List isSelected = [];
  bool confirmed = false;

  @override
  void initState() {
    super.initState();
    hasMultipleCorrectAnswers = checkHasMultipleCorrectAnswers();
  }

  bool checkHasMultipleCorrectAnswers() {
    int correctCount = 0;
    List answers = widget.questions[currentIndex]['answers'];

    for (var answer in answers) {
      if (answer['isCorrectAnswer']) correctCount += 1;
      isSelected.add(false);
    }

    if (correctCount > 1) {
      return true;
    } else {
      return false;
    }
  }

  bool onSelect(int index) {
    isSelected[index] = !isSelected[index];
    return isSelected[index];
  }

  void selectMultipleAnswers(answer) {
    if (!selectedAnswers.contains(answer)) {
      selectedAnswers.add(answer);
    } else {
      selectedAnswers.remove(answer);
    }
  }

  void nextQuestion() {
    if (currentIndex >= widget.questions.length - 1) return;
    setState(() {
      isSelected = [];
    });
    setState(() {
      selectedAnswers = [];
      currentIndex += 1;
      isAnswerDisabled = false;
      isButtonActive = false;
      confirmed = false;
    });
    checkHasMultipleCorrectAnswers();
  }

  void confirm() {
    bool isAllCorrect = true;
    for (var answer in selectedAnswers) {
      if (!answer['isCorrectAnswer']) isAllCorrect = false;
    }
    if (isAllCorrect) {
      setState(() {
        correctAnswersCount += 1;
      });
    }
    setState(() {
      confirmed = true;
      isAnswerDisabled = true;
    });
  }

  void onAnswerClick(answer) {
    if (isAnswerDisabled) return;
    setState(() {
      isButtonActive = true;
    });
    if (!hasMultipleCorrectAnswers) {
      if (answer['isCorrectAnswer']) {
        setState(() {
          correctAnswersCount += 1;
        });
      }
      setState(() {
        isAnswerDisabled = true;
        confirmed = true;
      });
    } else {
      selectMultipleAnswers(answer);
    }
  }

  void finishQuiz() {
    setState(() {
      quizFinished = true;
    });
    dialog(context, correctAnswersCount, widget.questions.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const CustomAppBar('Тестирование'),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                const SizedBox(
                  height: 210,
                ),
                Container(
                  width: 365,
                  height: 189,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9FF),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4644AA).withOpacity(0.1),
                        offset: const Offset(8, 4),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Text(widget.questions[currentIndex]['text']),
                ),
                Positioned(
                  top: 172,
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5547F0),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      "${currentIndex + 1}/${widget.questions.length}",
                      style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 64,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions[currentIndex]['answers'].length,
                itemBuilder: (BuildContext context, int index) {
                  var answers = widget.questions[currentIndex]['answers'];
                  return AnswerButton(
                    answers[index],
                    onSelect,
                    index,
                    isSelected[index],
                    confirmed,
                    hasMultipleCorrectAnswers,
                    isAnswerDisabled,
                    isButtonActive,
                    onAnswerClick,
                  );
                },
              ),
            ),
            isButtonActive
                ? (currentIndex < widget.questions.length - 1)
                    ? confirmed
                        ? ConfirmButton("Дальше", nextQuestion)
                        : ConfirmButton("Подтвердить", confirm)
                    : ConfirmButton("Завершить", finishQuiz)
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget answerButton(
    dynamic answer,
    bool confirmed,
    bool hasMultipleCorrectAnswers,
    bool disabled,
    bool buttonActive,
    bool isSelected,
    bool isClicked,
    Function onClick,
  ) {
    return GestureDetector(
      onTap: () {
        if (disabled) return;
        onClick(answer);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
          bottom: 20,
        ),
        child: Container(
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: !hasMultipleCorrectAnswers
                ? isClicked
                    ? answer['isCorrectAnswer']
                        ? const Color(0xFF81FFC2)
                        : const Color(0xFFFF7888)
                    : disabled
                        ? answer['isCorrectAnswer']
                            ? const Color(0xFF81FFC2)
                            : const Color(0xFFF9F9FF)
                        : const Color(0xFFF9F9FF)
                : confirmed
                    ? isSelected
                        ? const Color(0xFF81FFC2)
                        : const Color(0xFFFF7888)
                    : const Color(0xFFF9F9FF),
            border: hasMultipleCorrectAnswers
                ? isClicked
                    ? isSelected
                        ? buttonActive
                            ? Border.all(
                                width: 1, color: const Color(0xFF5547F0))
                            : null
                        : null
                    : null
                : null,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4644AA).withOpacity(0.1),
                offset: const Offset(8, 4),
                blurRadius: 24,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(
                  'assets/images/Select.png',
                  width: 25,
                  height: 25,
                ),
              ),
              Text(answer['text'])
            ],
          ),
        ),
      ),
    );
  }
}
