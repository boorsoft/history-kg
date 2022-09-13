import 'package:history_kg/data/api/models/api_book.dart';

import '../../../domain/models/book.dart';

class BookMapper {
  static Book fromJSON(ApiBook apiBook) {
    return Book(
      id: int.parse(apiBook.id),
      title: apiBook.title,
      author: apiBook.author,
      nameCity: apiBook.nameCity,
      fileName: apiBook.fileName,
    );
  }
}
