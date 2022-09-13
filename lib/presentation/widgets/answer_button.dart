import 'package:flutter/material.dart';
import 'package:history_kg/utils/styles.dart';

class AnswerButton extends StatefulWidget {
  final dynamic answer;
  final Function onSelected;
  final int index;
  final bool isSelected;
  final bool confirmed;
  final bool hasMultipleCorrectAnswers;
  final bool disabled;
  final bool buttonActive;
  final Function onClick;
  const AnswerButton(
      this.answer,
      this.onSelected,
      this.index,
      this.isSelected,
      this.confirmed,
      this.hasMultipleCorrectAnswers,
      this.disabled,
      this.buttonActive,
      this.onClick,
      {Key? key})
      : super(key: key);

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.disabled) return;

        widget.onSelected(widget.index);
        widget.onClick(widget.answer);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
          bottom: 20,
        ),
        child: Container(
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: !widget.hasMultipleCorrectAnswers
                ? widget.isSelected
                    ? widget.answer['isCorrectAnswer']
                        ? correctAnswerColor
                        : wrongAnswerColor
                    : widget.disabled
                        ? widget.answer['isCorrectAnswer']
                            ? correctAnswerColor
                            : primaryAnswerColor
                        : primaryAnswerColor
                : widget.confirmed
                    ? widget.isSelected
                        ? widget.answer['isCorrectAnswer']
                            ? correctAnswerColor
                            : wrongAnswerColor
                        : widget.answer['isCorrectAnswer']
                            ? correctUnselectedColor
                            : primaryAnswerColor
                    : primaryAnswerColor,
            border: widget.hasMultipleCorrectAnswers
                ? widget.isSelected
                    ? widget.buttonActive
                        ? Border.all(width: 1, color: const Color(0xFF5547F0))
                        : null
                    : null
                : null,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4644AA).withOpacity(0.1),
                offset: const Offset(8, 4),
                blurRadius: 24,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(
                  'assets/images/Select.png',
                  width: 25,
                  height: 25,
                ),
              ),
              Text(widget.answer['text'])
            ],
          ),
        ),
      ),
    );
  }
}
