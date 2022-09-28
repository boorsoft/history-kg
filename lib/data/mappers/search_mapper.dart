import 'package:history_kg/data/api/models/api_quiz.dart';
import 'package:history_kg/data/mappers/quiz_mapper.dart';
import 'package:history_kg/domain/models/article.dart';
import 'package:history_kg/domain/models/book.dart';
import 'package:history_kg/domain/models/person.dart';
import 'package:history_kg/domain/models/quiz.dart';

import '../api/models/api_search.dart';

class SearchMapper {
  static List<dynamic> fromListJSON(List<ApiSearch> result) {
    return result.map((res) {
      if (res.type == 'books' && res.data.isNotEmpty) {
        return res.data
            .map(
              (book) => Book(
                id: book['id'],
                title: book['title'],
                author: book['author'],
                city: book['city'],
                year: book['year'],
                fileName: book['fileName'],
              ),
            )
            .toList();
      } else if (res.type == 'persons' && res.data.isNotEmpty) {
        return res.data
            .map(
              (person) => Person(
                id: person['id'],
                firstName: person['firstName'],
                lastName: person['lastName'],
                bio: person['bio'],
                image: person['image'],
                subjectId: person['subjectId'],
              ),
            )
            .toList();
      } else if (res.type == 'quiz' && res.data.isNotEmpty) {
        return res.data
            .map(
              (quiz) => Quiz(
                id: quiz['id'],
                title: quiz['title'],
                subjectId: quiz['subjectId'],
                questions: QuestionsMapper.fromListMap(
                    ApiQuestions.fromListApi(quiz['questions'])),
              ),
            )
            .toList();
      } else if (res.type == 'articles' && res.data.isNotEmpty) {
        return res.data
            .map(
              (article) => Article(
                id: article['id'],
                title: article['title'],
                text: article['text'],
                subjectId: article['subjectId'],
              ),
            )
            .toList();
      }
    }).toList();
  }
}
