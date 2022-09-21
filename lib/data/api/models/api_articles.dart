class ApiArticles {
  final num id;
  final String title;
  final String text;
  final num subjectId;

  ApiArticles({
    required this.id,
    required this.title,
    required this.text,
    required this.subjectId,
  });

  static List<ApiArticles> fromListApi(List<dynamic> data) {
    return data
        .map(
          (article) => ApiArticles(
            id: article['id'],
            title: article['title'],
            text: article['text'],
            subjectId: article['subjectId'],
          ),
        )
        .toList();
  }
}
