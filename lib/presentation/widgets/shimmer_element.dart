import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerElement extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius radius;

  const ShimmerElement(
      {Key? key,
      required this.width,
      required this.height,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 238, 237, 237),
        highlightColor: const Color(0xffE4E6EA), // Colors.white,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: radius,
              color: const Color.fromARGB(
                  255, 238, 237, 237)), // Color(0xffE4E6EA)),
          width: width,
          height: height,
        ));
  }
}
