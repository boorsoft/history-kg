import '../models/book.dart';

abstract class PersonsRepository {
  Future<List<Book>> getBooks();
  Future<Book> getBook({required int bookId});
}
