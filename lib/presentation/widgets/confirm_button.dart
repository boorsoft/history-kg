import 'package:flutter/material.dart';
import 'package:history_kg/presentation/utils/styles.dart';

class ConfirmButton extends StatelessWidget {
  final String text;
  final Function onClick;
  const ConfirmButton(this.text, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          alignment: Alignment.center,
          width: 190,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: accentColor,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
