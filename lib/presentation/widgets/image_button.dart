import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/state/book_bloc/book_bloc.dart';

class ImageButton extends StatelessWidget {
  final String? _buttonText;
  final String? _imagePath;
  final String? _route;
  const ImageButton(this._buttonText, this._imagePath, this._route, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28, left: 18, right: 18),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          const SizedBox(
            height: 184,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(_route!);
              context.read<BookBloc>().add(GetBooksEvent());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset(
                _imagePath!,
                fit: BoxFit.cover,
                width: 390,
                height: 164,
              ),
            ),
          ),
          Positioned(
            bottom: 0.5,
            child: Container(
              width: 155,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF5547F0),
                borderRadius: BorderRadius.circular(18),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color(0xff33333340).withOpacity(0.25),
                    blurRadius: 4.0,
                    offset: const Offset(0, 4.0),
                  ),
                ],
              ),
              child: Text(
                _buttonText!,
                style: const TextStyle(
                  color: Color(0xFFF9F9FF),
                  fontSize: 16,
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
