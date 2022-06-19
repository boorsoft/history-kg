import 'dart:convert';
import 'dart:io';

import 'package:history_kg/utils/constans.dart';
import 'package:http/http.dart' as http;

class PersonsService {
  Future<List<dynamic>> fetchPersons() async {
    try {
      http.Response response = await http.get(Uri.parse(API_PERSONS));

      return jsonDecode(response.body);
    } on SocketException {
      return ['no internet'];
    } on HttpException {
      return ['500'];
    }
  }

  Future<Map<String, dynamic>> fetchPersonById(int id) async {
    http.Response response = await http.get(Uri.parse("$API_PERSONS/$id"));
    return jsonDecode(response.body);
  }
}
