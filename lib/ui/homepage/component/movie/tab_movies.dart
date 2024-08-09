import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/ui/homepage/component/movie/movie_carousel.dart';
import 'package:pilem/ui/homepage/component/movie/popular_movies_component.dart';
import 'package:pilem/ui/homepage/component/movie/top_rated_movies_component.dart';
import 'package:pilem/ui/homepage/component/movie/upcoming_movies_component.dart';
import 'package:pilem/ui/homepage/provider/home_movies_provider.dart';
import 'package:provider/provider.dart';

class TabMovies extends StatelessWidget {
  const TabMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeMoviesProvider(),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 16.h),
        children: [
          const MovieCarousel(),
          SizedBox(height: 24.h),
          const PopularMoviesComponent(),
          SizedBox(height: 24.h),
          const TopRatedMoviesComponent(),
          SizedBox(height: 24.h),
          const UpcomingMoviesComponent(),
        ],
      ),
    );
  }
}
