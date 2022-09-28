import 'package:flutter/material.dart';

import '../utils/styles.dart';

class SearchResultCard extends StatelessWidget {
  final String title;
  const SearchResultCard(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: titleTS.copyWith(fontSize: 15),
      ),
    );
  }
}
