import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/homepage/widget/item_movie_widget.dart';
import 'package:pilem/ui/person/provider/person_provider.dart';
import 'package:provider/provider.dart';

class CreditsMovieComponent extends StatelessWidget {
  const CreditsMovieComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<PersonProvider>();
    var dataCredits = provider.personMovieCredits?.cast ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Known For',
          style: context.textTheme.titleMedium?.copyWith(
            color: MyDsColors.fog,
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 200.h,
          child: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ItemMovieWidget(
                    imageUrl: dataCredits[index].posterPath ?? '',
                    movieId: dataCredits[index].id.toString(),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 8.w),
                  itemCount: dataCredits.length,
                ),
        ),
      ],
    );
  }
}
