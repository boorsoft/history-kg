import 'package:history_kg/data/api/models/api_articles.dart';
import 'package:history_kg/data/api/services/articles_service.dart';
import 'package:history_kg/presentation/utils/constans.dart';

import '../../../data/api/api_util/articles_api_util.dart';

class ArticleApiModule {
  static ArticlesApiUtil? _apiArticlesUtil;

  static ArticlesApiUtil articlesApiUtil() {
    _apiArticlesUtil ??= ArticlesApiUtil(ArticlesService());

    return _apiArticlesUtil!;
  }
}
