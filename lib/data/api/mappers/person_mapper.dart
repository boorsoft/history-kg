import 'package:history_kg/data/api/models/api_person.dart';
import 'package:history_kg/domain/models/person.dart';

class PerosnMapper {
  static Person fromJSON(ApiPerson apiPerson) {
    return Person(
      id: int.parse(apiPerson.id),
      firstName: apiPerson.firstName,
      lastName: apiPerson.lastName,
      bio: apiPerson.bio,
      image: apiPerson.image,
      subjectId: int.parse(apiPerson.subjectId),
    );
  }
}
