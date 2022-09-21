import 'package:history_kg/data/api/services/articles_service.dart';
import 'package:history_kg/data/mappers/article_mapper.dart';

import '../../../domain/models/article.dart';

class ArticlesApiUtil {
  final ArticlesService _articlesService;

  ArticlesApiUtil(this._articlesService);

  Future<List<Article>> getArticles() async {
    final articles = await _articlesService.fetchArticles();
    return ArticleMapper.fromListJSON(articles);
  }
}
