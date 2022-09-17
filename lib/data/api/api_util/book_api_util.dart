import 'package:history_kg/data/api/services/books_service.dart';
import 'package:history_kg/data/mappers/book_mapper.dart';

import '../../../domain/models/book.dart';

class BookApiUtil {
  final BooksService booksService;

  BookApiUtil({required this.booksService});

  Future<List<Book>> getBooks() async {
    final book = await booksService.fetchBooks();
    return BookMapper.fromListJSON(
      book,
    );
  }

  Future<Book> getBookById(int id) async {
    final book = await booksService.fetchBookById(id);
    return BookMapper.fromJSON(
      book,
    );
  }
}
