import '../../domain/models/book.dart';
import '../../domain/repository/books_repository.dart';
import '../api/api_until/book_api_until.dart';

class BookDataRepository extends BooksRepository {
  final BookApiUntil bookApiUntil;

  BookDataRepository({required this.bookApiUntil});

  @override
  Future<List<Book>> getBooks() {
    return bookApiUntil.getBooks();
  }

  @override
  Future<Book> getBookById({required int bookId}) {
    return bookApiUntil.getBookById(bookId);
  }
}
