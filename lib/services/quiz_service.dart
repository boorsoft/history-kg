import 'dart:convert';
import 'dart:io';

import 'package:history_kg/utils/constans.dart';
import 'package:http/http.dart' as http;

class QuizService {
  Future fetchQuiz() async {
    try {
      http.Response response = await http.get(Uri.parse(API_QUIZ));
      return jsonDecode(response.body);
    } on SocketException {
      return ['no internet'];
    } on HttpException {
      return ['500'];
    }
  }
}
