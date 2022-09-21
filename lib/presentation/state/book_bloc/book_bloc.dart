import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repository/book_data_repository.dart';
import '../../../domain/models/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc(this._bookDataRepository) : super(BookInitial()) {
    on<GetBooksEvent>(_onGetBooks);
    on<GetBookByIdEvent>(_onGetBookById);
  }

  final BookDataRepository _bookDataRepository;

  FutureOr<void> _onGetBooks(
      GetBooksEvent booksEvent, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    final books = await _bookDataRepository.getBooks();
    emit(BookLoadedState(books));
  }

  FutureOr<void> _onGetBookById(
      GetBookByIdEvent bookEvent, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    final book = await _bookDataRepository.getBookById(bookId: bookEvent.id);
    emit(BookByIdFetchedState(book));
  }
}
