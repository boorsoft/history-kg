import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:history_kg/presentation/state/article_bloc/article_bloc.dart';
import 'package:history_kg/presentation/widgets/article_card.dart';

import '../utils/styles.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
      if (state is ArticleLoadingState) {
        return SizedBox(
          height: 114,
          child: Center(
            child: CircularProgressIndicator(
              color: accentColor,
            ),
          ),
        );
      }
      if (state is ArticleLoadedState) {
        return SizedBox(
          height: 120,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.articles.length < 3 ? state.articles.length : 3,
              itemBuilder: (context, index) {
                var article = state.articles[index];
                return ArticleCard(article: article, isAll: false);
              }),
        );
      }
      return const SizedBox();
    });
  }
}
