import 'package:dio/dio.dart';
import '../../../data/api/models/api_quiz.dart';
import '../../../presentation/utils/constans.dart';

class QuizService {
  final Dio _dio = Dio();

  Future<List<ApiQuiz>> fetchQuiz() async {
    final response = await _dio.get(API_QUIZ);
    // print(jsonDecode(response.body));
    return ApiQuiz.fromListApi(response.data);

    // } on SocketException {
    //   return ['no internet'];
    // } on HttpException {
    //   return ['500'];
    // }
  }

  Future<ApiQuiz> fetchQuizById(int id) async {
    final response = await _dio.get("$API_QUIZ/$id");
    // print(jsonDecode(response.body));
    return ApiQuiz.fromApi(response.data);
  }
}
