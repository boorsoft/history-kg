class Quiz {
  final int id;
  final String title;
  final String subjectId;
  final List<Questions> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.questions,
  });
}

class Questions {
  final int id;
  final String text;
  final int quizId;
  final List<Answer> answers;

  Questions({
    required this.id,
    required this.text,
    required this.quizId,
    required this.answers,
  });
}

class Answer {
  final int id;
  final String text;
  final int questionId;
  final bool isCorrectAnswer;

  Answer({
    required this.id,
    required this.text,
    required this.questionId,
    required this.isCorrectAnswer,
  });
}
