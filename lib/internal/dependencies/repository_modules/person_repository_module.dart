import '../../../data/repository/person_data_repository.dart';
import '../util_modules/person_api_module.dart';

class PersonRepositoryModule {
  static PersonDataRepository? _personDataRepository;

  static PersonDataRepository personApiUtil() {
    _personDataRepository ??=
        PersonDataRepository(personApiUtil: PersonApiModule.personApiModule());
    return _personDataRepository!;
  }
}
