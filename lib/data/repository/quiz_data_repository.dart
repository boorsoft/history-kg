import 'package:history_kg/data/api/api_util/quiz_api_util.dart';
import '../../domain/models/quiz.dart';
import '../../domain/repository/quiz_repository.dart';

class QuizDataRepository extends QuizRepository {
  final QuizApiUtil quizApiUtil;

  QuizDataRepository({required this.quizApiUtil});

  @override
  Future<List<Quiz>> getQuizes() {
    return quizApiUtil.getQuizes();
  }

  @override
  Future<Quiz> getQuizByID({required int quizId}) {
    return quizApiUtil.getQuizById(quizId);
  }
}
