import 'package:history_kg/data/api/models/api_articles.dart';
import 'package:history_kg/domain/models/article.dart';

class ArticleMapper {
  static List<Article> fromListJSON(List<ApiArticles> map) {
    List<Article> articles = map
        .map(
          (article) => Article(
            id: int.parse(article.id.toString()),
            title: article.title,
            text: article.text,
            subjectId: int.parse(article.subjectId.toString()),
          ),
        )
        .toList();
    return articles;
  }
}
