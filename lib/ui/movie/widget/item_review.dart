import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/data/movie/author_details.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:readmore/readmore.dart';

class ItemReview extends StatelessWidget {
  const ItemReview({
    super.key,
    required this.author,
    required this.contentReview,
  });

  final AuthorDetails author;
  final String contentReview;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: MyDsColors.granite,
                  foregroundImage: NetworkImage(
                    GeneralConst.imageBaseURl + (author.avatarPath ?? ''),
                  ),
                  backgroundImage: const AssetImage(
                      'assets/images/img_profile_placeholder.png'),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author.username,
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        author.name,
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: MyDsColors.warning,
                  size: 20.r,
                ),
                SizedBox(width: 6.w),
                Text('${author.rating ?? '-'}/10'),
              ],
            ),
            SizedBox(height: 8.h),
            ReadMoreText(
              contentReview,
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
          ],
        ),
      ),
    );
  }
}
