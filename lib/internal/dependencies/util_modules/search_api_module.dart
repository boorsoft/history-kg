import 'package:history_kg/data/api/api_util/search_api_util.dart';
import 'package:history_kg/data/api/services/search_service.dart';

class SearchApiModule {
  static SearchApiUtil? _searchApiUtil;

  static SearchApiUtil searchApiUtil(String searchValue) {
    _searchApiUtil ??=
        SearchApiUtil(searchService: SearchService(), searchValue: searchValue);
    return _searchApiUtil!;
  }
}
