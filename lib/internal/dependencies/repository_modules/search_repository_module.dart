import 'package:history_kg/data/repository/search_data_repository.dart';
import 'package:history_kg/internal/dependencies/util_modules/search_api_module.dart';

class SearchRepositoryModule {
  static SearchDataRepository? _dataRepository;

  static SearchDataRepository searchDataRepository(String searchValue) {
    _dataRepository ??=
        SearchDataRepository(SearchApiModule.searchApiUtil(searchValue));
    return _dataRepository!;
  }
}
