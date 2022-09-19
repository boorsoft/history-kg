import 'package:flutter/material.dart';

import 'package:history_kg/presentation/screens/book_detailed_screen.dart';
import 'package:history_kg/presentation/utils/styles.dart';

import '../../domain/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final bool isAll;
  const BookCard({
    Key? key,
    required this.book,
    required this.isAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BookDetailedScreen(book.id, book.fileName)));
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        width: 270,
        height: 114,
        margin:
            isAll ? const EdgeInsets.all(0) : const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: primaryClor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 14),
              blurRadius: 55,
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            book.title,
            style: titleTS,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            book.author,
            style: authorTS,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  "${book.city} - ",
                  style: cityTS,
                ),
                Text(
                  book.year.toString(),
                  style: cityTS,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
