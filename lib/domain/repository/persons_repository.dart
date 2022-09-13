import 'package:history_kg/domain/models/person.dart';

abstract class PersonsRepository {
  Future<List<Person>> getPersons();
  Future<Person> getPerson({required int personId});
}
