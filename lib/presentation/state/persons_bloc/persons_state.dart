part of 'persons_bloc.dart';

@immutable
abstract class PersonsState {}

class PersonsInitial extends PersonsState {}

class PersonsLoadingState extends PersonsState {}

class PersonsLoadedState extends PersonsState {
  final List<Person> persons;

  PersonsLoadedState(this.persons);
}
