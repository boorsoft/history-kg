class ApiBook {
  final num id;
  final String title;
  final String author;
  final String city;
  final num year;
  final String fileName;

  ApiBook({
    required this.id,
    required this.title,
    required this.author,
    required this.city,
    required this.year,
    required this.fileName,
  });

  static ApiBook fromApi(Map<String, dynamic> map) {
    return ApiBook(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      city: map['city'],
      year: map['year'],
      fileName: map['fileName'],
    );
  }

  static List<ApiBook> fromListApi(List<dynamic> map) {
    List<ApiBook> books = map
        .map(
          (book) => ApiBook(
            id: book['id'],
            title: book['title'],
            author: book['author'],
            city: book['city'],
            year: book['year'],
            fileName: book['fileName'],
          ),
        )
        .toList();
    return books;
  }
}
