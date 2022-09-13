import 'package:history_kg/data/api/models/api_quiz.dart';
import 'package:history_kg/domain/models/quiz.dart';

class QuizMapper {
  static Quiz fromJSON(ApiQuiz apiQuiz, List<ApiQuestions> apiQuestions,
      List<ApiAnswer> apiAnswers) {
    return Quiz(
      id: int.parse(apiQuiz.id),
      title: apiQuiz.title,
      subjectId: apiQuiz.subjectId,
      questions: QuestionsMapper.fromListMap(apiQuestions, apiAnswers),
    );
  }
}

class QuestionsMapper {
  static List<Questions> fromListMap(
      List<ApiQuestions> apiQuestions, List<ApiAnswer> apiAnswers) {
    List<Questions> questions = apiQuestions
        .map(
          (question) => Questions(
            id: int.parse(question.id),
            text: question.text,
            quizId: int.parse(question.quizId),
            answers: AnswerMapper.fromListMap(apiAnswers),
          ),
        )
        .toList();
    return questions;
  }
}

class AnswerMapper {
  static List<Answer> fromListMap(List<ApiAnswer> apiAnswers) {
    List<Answer> answers = apiAnswers
        .map(
          (answer) => Answer(
              id: int.parse(answer.id),
              text: answer.text,
              questionId: int.parse(answer.questionId),
              isCorrectAnswer: answer.isCorrectAnswer),
        )
        .toList();
    return answers;
  }
}
