import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../presentation/utils/constans.dart';

class ParagraphsService {
  Future<List<dynamic>> fetchParagraphs() async {
    try {
      http.Response response = await http.get(Uri.parse(API_PARAGRAPHS));

      return jsonDecode(response.body);
    } on SocketException {
      return ['no internet'];
    } on HttpException {
      return ['500'];
    }
  }

  Future<Map<String, dynamic>> fetchParagraphById(int id) async {
    http.Response response = await http.get(Uri.parse("$API_PARAGRAPHS/$id"));
    return jsonDecode(response.body);
  }
}
