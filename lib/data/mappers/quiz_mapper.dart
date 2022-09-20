import 'package:history_kg/data/api/models/api_quiz.dart';
import 'package:history_kg/domain/models/quiz.dart';

class QuizMapper {
  static Quiz fromJSON(
    ApiQuiz apiQuiz,
    List<ApiQuestions> apiQuestions,
    List<ApiAnswer> apiAnswers,
  ) {
    return Quiz(
      id: int.parse(apiQuiz.id.toString()),
      title: apiQuiz.title,
      subjectId: int.parse(apiQuiz.subjectId.toString()),
      questions: QuestionsMapper.fromListMap(apiQuestions),
    );
  }

  static List<Quiz> fromListJSON(
    List<ApiQuiz> apiQuiz,
  ) {
    return apiQuiz
        .map(
          (quiz) => Quiz(
            id: int.parse(quiz.id.toString()),
            title: quiz.title,
            subjectId: int.parse(quiz.subjectId.toString()),
            questions: QuestionsMapper.fromListMap(quiz.questions),
          ),
        )
        .toList();
  }
}

class QuestionsMapper {
  static List<Questions> fromListMap(List<ApiQuestions> apiQuestions) {
    List<Questions> questions = apiQuestions
        .map(
          (question) => Questions(
            id: int.parse(question.id.toString()),
            text: question.text,
            quizId: int.parse(question.quizId.toString()),
            answers: AnswerMapper.fromListMap(question.answers),
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
              id: int.parse(answer.id.toString()),
              text: answer.text,
              questionId: int.parse(answer.questionId.toString()),
              isCorrectAnswer: answer.isCorrectAnswer),
        )
        .toList();
    return answers;
  }
}
