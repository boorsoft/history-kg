import 'package:history_kg/data/api/api_util/articles_api_util.dart';
import 'package:history_kg/domain/models/article.dart';
import 'package:history_kg/domain/repository/article_repository.dart';

class ArticleDataRepository extends ArticleRepository {
  final ArticlesApiUtil _apiUtil;

  ArticleDataRepository(this._apiUtil);
  @override
  Future<List<Article>> getArticles() {
    return _apiUtil.getArticles();
  }
}
