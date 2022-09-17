// import 'package:flutter/material.dart';
// import 'package:history_kg/data/api/models/api_quiz.dart';

// import '../../services/quiz_service.dart';

// import '../widgets/app_bar.dart';
// import '../widgets/quiz_image_button.dart';

// class QuizMenuScreen extends StatefulWidget {
//   const QuizMenuScreen({Key? key}) : super(key: key);

//   @override
//   State<QuizMenuScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizMenuScreen> {
//   late ApiQuiz quizData;
//   bool isLoading = true;

//   QuizService quizService = QuizService();

//   @override
//   void initState() {
//     super.initState();
//     getQuiz();
//   }

//   Future<void> getQuiz() async {
//     quizData = await quizService.fetchQuiz();

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // if (isLoading) {
//     //   return circularIndicator;
//     // } else {
//     //   if (quizData[0] == 'no internet' || quizData[0] == '500') {
//     //     return Failure(quizData[0], 'Параграфы');
//     //   }
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             const CustomAppBar("Тестирование"),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: quizData.id,
//                 itemBuilder: (BuildContext context, int index) {
//                   // var quizData = quizData[index];

//                   List questions = quizData.questions;
//                   return QuizImageButton(
//                     quizData.id,
//                     quizData.title,
//                     quizData.questions,
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
