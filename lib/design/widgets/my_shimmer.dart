import 'package:flutter/material.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    required this.shapeBorder,
  });

  final double width;
  final double height;
  final double radius;
  final ShapeBorder shapeBorder;

  MyShimmer.rectangular({
    super.key,
    this.width = double.infinity,
    this.radius = 0,
    required this.height,
  }) : shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        );

  const MyShimmer.circular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.radius = 0,
  }) : shapeBorder = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyDsColors.granite,
      highlightColor: MyDsColors.white,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: MyDsColors.granite,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
