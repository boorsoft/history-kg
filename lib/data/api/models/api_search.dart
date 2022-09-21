class ApiSearch {
  final String type;
  final List<dynamic> data;

  ApiSearch({required this.type, required this.data});

  static List<ApiSearch> fromListApi(List<dynamic> result) {
    return result
        .map((res) => ApiSearch(type: res['type'], data: res['data']))
        .toList();
  }
}
      // if (res['type'] == 'books') {
      //   return ApiBook.fromListApi(res['data']);
      // } else if (res['type'] == 'persons') {
      //   return ApiPerson.fromListApi(res['data']);
      // } else if (res['type'] == 'quiz') {
      //   return ApiQuiz.fromListApi(res['data']);
      // } else if (res['type'] == 'articles') {
      //   return ApiArticles.fromListApi(res['data']);
      // }