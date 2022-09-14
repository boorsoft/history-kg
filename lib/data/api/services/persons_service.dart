import 'package:dio/dio.dart';

import '../../../presentation/utils/constans.dart';
import '../models/api_person.dart';

class PersonsService {
  final Dio _dio = Dio();

  Future<List<ApiPerson>> fetchParagraphs() async {
    final response = await _dio.get(API_PARAGRAPHS);

    return ApiPerson.fromListApi(response.data);

    // on SocketException {
    //   return ['no internet'];
    // } on HttpException {
    //   return ['500'];
    // }
  }

  Future<ApiPerson> fetchParagraphById(int id) async {
    final response = await _dio.get("$API_PARAGRAPHS/$id");
    return ApiPerson.fromApi(response.data);
  }
}
