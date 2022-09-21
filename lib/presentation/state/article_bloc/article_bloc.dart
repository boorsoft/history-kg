import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repository/article_data_repository.dart';
import '../../../domain/models/article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(this._articleDataRepository) : super(ArticleInitial()) {
    on<ArticleEvent>(_onGetArticle);
  }

  final ArticleDataRepository _articleDataRepository;

  FutureOr<void> _onGetArticle(
      ArticleEvent event, Emitter<ArticleState> emit) async {
    emit(ArticleLoadingState());
    final res = await _articleDataRepository.getArticles();
    emit(ArticleLoadedState(res));
  }
}
