import '../../../data/repository/book_data_repository.dart';
import '../util_modules/book_api_module.dart';

class BookRepositoryModule {
  static BookDataRepository? _bookDataRepository;

  static BookDataRepository bookRepository() {
    _bookDataRepository ??=
        BookDataRepository(bookApiUtil: BookApiModule.bookApiUtil());
    return _bookDataRepository!;
  }
}
