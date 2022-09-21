import 'package:dio/dio.dart';
import 'package:history_kg/data/api/models/api_articles.dart';
import 'package:history_kg/presentation/utils/constans.dart';

class ArticlesService {
  final Dio _dio = Dio();

  Future<List<ApiArticles>> fetchArticles() async {
    final response = await _dio.get(API_ARTICLES);
    return ApiArticles.fromListApi(response.data);

    // on SocketException {
    //   return ['no internet'];
    // } on HttpException {
    //   return ['500'];
    // }
  }
}
