import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  final dynamic answer;
  final bool confirmed;
  final bool hasMultipleCorrectAnswers;
  final bool disabled;
  final bool buttonActive;
  final Function onClick;
  final Function sendIsSelected;
  const AnswerButton(
      this.answer,
      this.confirmed,
      this.hasMultipleCorrectAnswers,
      this.disabled,
      this.buttonActive,
      this.onClick,
      this.sendIsSelected,
      {Key? key})
      : super(key: key);

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  bool isClicked = false;
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.sendIsSelected(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.disabled) return;
        isClicked = true;
        isSelected = !isSelected;
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
                ? isClicked
                    ? widget.answer['isCorrectAnswer']
                        ? const Color(0xFF81FFC2)
                        : const Color(0xFFFF7888)
                    : widget.disabled
                        ? widget.answer['isCorrectAnswer']
                            ? const Color(0xFF81FFC2)
                            : const Color(0xFFF9F9FF)
                        : const Color(0xFFF9F9FF)
                : widget.confirmed
                    ? isSelected
                        ? const Color(0xFF81FFC2)
                        : const Color(0xFFFF7888)
                    : const Color(0xFFF9F9FF),
            border: widget.hasMultipleCorrectAnswers
                ? isClicked
                    ? isSelected
                        ? widget.buttonActive
                            ? Border.all(
                                width: 1, color: const Color(0xFF5547F0))
                            : null
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
