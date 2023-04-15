import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:history_kg/presentation/screens/article_detailed_screen.dart';

import '../../domain/models/article.dart';
import '../utils/styles.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final bool isAll;
  const ArticleCard({Key? key, required this.article, required this.isAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArticleDetailedScreen(article: article))),
      child: Container(
        height: 120,
        width: 260,
        margin: isAll
            ? const EdgeInsets.only(bottom: 20, left: 15, right: 15)
            : const EdgeInsets.only(right: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9FF),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4644AA).withOpacity(0.1),
              blurRadius: 24,
              offset: const Offset(8, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: titleTS,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Html(
                    data: article.text,
                    style: {
                      'p': Style(
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        alignment: Alignment.centerLeft,
                        color: const Color(0xFF8F8A82),
                        fontSize: const FontSize(12),
                        fontWeight: FontWeight.w500,
                      ),
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
