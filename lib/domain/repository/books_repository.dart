import '../models/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooks();
  Future<Book> getBookById({required int bookId});
}
