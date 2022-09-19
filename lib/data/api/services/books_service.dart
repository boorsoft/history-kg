import 'package:dio/dio.dart';
import 'package:history_kg/data/api/models/api_book.dart';

import '../../../presentation/utils/constans.dart';

class BooksService {
  final Dio _dio = Dio();

  Future<List<ApiBook>> fetchBooks() async {
    final response = await _dio.get(API_BOOKS);
    return ApiBook.fromListApi(response.data);

    // on SocketException {
    //   return ['no internet'];
    // } on HttpException {
    //   return ['500'];
    // }
  }

  Future<ApiBook> fetchBookById(int id) async {
    final response = await _dio.get("$API_BOOKS/$id");

    return ApiBook.fromApi(response.data);
  }
}
