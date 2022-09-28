import 'package:dio/dio.dart';
import 'package:history_kg/data/api/models/api_search.dart';
import 'package:history_kg/presentation/utils/constans.dart';

class SearchService {
  final Dio _dio = Dio();

  Future<List<ApiSearch>> fetchData(String searchValue) async {
    final response = await _dio.get(
      "$API_URL/api/search",
      queryParameters: {'searchValue': searchValue},
    );

    return ApiSearch.fromListApi(response.data);

    // } on SocketException {
    //   return ['no internet'];
    // } on HttpException {
    //   return ['500'];
    // }
  }
}
