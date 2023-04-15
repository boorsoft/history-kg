import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/state/article_bloc/article_bloc.dart';
import 'package:history_kg/presentation/widgets/article_card.dart';
import 'package:history_kg/presentation/widgets/app_failure.dart';
import 'package:history_kg/presentation/widgets/shimmer_generator.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
      return Column(
        children: [
          if (state is ArticleLoadingState)
            const ShimmerGenerator(
              count: 2,
              axisDirection: Axis.horizontal,
              height: 120,
              width: 260,
              padding: EdgeInsets.only(right: 15),
            ),
          if (state is ArticleLoadedState)
            SizedBox(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      state.articles.length < 3 ? state.articles.length : 3,
                  itemBuilder: (context, index) {
                    var article = state.articles[index];
                    return ArticleCard(article: article, isAll: false);
                  }),
            ),
          if (state is ArticleErrorState) Failure(state.error)
        ],
      );
    });
  }
}
