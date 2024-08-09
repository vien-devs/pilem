import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/common/app_bar.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/person/component/credits_movie_component.dart';
import 'package:pilem/ui/person/provider/person_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class DetailPersonPage extends StatelessWidget {
  const DetailPersonPage({
    super.key,
    required this.personId,
  });

  final String personId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonProvider(personId),
      child: _DetailPersonView(),
    );
  }
}

class _DetailPersonView extends StatelessWidget {
  Column personInfo(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            fontSize: 10.sp,
            color: MyDsColors.pine,
          ),
        ),
        Text(
          value,
          style: context.textTheme.labelMedium?.copyWith(
            color: MyDsColors.fog,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<PersonProvider>();
    var person = provider.personDetail;

    return Scaffold(
      backgroundColor: MyDsColors.forest,
      appBar: popTextAppBar(
        '',
        context,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130.w,
                  height: 200.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      GeneralConst.imageBaseURl + (person?.profilePath ?? ''),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          GeneralConst.noImageErrorPlaceholder,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Text(
                        person?.name ?? '',
                        style: context.textTheme.titleLarge?.copyWith(
                          color: MyDsColors.fog,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 120.h,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: MyDsColors.evergreen.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Expanded(
                          child: GridView.count(
                            childAspectRatio: 4 / 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.r,
                            children: [
                              personInfo(
                                context,
                                'Gender',
                                provider.getGender(person?.gender ?? 0),
                              ),
                              personInfo(
                                context,
                                'Date of Birth',
                                person?.birthday ?? 'Unknown',
                              ),
                              personInfo(
                                context,
                                'Place of Birth',
                                person?.placeOfBirth ?? 'Unknown',
                              ),
                              personInfo(
                                context,
                                'Known For',
                                person?.knownForDepartment ?? 'Unknown',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: MyDsColors.evergreen.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Also Known As',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MyDsColors.pine,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    person?.alsoKnownAs.map((e) => e).join(', ') ?? 'Unknown',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MyDsColors.fog,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: MyDsColors.evergreen.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biography',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MyDsColors.pine,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ReadMoreText(
                    person?.biography ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MyDsColors.fog,
                    ),
                    textAlign: TextAlign.justify,
                    trimLines: 5,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: StringResource.labelReadMore,
                    trimExpandedText: StringResource.labelReadLess,
                    moreStyle: context.textTheme.bodyMedium?.copyWith(
                      color: MyDsColors.alert,
                      fontWeight: FontWeight.bold,
                    ),
                    lessStyle: context.textTheme.bodyMedium?.copyWith(
                      color: MyDsColors.alert,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const CreditsMovieComponent(),
          ],
        ),
      ),
    );
  }
}
