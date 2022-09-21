import 'package:flutter/material.dart';
import 'package:history_kg/data/api/api_util/search_api_util.dart';
import 'package:history_kg/data/api/services/search_service.dart';

import 'internal/app.dart';

void main() {
  // SearchService searchService = SearchService();
  // print("${searchService.fetchData("История")} main");
  SearchApiUtil searchApiUtil =
      SearchApiUtil(searchService: SearchService(), searchValue: "Айтматов");
  searchApiUtil.getSearch();
  runApp(const MyApp());
}
