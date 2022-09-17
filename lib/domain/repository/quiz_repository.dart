import 'package:history_kg/domain/models/quiz.dart';

abstract class QuizRepository {
  Future<List<Quiz>> getQuizes();
  Future<Quiz> getQuizByID({required int quizId});
}
