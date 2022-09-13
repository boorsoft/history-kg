import 'package:history_kg/domain/models/quiz.dart';

abstract class PersonsRepository {
  Future<List<Quiz>> getQuizes();
  Future<Quiz> getPerson({required int personId});
}
