import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/widgets/app_bar.dart';

import '../state/quiz_bloc/quiz_bloc.dart';
import '../widgets/quiz_image_button.dart';

class QuizAllScreen extends StatelessWidget {
  const QuizAllScreen({Key? key}) : super(key: key);

  get accentColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar("Тестирование"),
            BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is QuizLoadingState) {
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: accentColor,
                      ),
                    ),
                  );
                }
                if (state is QuizLoadedState) {
                  return ListView.builder(
                    itemCount:
                        state.quizes.length < 3 ? state.quizes.length : 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var quiz = state.quizes[index];

                      return QuizImageButton(quiz);
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
