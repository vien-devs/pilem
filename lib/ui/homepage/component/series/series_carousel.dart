import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/series_routes.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';
import 'package:pilem/ui/homepage/provider/home_series_provider.dart';
import 'package:provider/provider.dart';

class SeriesCarousel extends StatefulWidget {
  const SeriesCarousel({Key? key}) : super(key: key);

  @override
  State<SeriesCarousel> createState() => _SeriesCarouselState();
}

class _SeriesCarouselState extends State<SeriesCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeSeriesProvider>();
    return Stack(
      children: [
        provider.isLoading
            ? MyShimmer.rectangular(height: 410.h, radius: 20.r)
            : CarouselSlider(
                controller: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  aspectRatio: 1,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => setState(() {
                    // _currentIndex = index;
                  }),
                ),
                items: provider.nowAiringList
                    .map(
                      (series) => GestureDetector(
                        onTap: () {
                          context.pushNamed(SeriesRoutes.toDetailsSeries.name!,
                              extra: {
                                StringResource.keySeriesId: series.id.toString()
                              });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              GeneralConst.imageBaseURl +
                                  (series.posterPath ?? ''),
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
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
                      ),
                    )
                    .toList(),
              ),
        Padding(
          padding: EdgeInsets.only(left: 8.w, top: 8.h),
          child: Text(
            StringResource.labelAiringNow,
            style: context.textTheme.bodyMedium?.copyWith(
              color: MyDsColors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.combine([
                TextDecoration.overline,
                TextDecoration.underline,
              ]),
            ),
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   right: 10,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: listMovie.asMap().entries.map(
        //       (entries) {
        //         var selectedIndex = _currentIndex == entries.key;
        //         return GestureDetector(
        //           child: Container(
        //             width: selectedIndex ? 6.r : 4.r,
        //             height: selectedIndex ? 6.r : 4.r,
        //             margin: EdgeInsets.symmetric(
        //               horizontal: 4.w,
        //               vertical: 8.h,
        //             ),
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: (context.theme.brightness == Brightness.dark
        //                       ? MyDsColors.white
        //                       : MyDsColors.granite)
        //                   .withOpacity(
        //                 selectedIndex ? 1.0 : 0.5,
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //     ).toList(),
        //   ),
        // ),
      ],
    );
  }
}
