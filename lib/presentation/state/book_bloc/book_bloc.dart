import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/book.dart';
import '../../../domain/repository/books_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc(this._booksRepository) : super(BookInitial()) {
    on<GetBooksEvent>(_onGetBooks);
    on<GetBookByIdEvent>(_onGetBookById);
  }

  final BooksRepository _booksRepository;

  _onGetBooks(GetBooksEvent booksEvent, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    final books = await _booksRepository.getBooks();
    emit(BookLoadedState(books));
  }

  _onGetBookById(GetBookByIdEvent bookEvent, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    final book = await _booksRepository.getBookById(bookId: bookEvent.id);
    emit(BookByIdFetchedState(book));
  }
}
