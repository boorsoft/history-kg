class ApiBook {
  final String id;
  final String title;
  final String author;
  final String nameCity;
  final String fileName;

  ApiBook({
    required this.id,
    required this.title,
    required this.author,
    required this.nameCity,
    required this.fileName,
  });

  static ApiBook fromApi(Map<String, dynamic> map) {
    return ApiBook(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      nameCity: map['city'],
      fileName: map['fileName'],
    );
  }

  static List<ApiBook> fromListApi(List<Map<String, dynamic>> map) {
    List<ApiBook> books = map
        .map(
          (book) => ApiBook(
            id: book['id'],
            title: book['title'],
            author: book['author'],
            nameCity: book['nameCity'],
            fileName: book['fileName'],
          ),
        )
        .toList();
    return books;
  }
}
