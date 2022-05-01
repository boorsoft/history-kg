import 'package:flutter/material.dart';
import 'package:history_kg/screens/paragraph_screen.dart';

class ParagraphImageButton extends StatelessWidget {
  final String? _buttonText;
  final String? _imagePath;
  final int id;

  const ParagraphImageButton(this._buttonText, this._imagePath, this.id,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ParagraphScreen(_buttonText!, id)));
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Hero(
              tag: _imagePath!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image(
                    image: Image.network(_imagePath!, fit: BoxFit.cover).image),
              ),
            ),
            Positioned(
              width: 170.0,
              left: 45.0,
              bottom: 45.0,
              child: Text(
                _buttonText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      blurRadius: 4.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
