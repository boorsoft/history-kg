import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/utils/styles.dart';

import '../state/book_bloc/book_bloc.dart';
import '../widgets/book_card.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is BookLoadingState)
              SizedBox(
                height: 114,
                child: Center(
                  child: CircularProgressIndicator(
                    color: accentColor,
                  ),
                ),
              ),
            if (state is BookLoadedState)
              SizedBox(
                height: 114,
                child: ListView.separated(
                  itemCount: state.books.length < 3 ? state.books.length : 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Colors.white,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var book = state.books[index];
                    return BookCard(
                      book: book,
                      isAll: false,
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
