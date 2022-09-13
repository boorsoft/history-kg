import 'package:flutter/material.dart';
import 'package:history_kg/screens/paragraph_screen.dart';

class ParagraphImageButton extends StatelessWidget {
  final int id;
  final String? _buttonText;
  final String? imagePath;

  const ParagraphImageButton(this._buttonText, this.id,
      {Key? key, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ParagraphScreen(_buttonText!, id)));
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image(
                image: Image.network(
                  imagePath!,
                ).image,
                width: 373,
                height: 115,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: -2.5,
              child: Container(
                width: 225,
                height: 36,
                alignment: Alignment.centerLeft,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(
                    _buttonText!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFF9F9FF),
                      fontSize: 14,
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
