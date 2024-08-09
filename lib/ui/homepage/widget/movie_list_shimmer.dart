import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';

class MovieListShimmer extends StatelessWidget {
  const MovieListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyShimmer.rectangular(width: 100.w, height: 20.h, radius: 6.r),
              MyShimmer.rectangular(width: 70.w, height: 20.h, radius: 6.r),
            ],
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 200.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8.w);
              },
              itemBuilder: (context, index) {
                return MyShimmer.rectangular(
                  width: 130.w,
                  height: 200.h,
                  radius: 6.r,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
