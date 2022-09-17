import '../../domain/models/book.dart';
import '../../domain/repository/books_repository.dart';
import '../api/api_util/book_api_util.dart';

class BookDataRepository extends BooksRepository {
  final BookApiUtil bookApiUtil;

  BookDataRepository({required this.bookApiUtil});

  @override
  Future<List<Book>> getBooks() {
    return bookApiUtil.getBooks();
  }

  @override
  Future<Book> getBookById({required int bookId}) {
    return bookApiUtil.getBookById(bookId);
  }
}
