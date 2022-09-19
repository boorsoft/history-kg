import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/utils/styles.dart';
import 'package:history_kg/presentation/widgets/app_bar.dart';

import '../state/book_bloc/book_bloc.dart';
import '../widgets/book_card.dart';

class BooksAllScreen extends StatelessWidget {
  const BooksAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomAppBar(
                      "Книги",
                      isHome: false,
                    ),
                    if (state is BookLoadingState)
                      const SizedBox(
                        height: 114,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    if (state is BookLoadedState)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.books.length,
                          itemBuilder: (BuildContext context, int index) {
                            var book = state.books[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 16, top: 10),
                              child: BookCard(
                                book: book,
                                isAll: true,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
