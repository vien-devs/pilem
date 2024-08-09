import 'package:flutter/material.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/custom_shape_bubble.dart';
import 'package:readmore/readmore.dart';

class BubbleContainer extends StatelessWidget {
  const BubbleContainer({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPaint(painter: CustomShape(Colors.cyan[900]!)),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.cyan[900],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                topLeft: Radius.circular(0.5),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: ReadMoreText(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: MyDsColors.neutralTwo.withOpacity(0.7),
              ),
              trimLines: 3,
              trimMode: TrimMode.Line,
              trimCollapsedText: StringResource.labelReadMore,
              trimExpandedText: StringResource.labelReadLess,
              moreStyle: context.textTheme.bodySmall?.copyWith(
                color: MyDsColors.alert,
                fontWeight: FontWeight.w700,
              ),
              lessStyle: context.textTheme.bodySmall?.copyWith(
                color: MyDsColors.alert,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
