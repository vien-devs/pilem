import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';

class ShimmerDetailPage extends StatelessWidget {
  const ShimmerDetailPage({Key? key}) : super(key: key);

  Widget rectangularWithRadius(double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: MyShimmer.rectangular(
        width: width,
        height: height,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        MyShimmer.rectangular(height: 250.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rectangularWithRadius(200.w, 20.h),
                  rectangularWithRadius(70.w, 20.h),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  rectangularWithRadius(70.w, 20.h),
                  SizedBox(width: 12.w),
                  rectangularWithRadius(70.w, 20.h),
                  SizedBox(width: 12.w),
                  rectangularWithRadius(70.w, 20.h),
                ],
              ),
              SizedBox(height: 12.h),
              rectangularWithRadius(double.infinity, 100.h),
              SizedBox(height: 12.h),
              rectangularWithRadius(50.w, 20.h),
              SizedBox(height: 12.h),
              // SizedBox(
              //   height: 200.h,
              //   child: provider.isLoading
              //       ? const Center(child: CircularProgressIndicator())
              //       : ListView.separated(
              //           shrinkWrap: true,
              //           scrollDirection: Axis.horizontal,
              //           physics: const BouncingScrollPhysics(),
              //           itemCount: castList.length,
              //           itemBuilder: (context, index) => ItemCast(
              //             movieCast: castList[index],
              //           ),
              //           separatorBuilder: (context, index) => SizedBox(
              //             width: 10.w,
              //           ),
              //         ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
