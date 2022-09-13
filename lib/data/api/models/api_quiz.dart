import 'package:flutter/material.dart';

class ApiQuiz {
  final String id;
  final String title;
  final String subjectId;
  final List<ApiQuestions> questions;

  ApiQuiz({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.questions,
  });

  ApiQuiz.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        subjectId = map['subjectId'],
        questions = map['questions'];
}

class ApiQuestions {
  final String id;
  final String text;
  final String quizId;
  final List<ApiAnswer> answers;

  ApiQuestions({
    required this.id,
    required this.text,
    required this.quizId,
    required this.answers,
  });

  ApiQuestions.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        quizId = map['quizId'],
        answers = map['answers'];
}

class ApiAnswer {
  final String id;
  final String text;
  final String questionId;
  final bool isCorrectAnswer;

  ApiAnswer({
    required this.id,
    required this.text,
    required this.questionId,
    required this.isCorrectAnswer,
  });

  ApiAnswer.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        questionId = map['questionId'],
        isCorrectAnswer = map['isCorrectAnswer'];
}
