import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';

class ShimmerCast extends StatelessWidget {
  const ShimmerCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyShimmer.rectangular(
          width: 40.w,
          height: 20.h,
          radius: 6.r,
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => Column(
              children: [
                MyShimmer.circular(width: 90.r, height: 90.r),
                SizedBox(height: 12.h),
                MyShimmer.rectangular(
                  width: 100.w,
                  height: 15.h,
                  radius: 6.r,
                ),
                SizedBox(height: 2.h),
                MyShimmer.rectangular(
                  width: 70.w,
                  height: 15.h,
                  radius: 6.r,
                ),
              ],
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
          ),
        )
      ],
    );
  }
}
