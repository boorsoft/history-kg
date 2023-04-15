part of 'quiz_bloc.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizLoadedState extends QuizState {
  final List<Quiz> quizes;

  QuizLoadedState(this.quizes);
}

class QuizErrorState extends QuizState {
  final dynamic error;

  QuizErrorState({this.error});
}
