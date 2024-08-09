import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/ui/homepage/component/series/popular_series_component.dart';
import 'package:pilem/ui/homepage/component/series/series_carousel.dart';
import 'package:pilem/ui/homepage/component/series/top_rated_series_component.dart';
import 'package:pilem/ui/homepage/provider/home_series_provider.dart';
import 'package:provider/provider.dart';

class TabSeries extends StatelessWidget {
  const TabSeries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeSeriesProvider(),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 16.h),
        children: [
          const SeriesCarousel(),
          SizedBox(height: 24.h),
          const PopularSeriesComponent(),
          SizedBox(height: 24.h),
          const TopRatedSeriesComponent(),
        ],
      ),
    );
  }
}
