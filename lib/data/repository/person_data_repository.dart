import 'package:history_kg/data/api/api_util/person_api_util.dart';
import 'package:history_kg/domain/models/person.dart';
import 'package:history_kg/domain/repository/persons_repository.dart';

class PersonDataRepository extends PersonsRepository {
  final PersonApiUtil personApiUtil;

  PersonDataRepository({required this.personApiUtil});

  @override
  Future<Person> getPersonById({required int personId}) {
    return personApiUtil.getPersonById(personId);
  }

  @override
  Future<List<Person>> getPersons() {
    return personApiUtil.getPersons();
  }
}
