import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:history_kg/domain/models/article.dart';
import 'package:history_kg/internal/dependencies/util_modules/search_api_module.dart';
import 'package:history_kg/presentation/screens/book_detailed_screen.dart';
import 'package:history_kg/presentation/screens/person_screen.dart';
import 'package:history_kg/presentation/screens/quiz_screen.dart';
import 'package:history_kg/presentation/widgets/search_result_card.dart';

import '../../domain/models/book.dart';
import '../../domain/models/person.dart';
import '../../domain/models/quiz.dart';
import '../screens/article_detailed_screen.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final bool? isHome;
  const CustomAppBar(this.title, {this.isHome = false, Key? key})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late Widget route;
  String title = '';
  final TextEditingController _textEditingController = TextEditingController();

  FutureOr<Iterable<dynamic>> initSearchResult(String query) async {
    final apiModule = SearchApiModule.searchApiUtil();
    final res = await apiModule.getSearch(query.trim());
    if (res[0] != null && res[0][0].runtimeType == Book) {
      route = BookDetailedScreen(res[0][0].fileName);
      title = res[0][0].title;
      // return res[0];
    } else if (res[1] != null && res[1][0].runtimeType == Person) {
      route = PersonScreen(res[1][0]);
      title = "${res[1][0].firstName} ${res[1][0].lastName}";
      // return res[1];
    } else if (res[2] != null && res[2][0].runtimeType == Quiz) {
      route = QuizScreen(res[2][0].questions);
      title = res[2][0].title;
      // return res[2];
    } else if (res[3] != null && res[3][0].runtimeType == Article) {
      route = ArticleDetailedScreen(article: res[3][0]);
      title = res[3][0].title;
      // return res[3];
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Container(
        height: 140,
        width: double.infinity,
        color: accentColor,
        margin: const EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                // : MediaQuery.of(context).size.width * 0.55,
                child: Row(
                  mainAxisAlignment: widget.isHome!
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    if (widget.isHome == false)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(
                            Icons.chevron_left,
                            color: primaryClor,
                            size: 30,
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      alignment: Alignment.center,
                      child: Text(
                        widget.title,
                        style: appBarTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 17),
                padding: const EdgeInsets.symmetric(horizontal: 17),
                decoration: BoxDecoration(
                  color: textFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TypeAheadField<dynamic>(
                  textFieldConfiguration: TextFieldConfiguration(
                    cursorColor: accentColor,
                    controller: _textEditingController,
                    style: hintTS,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Поиск",
                      hintStyle: hintTS,
                    ),
                  ),
                  suggestionsCallback: (pattern) => initSearchResult(pattern),
                  itemBuilder: (context, sugg) {
                    //кыргызстана
                    if (sugg is List<Book>) {
                      route = BookDetailedScreen(sugg[0].fileName);
                      return SearchResultCard(sugg[0].title);
                    } else if (sugg is List<Person>) {
                      PersonScreen(sugg[0]);
                      return SearchResultCard(
                          "${sugg[0].firstName} ${sugg[0].lastName}");
                    } else if (sugg is List<Quiz>) {
                      route = QuizScreen(sugg[0].questions);
                      return SearchResultCard(sugg[0].title);
                    } else if (sugg is List<Article>) {
                      route = ArticleDetailedScreen(article: sugg[0]);
                      return SearchResultCard(sugg[0].title);
                    }
                    return const SizedBox.shrink();
                  },
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shadowColor: shadowColor,
                  ),
                  onSuggestionSelected: (_) {
                    _textEditingController.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => route),
                        ModalRoute.withName('/home'));
                  },
                  errorBuilder: (context, _) {
                    return _textEditingController.text == ''
                        ? const SizedBox()
                        : Container(
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 15),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Ничего не найдено",
                              style: titleTS.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                  },
                  loadingBuilder: (context) {
                    return _textEditingController.text == ''
                        ? const SizedBox()
                        : Container(
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 15),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: CircularProgressIndicator(
                              color: accentColor,
                            ),
                          );
                  },
                  noItemsFoundBuilder: (context) {
                    return Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Ничего не найдено",
                        style: titleTS.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                  debounceDuration: const Duration(milliseconds: 700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
