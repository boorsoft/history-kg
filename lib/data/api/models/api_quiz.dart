class ApiQuiz {
  final num id;
  final String title;
  final num subjectId;
  final List<ApiQuestions> questions;

  ApiQuiz({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.questions,
  });

  static List<ApiQuiz> fromListApi(List<dynamic> map) {
    List<ApiQuiz> quizes = map
        .map(
          (e) => ApiQuiz(
            id: e['id'],
            title: e['title'],
            subjectId: e['subjectId'],
            questions: List<ApiQuestions>.from(
              e['questions'].map(
                (question) => ApiQuestions.fromListApi(question),
              ),
            ),
          ),
        )
        .toList();
    return quizes;
  }

  static ApiQuiz fromApi(Map<String, dynamic> map) {
    return ApiQuiz(
      id: map['id'],
      title: map['title'],
      subjectId: map['subjectId'],
      questions: List<ApiQuestions>.from(
        map['questions'].map(
          (question) => ApiQuestions.fromListApi(question),
        ),
      ),
    );
  }
}

class ApiQuestions {
  final num id;
  final String text;
  final num quizId;
  final List<ApiAnswer> answers;

  ApiQuestions({
    required this.id,
    required this.text,
    required this.quizId,
    required this.answers,
  });

  ApiQuestions.fromListApi(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        quizId = map['quizId'],
        answers = List<ApiAnswer>.from(
            map['answers'].map((e) => ApiAnswer.fromApi(e)));
}

class ApiAnswer {
  final num id;
  final String text;
  final num questionId;
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
