import 'package:history_kg/data/api/services/search_service.dart';
import 'package:history_kg/data/mappers/search_mapper.dart';

class SearchApiUtil {
  final SearchService searchService;

  SearchApiUtil({required this.searchService});

  Future<List<dynamic>> getSearch(String query) async {
    final result = await searchService.fetchData(query);
    return SearchMapper.fromListJSON(result);
  }
}
