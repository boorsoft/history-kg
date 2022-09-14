import 'package:history_kg/data/api/services/books_service.dart';
import 'package:history_kg/data/mappers/book_mapper.dart';

import '../../../domain/models/book.dart';

class BookApiUntil {
  final BooksService booksService;

  BookApiUntil({required this.booksService});

  Future<List<Book>> getQuizes() async {
    final book = await booksService.fetchBooks();
    return BookMapper.fromListJSON(
      book,
    );
  }

  Future<Book> getQuizById(int id) async {
    final book = await booksService.fetchBookById(id);
    return BookMapper.fromJSON(
      book,
    );
  }
}
