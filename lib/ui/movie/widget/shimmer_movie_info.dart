import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';

class ShimmerMovieInfo extends StatelessWidget {
  const ShimmerMovieInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MyShimmer.rectangular(
              width: 130.w,
              height: 200.h,
              radius: 10.r,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyShimmer.rectangular(
                    width: 150.w,
                    height: 20.h,
                    radius: 6.r,
                  ),
                  SizedBox(height: 6.h),
                  MyShimmer.rectangular(
                    height: 20.h,
                    radius: 6.r,
                  ),
                  SizedBox(height: 6.h),
                  MyShimmer.rectangular(
                    width: 70.w,
                    height: 20.h,
                    radius: 6.r,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        MyShimmer.rectangular(
          height: 70.h,
          radius: 10.r,
        ),
        SizedBox(height: 12.h),
        MyShimmer.rectangular(
          height: 10.h,
        ),
        SizedBox(height: 12.h),
        MyShimmer.rectangular(
          height: 150.h,
          radius: 10.r,
        ),
      ],
    );
  }
}
