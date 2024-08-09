import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';
import 'package:pilem/ui/homepage/provider/home_movies_provider.dart';
import 'package:provider/provider.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({Key? key}) : super(key: key);

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeMoviesProvider>();

    return provider.isLoading
        ? MyShimmer.rectangular(height: 410.h, radius: 20.r)
        : CarouselSlider(
            controller: _controller,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              aspectRatio: 1,
              viewportFraction: 1,
            ),
            items: provider.nowPlayingList
                .map(
                  (movies) => GestureDetector(
                    onTap: () => context.pushNamed(
                      MoviesRoutes.toDetailsMovie.name!,
                      extra: {
                        StringResource.keyMovieId: movies.id.toString(),
                      },
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          GeneralConst.imageBaseURl + (movies.posterPath ?? ''),
                          fit: BoxFit.fitWidth,
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
                  ),
                )
                .toList(),
          );
  }
}
