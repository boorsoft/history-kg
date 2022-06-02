import 'dart:convert';

import 'package:history_kg/utils/constans.dart';
import 'package:http/http.dart' as http;

class QuizService {
  Future fetchQuiz() async {
    http.Response response = await http.get(Uri.parse(API_QUIZ));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('failed request');
    }
  }
}
