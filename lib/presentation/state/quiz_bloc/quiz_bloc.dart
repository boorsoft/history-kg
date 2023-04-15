import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:history_kg/data/repository/quiz_data_repository.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/quiz.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(this._dataRepository) : super(QuizInitial()) {
    on<GetQuizEvent>(_onGetQuiz);
  }

  final QuizDataRepository _dataRepository;

  FutureOr<void> _onGetQuiz(GetQuizEvent event, Emitter<QuizState> emit) async {
    try {
      emit(QuizLoadingState());
      final quizes = await _dataRepository.getQuizes();
      emit(QuizLoadedState(quizes));
    } catch (err) {
      emit(QuizErrorState(error: err));
    }
  }
}
