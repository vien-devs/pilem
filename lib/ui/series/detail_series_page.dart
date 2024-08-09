import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/common/app_bar.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_image_network.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';
import 'package:pilem/ui/series/component/season_episodes_component.dart';
import 'package:pilem/ui/series/component/series_cast_component.dart';
import 'package:pilem/ui/series/component/series_info_component.dart';
import 'package:pilem/ui/series/component/recommendation_series_component.dart';
import 'package:pilem/ui/series/provider/series_provider.dart';
import 'package:provider/provider.dart';

class DetailSeriesPage extends StatelessWidget {
  const DetailSeriesPage({
    super.key,
    required this.seriesId,
  });
  final String seriesId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeriesProvider(seriesId),
      child: _DetailSeriesView(),
    );
  }
}

class _DetailSeriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SeriesProvider>();
    var seriesData = provider.detailSeries;

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
                      child:
                          MyImageNetwork(url: seriesData?.backdropPath ?? ''),
                    ),
              SafeArea(
                minimum: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    const SeriesInfoComponent(),
                    SizedBox(height: 16.h),
                    const SeasonEpisodesComponent(),
                    SizedBox(height: 20.h),
                    const SeriesCastComponent(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: const Divider(
                        thickness: 5,
                        color: MyDsColors.fog,
                      ),
                    ),
                    const RecommendationSeriesComponent(),
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
