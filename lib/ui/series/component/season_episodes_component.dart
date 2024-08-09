import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/series/provider/series_provider.dart';
import 'package:pilem/ui/series/widgets/item_episodes.dart';
import 'package:pilem/ui/series/widgets/list_seasons_view.dart';
import 'package:provider/provider.dart';

class SeasonEpisodesComponent extends StatefulWidget {
  const SeasonEpisodesComponent({Key? key}) : super(key: key);

  @override
  State<SeasonEpisodesComponent> createState() =>
      _SeasonEpisodesComponentState();
}

class _SeasonEpisodesComponentState extends State<SeasonEpisodesComponent> {
  var selectedSeason = 1;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SeriesProvider>();
    var series = provider.detailSeries;
    var season = provider.seasonDetail;

    return Column(
      children: [
        InkWell(
          onTap: () => showSeasonListDialog(
            context,
            series?.numberOfSeasons ?? 0,
            provider,
          ),
          borderRadius: BorderRadius.circular(16.r),
          child: Row(
            children: [
              Text(
                'Season $selectedSeason',
                style: context.textTheme.titleMedium?.copyWith(
                  color: MyDsColors.fog,
                ),
              ),
              SizedBox(width: 6.w),
              const Icon(
                Icons.expand_more,
                size: 25,
                color: MyDsColors.fog,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 300.h,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: season?.episodes.length ?? 0,
            separatorBuilder: (context, index) => const Divider(
              color: MyDsColors.white,
              thickness: 1.5,
            ),
            itemBuilder: (context, index) {
              return ItemEpisodes(episode: season!.episodes[index]);
            },
          ),
        ),
      ],
    );
  }

  Future showSeasonListDialog(
    BuildContext context,
    int totalSeason,
    SeriesProvider provider,
  ) {
    return showModalBottomSheet<int>(
      context: context,
      useRootNavigator: true,
      backgroundColor: MyDsColors.forest,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      builder: (BuildContext context) {
        return ListSeasonView(
          itemCount: totalSeason,
          selectedItem: selectedSeason,
        );
      },
    ).then(
      (value) => setState(
        () {
          selectedSeason = value ?? selectedSeason;
          if (value != null) {
            provider.getSeasonDetail(
                provider.idSeries, selectedSeason.toString());
          }
        },
      ),
    );
  }
}
