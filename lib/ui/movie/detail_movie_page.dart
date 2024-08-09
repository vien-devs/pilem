import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/common/app_bar.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_image_network.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';
import 'package:pilem/ui/movie/component/movie_cast_component.dart';
import 'package:pilem/ui/movie/component/movie_info_component.dart';
import 'package:pilem/ui/movie/component/similar_movies_component.dart';
import 'package:pilem/ui/movie/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({
    super.key,
    required this.movieId,
  });

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(movieId),
      child: _DetailMovieView(),
    );
  }
}

class _DetailMovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MovieProvider>();
    var movieData = provider.movieDetail;

    return Scaffold(
      backgroundColor: MyDsColors.forest,
      appBar: popTextAppBar(
        '',
        context,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              provider.isLoading
                  ? MyShimmer.rectangular(height: 250.h)
                  : SizedBox(
                      width: double.infinity,
                      height: 220.h,
                      child: MyImageNetwork(url: movieData?.backdropPath ?? ''),
                    ),
              SafeArea(
                minimum: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    const MovieInfoComponent(),
                    SizedBox(height: 16.h),
                    const MovieCastComponent(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: const Divider(
                        thickness: 5,
                        color: MyDsColors.fog,
                      ),
                    ),
                    const SimilarMoviesComponent(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
