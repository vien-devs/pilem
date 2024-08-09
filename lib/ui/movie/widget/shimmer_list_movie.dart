import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';

class ShimmerListMovie extends StatelessWidget {
  const ShimmerListMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 8.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4 / 8,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 8.h,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            MyShimmer.rectangular(
              height: 200.h,
              width: 150.w,
              radius: 6.r,
            ),
            SizedBox(height: 8.h),
            MyShimmer.rectangular(
              height: 30.h,
              radius: 6.r,
            ),
          ],
        );
      },
    );
  }
}
