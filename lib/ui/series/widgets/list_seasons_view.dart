import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_button.dart';

class ListSeasonView extends StatelessWidget {
  const ListSeasonView({
    super.key,
    required this.itemCount,
    required this.selectedItem,
  });

  final int itemCount;
  final int selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Season',
            style: context.textTheme.titleMedium?.copyWith(
              color: MyDsColors.fog,
            ),
          ),
          Divider(
            thickness: 1.5,
            color: MyDsColors.granite.withOpacity(0.5),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 200.h,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: itemCount,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                var selected = index + 1 == selectedItem;
                return Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: selected
                        ? MyDsColors.granite.withOpacity(0.4)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: InkWell(
                    onTap: () => context.pop(index + 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Season ${index + 1}',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: MyDsColors.fog,
                          ),
                        ),
                        Visibility(
                          visible: selected ? true : false,
                          child: const Icon(
                            Icons.check,
                            color: MyDsColors.fog,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: MyButton(
              variant: ButtonVariant.primary,
              child: Text(
                'Cancel',
                style: context.textTheme.titleSmall
                    ?.copyWith(color: MyDsColors.white),
              ),
              onPressed: () => context.pop(),
            ),
          ),
        ],
      ),
    );
  }
}
