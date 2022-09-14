import '../../../domain/models/person.dart';
import '../../mappers/person_mapper.dart';
import '../services/persons_service.dart';

class PersonApiUntil {
  final PersonsService personsService;

  PersonApiUntil({required this.personsService});

  Future<List<Person>> getPersons() async {
    final person = await personsService.fetchPersons();
    return PersonMapper.fromListJSON(
      person,
    );
  }

  Future<Person> getPersonById(int id) async {
    final person = await personsService.fetchPersonById(id);
    return PersonMapper.fromJSON(
      person,
    );
  }
}
