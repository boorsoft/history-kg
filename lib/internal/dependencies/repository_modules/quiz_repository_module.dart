import '../../../data/repository/quiz_data_repository.dart';
import '../util_modules/quiz_api_module.dart';

class QuizRepositoryModule {
  static QuizDataRepository? _quizDataRepository;

  static QuizDataRepository quizApiUtil() {
    _quizDataRepository ??=
        QuizDataRepository(quizApiUtil: QuizApiModule.quizApiUtil());
    return _quizDataRepository!;
  }
}
