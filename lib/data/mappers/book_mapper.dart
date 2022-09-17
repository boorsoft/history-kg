import 'package:history_kg/data/api/models/api_book.dart';

import '../../../domain/models/book.dart';

class BookMapper {
  static Book fromJSON(ApiBook apiBook) {
    return Book(
      id: int.parse(apiBook.id.toString()),
      title: apiBook.title,
      author: apiBook.author,
      nameCity: apiBook.nameCity,
      fileName: apiBook.fileName,
    );
  }

  static List<Book> fromListJSON(List<ApiBook> map) {
    List<Book> books = map
        .map(
          (book) => Book(
            id: int.parse(book.id.toString()),
            title: book.title,
            author: book.author,
            nameCity: book.nameCity,
            fileName: book.fileName,
          ),
        )
        .toList();
    return books;
  }
}
