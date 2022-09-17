import 'package:history_kg/internal/dependencies/person_api_module.dart';

import '../../../data/repository/person_data_repository.dart';

class PersonRepositoryModule {
  static PersonDataRepository? _personDataRepository;

  static PersonDataRepository bookApiUtil() {
    _personDataRepository ??=
        PersonDataRepository(personApiUtil: PersonApiModule.personApiModule());
    return _personDataRepository!;
  }
}
