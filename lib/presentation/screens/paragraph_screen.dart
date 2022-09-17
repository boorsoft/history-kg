// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';

// import '../widgets/app_bar.dart';

// class ParagraphScreen extends StatefulWidget {
//   final String title;
//   final int id;

//   const ParagraphScreen(this.title, this.id, {Key? key}) : super(key: key);

//   @override
//   State<ParagraphScreen> createState() => _ParagraphScreenState();
// }

// class _ParagraphScreenState extends State<ParagraphScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             CustomAppBar(widget.title),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Html(
//                     data: paragraphData['text'].toString(),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
