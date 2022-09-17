import 'package:history_kg/data/api/models/api_person.dart';
import 'package:history_kg/domain/models/person.dart';

class PersonMapper {
  static Person fromJSON(ApiPerson apiPerson) {
    return Person(
      id: int.parse(apiPerson.id.toString()),
      firstName: apiPerson.firstName,
      lastName: apiPerson.lastName,
      bio: apiPerson.bio,
      image: apiPerson.image,
      subjectId: int.parse(apiPerson.subjectId.toString()),
    );
  }

  static List<Person> fromListJSON(List<ApiPerson> apiPerson) {
    List<Person> persons = apiPerson
        .map(
          (person) => Person(
            id: int.parse(person.id.toString()),
            firstName: person.firstName,
            lastName: person.lastName,
            bio: person.bio,
            image: person.image,
            subjectId: int.parse(person.subjectId.toString()),
          ),
        )
        .toList();
    return persons;
  }
}
