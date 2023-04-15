import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class Failure extends StatefulWidget {
  final dynamic message;
  final int? height;
  const Failure(
    this.message, {
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  State<Failure> createState() => _FailureState();
}

class _FailureState extends State<Failure> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: widget.height?.toDouble() ?? 120,
        child: Center(
          child: Column(
            children: [
              widget.message is DioError
                  ? Icon(
                      Icons.signal_wifi_connected_no_internet_4_outlined,
                      color: const Color(0xFF28254A).withOpacity(0.2),
                      size: 40,
                    )
                  : Icon(
                      Icons.mood_bad,
                      color: const Color(0xFF28254A).withOpacity(0.2),
                      size: 130,
                    ),
              const SizedBox(
                height: 15,
              ),
              widget.message is DioError
                  ? Text(
                      "Отсутствует поключение\n к интернету",
                      style: failureMessageTextStyle,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Не удалось загрузить данные,\n попробуйте обновить страницу позже",
                      style: failureMessageTextStyle,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
