import 'package:history_kg/data/api/services/search_service.dart';
import 'package:history_kg/data/mappers/search_mapper.dart';

class SearchApiUtil {
  final SearchService searchService;
  final String searchValue;

  SearchApiUtil({required this.searchService, required this.searchValue});

  Future<List<dynamic>> getSearch() async {
    final result = await searchService.fetchData(searchValue);

    return SearchMapper.fromListJSON(result);
  }
}
