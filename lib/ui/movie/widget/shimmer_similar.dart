import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';

class ShimmerSimilar extends StatelessWidget {
  const ShimmerSimilar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyShimmer.rectangular(width: 100.w, height: 20.h, radius: 6.r),
        SizedBox(height: 8.h),
        MyShimmer.rectangular(height: 350.h, radius: 6.r),
      ],
    );
  }
}
