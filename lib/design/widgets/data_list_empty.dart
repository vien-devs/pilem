import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';

class DataListEmpty extends StatelessWidget {
  const DataListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/img_dunno.png',
          scale: 25,
        ),
        SizedBox(height: 12.h),
        Text(
          'No Movies Found',
          style: context.textTheme.titleMedium?.copyWith(
            color: MyDsColors.primaryBase,
          ),
        )
      ],
    );
  }
}
