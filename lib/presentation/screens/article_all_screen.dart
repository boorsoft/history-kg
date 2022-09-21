import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:history_kg/presentation/widgets/app_bar.dart';
import 'package:history_kg/presentation/widgets/article_card.dart';

import '../state/article_bloc/article_bloc.dart';
import '../utils/styles.dart';

class ArticleAllScreen extends StatelessWidget {
  const ArticleAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar("Статьи"),
              GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        if (state is ArticleLoadingState)
                          SizedBox(
                            height: 114,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: accentColor,
                              ),
                            ),
                          ),
                        if (state is ArticleLoadedState)
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.articles.length,
                              itemBuilder: (context, index) {
                                var article = state.articles[index];
                                return ArticleCard(
                                    article: article, isAll: true);
                              })
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
