import 'package:history_kg/data/api/models/api_quiz.dart';

import '../../../domain/models/quiz.dart';
import '../../mappers/quiz_mapper.dart';
import '../services/quiz_service.dart';

class QuizApiUtil {
  final QuizService quizService;

  QuizApiUtil({required this.quizService});

  Future<List<Quiz>> getQuizes() async {
    final quizes = await quizService.fetchQuiz();

    return QuizMapper.fromListJSON(
      quizes,
    );
  }

  Future<Quiz> getQuizById(int id) async {
    final quiz = await quizService.fetchQuizById(id);
    return QuizMapper.fromJSON(
      quiz,
      quiz.questions,
      quiz.questions.map((e) => e.answers) as List<ApiAnswer>,
    );
  }
}
