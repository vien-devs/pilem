import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    super.key,
    this.label = '',
    this.child,
    this.bgColor,
  });

  final String label;
  final Widget? child;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: bgColor ?? MyDsColors.neutralFive.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      // child: child,
      child: child ??
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: MyDsColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }
}
