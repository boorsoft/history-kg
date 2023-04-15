part of 'book_bloc.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}

class BookLoadedState extends BookState {
  final List<Book> books;

  BookLoadedState(this.books);
}

class BookByIdFetchedState extends BookState {
  final Book book;

  BookByIdFetchedState(this.book);
}

class BookLoadingState extends BookState {}

class BookErrorState extends BookState {
  final dynamic err;

  BookErrorState({this.err});
}
