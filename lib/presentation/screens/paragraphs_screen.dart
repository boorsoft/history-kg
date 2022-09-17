import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/state/book_bloc/book_bloc.dart';

import '../widgets/app_bar.dart';
import '../widgets/paragraph_image_button.dart';

class ParagraphsScreen extends StatefulWidget {
  const ParagraphsScreen({Key? key}) : super(key: key);

  @override
  State<ParagraphsScreen> createState() => ParagraphsState();
}

class ParagraphsState extends State<ParagraphsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const CustomAppBar('Параграфы'),
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      if (state is BookLoadingState)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      if (state is BookLoadedState)
                        ListView.separated(
                          itemCount: state.books.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            color: Colors.white,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var book = state.books[index];

                            return ParagraphImageButton(
                              book.title,
                              book.id,
                              imagePath:
                                  "https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100",
                            );
                          },
                        ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
