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

  ApiBook.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        author = map['author'],
        nameCity = map['city'],
        fileName = map['fileName'];
}
