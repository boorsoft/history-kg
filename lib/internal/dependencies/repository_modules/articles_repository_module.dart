import 'package:history_kg/data/repository/article_data_repository.dart';
import 'package:history_kg/internal/dependencies/util_modules/article_api_module.dart';

class ArticlesRepositoryModule {
  static ArticleDataRepository? _articleDataRepository;

  static ArticleDataRepository articleDataRepository() {
    _articleDataRepository ??=
        ArticleDataRepository(ArticleApiModule.articlesApiUtil());
    return _articleDataRepository!;
  }
}
