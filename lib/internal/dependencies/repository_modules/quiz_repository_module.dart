import '../../../data/repository/quiz_data_repository.dart';
import '../util_modules/quiz_api_module.dart';

class PersonRepositoryModule {
  static QuizDataRepository? _quizDataRepository;

  static QuizDataRepository bookApiUtil() {
    _quizDataRepository ??=
        QuizDataRepository(quizApiUtil: QuizApiModule.quizApiUtil());
    return _quizDataRepository!;
  }
}
