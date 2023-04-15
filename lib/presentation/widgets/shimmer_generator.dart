import 'package:flutter/material.dart';
import 'package:history_kg/presentation/widgets/shimmer_element.dart';

class ShimmerGenerator extends StatelessWidget {
  final int count;
  final Axis? axisDirection;
  final double? height;
  final double? width;
  final double? borderRadius;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? listPadding;
  const ShimmerGenerator({
    Key? key,
    required this.count,
    this.axisDirection = Axis.vertical,
    this.physics,
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
    this.margin,
    this.listPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (axisDirection == Axis.vertical) {
      return Padding(
        padding: margin ?? const EdgeInsets.all(0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: physics,
          child: Padding(
            padding: listPadding ?? const EdgeInsets.all(0),
            child: Column(
              children: List.generate(
                  count,
                  (index) => Padding(
                        padding: padding ?? const EdgeInsets.only(bottom: 16),
                        child: ShimmerElement(
                          height: height ?? 64,
                          width:
                              width ?? MediaQuery.of(context).size.width - 32,
                          radius: BorderRadius.circular(borderRadius ?? 12),
                        ),
                      )),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: margin ?? const EdgeInsets.all(0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: listPadding ?? const EdgeInsets.only(),
            child: Row(
              children: List.generate(
                  count,
                  (index) => Padding(
                        padding: padding ?? const EdgeInsets.only(bottom: 16),
                        child: ShimmerElement(
                          height: height ?? 64,
                          width:
                              width ?? MediaQuery.of(context).size.width - 32,
                          radius: BorderRadius.circular(borderRadius ?? 12),
                        ),
                      )),
            ),
          ),
        ),
      );
    }
  }
}
