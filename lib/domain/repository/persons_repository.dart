import 'package:history_kg/domain/models/person.dart';

abstract class PersonsRepository {
  Future<List<Person>> getPersons();
  Future<Person> getPersonById({required int personId});
}
