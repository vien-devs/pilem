import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';

class ShimmerItemSearch extends StatelessWidget {
  const ShimmerItemSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyShimmer.rectangular(
          width: 70.w,
          height: 100.h,
          radius: 6.r,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyShimmer.rectangular(height: 20.h, radius: 6.r),
              SizedBox(height: 8.h),
              Row(
                children: [
                  MyShimmer.rectangular(
                    width: 50.w,
                    height: 20.h,
                    radius: 6.r,
                  ),
                  SizedBox(width: 12.w),
                  MyShimmer.rectangular(
                    width: 50.w,
                    height: 20.h,
                    radius: 6.r,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
