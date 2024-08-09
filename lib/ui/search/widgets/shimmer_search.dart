import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/ui/search/widgets/shimmer_item_search.dart';

class ShimmerSearch extends StatelessWidget {
  const ShimmerSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        child: ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ShimmerItemSearch();
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 12.h);
          },
        ));
  }
}
