import 'package:history_kg/data/api/api_util/quiz_api_util.dart';
import 'package:history_kg/data/api/services/quiz_service.dart';

class QuizApiModule {
  static QuizApiUtil? _quizApiUtil;

  static QuizApiUtil quizApiUtil() {
    _quizApiUtil ??= QuizApiUtil(quizService: QuizService());
    return _quizApiUtil!;
  }
}
