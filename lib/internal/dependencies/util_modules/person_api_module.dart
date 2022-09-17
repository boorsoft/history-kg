import 'package:history_kg/data/api/api_util/person_api_util.dart';
import '../../../data/api/services/persons_service.dart';

class PersonApiModule {
  static PersonApiUtil? _personApiUtil;

  static PersonApiUtil personApiModule() {
    _personApiUtil ??= PersonApiUtil(personsService: PersonsService());
    return _personApiUtil!;
  }
}
