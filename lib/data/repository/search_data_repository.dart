import 'package:history_kg/data/api/api_util/search_api_util.dart';
import 'package:history_kg/domain/repository/search_repository.dart';

class SearchDataRepository extends SearchRepository {
  final SearchApiUtil _searchApiUtil;

  SearchDataRepository(this._searchApiUtil);

  @override
  Future<List> getSearchResult() {
    return _searchApiUtil.getSearch();
  }
}
