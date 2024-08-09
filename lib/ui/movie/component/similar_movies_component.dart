import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/movie/provider/movie_provider.dart';
import 'package:pilem/ui/movie/widget/item_similar_movies.dart';
import 'package:pilem/ui/movie/widget/shimmer_similar.dart';
import 'package:provider/provider.dart';

class SimilarMoviesComponent extends StatelessWidget {
  const SimilarMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MovieProvider>();
    var similarMovies = provider.similarMovies;

    return provider.isLoading
        ? const ShimmerSimilar()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringResource.labelSimilarMovie,
                style: context.textTheme.titleMedium?.copyWith(
                  color: MyDsColors.white,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 350.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemSimilarMovies(
                      similarMovie: similarMovies[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: similarMovies.length,
                ),
              ),
            ],
          );
  }
}
