import 'package:history_kg/data/api/api_util/book_api_util.dart';
import 'package:history_kg/domain/repository/books_repository.dart';
import '../../../data/repository/book_data_repository.dart';
import '../util_modules/book_api_module.dart';

class BookRepositoryModule {
  static BookDataRepository? _booksRepository;

  static BooksRepository bookRepository() {
    _booksRepository ??=
        BookDataRepository(bookApiUtil: BookApiModule.bookApiUtil());
    return _booksRepository!;
  }
}
