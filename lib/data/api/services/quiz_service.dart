import 'package:dio/dio.dart';
import '../../../data/api/models/api_quiz.dart';
import '../../../presentation/utils/constans.dart';

class QuizService {
  final Dio _dio = Dio();

  Future<List<ApiQuiz>> fetchQuiz() async {
    final response = await _dio.get(API_QUIZ);
    return ApiQuiz.fromListApi(response.data);
  }

  Future<ApiQuiz> fetchQuizById(int id) async {
    final response = await _dio.get("$API_QUIZ/$id");
    return ApiQuiz.fromApi(response.data);
  }
}
