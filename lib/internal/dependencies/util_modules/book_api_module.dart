import 'package:history_kg/data/api/api_util/book_api_util.dart';
import 'package:history_kg/data/api/services/books_service.dart';

class BookApiModule {
  static BookApiUtil? _bookApiUtil;

  static BookApiUtil bookApiUtil() {
    _bookApiUtil ??= BookApiUtil(booksService: BooksService());
    return _bookApiUtil!;
  }
}
