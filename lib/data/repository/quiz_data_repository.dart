import 'dart:html';

import 'package:history_kg/data/api/api_until/quiz_api_until.dart';

import '../../domain/models/quiz.dart';
import '../../domain/repository/quiz_repository.dart';

class QuizDataRepository extends QuizRepository {
  final QuizApiUntil quizApiUntil;

  QuizDataRepository({required this.quizApiUntil});

  @override
  Future<List<Quiz>> getQuizes() {
    return quizApiUntil.getQuizes();
  }

  @override
  Future<Quiz> getQuizByID({required int quizId}) {
    return quizApiUntil.getQuizById(quizId);
  }
}
