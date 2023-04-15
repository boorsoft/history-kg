part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  final List<Article> articles;

  ArticleLoadedState(this.articles);
}

class ArticleErrorState extends ArticleState {
  final dynamic error;

  ArticleErrorState(this.error);
}
