import 'dart:convert';

import 'package:history_kg/utils/constans.dart';
import 'package:http/http.dart' as http;

class ParagraphsService {
  ParagraphsService();

  Future<List<dynamic>> fetchParagraphs() async {
    http.Response response = await http.get(Uri.parse(API_PARAGRAPHS));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('failed request');
    }
  }

  Future<Map<String, dynamic>> fetchParagraphById(int id) async {
    http.Response response = await http.get(Uri.parse("$API_PARAGRAPHS/$id"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('failed request');
    }
  }
}
