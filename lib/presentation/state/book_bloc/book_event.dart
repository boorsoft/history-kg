part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class GetBooksEvent extends BookEvent {}

class GetBookByIdEvent extends BookEvent {
  final int id;

  GetBookByIdEvent(this.id);
}
