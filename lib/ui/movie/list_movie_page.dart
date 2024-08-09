import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/common/app_bar.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/movie/provider/list_movie_provider.dart';
import 'package:pilem/ui/movie/widget/item_list_movie.dart';
import 'package:pilem/ui/movie/widget/shimmer_list_movie.dart';
import 'package:provider/provider.dart';

class ListMoviePage extends StatelessWidget {
  const ListMoviePage({
    Key? key,
    required this.listType,
  }) : super(key: key);

  final String listType;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListMovieProvider(listType),
      child: _ListMovieView(),
    );
  }
}

class _ListMovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ListMovieProvider>();

    return Scaffold(
      backgroundColor: MyDsColors.forest,
      appBar: popTextAppBar(
        provider.getAppbarTitle(),
        context,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: provider.isLoading
            ? const ShimmerListMovie()
            : GridView.builder(
                itemCount: provider.loadData().length,
                padding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 8.w,
                ),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 4 / 9,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 8.h,
                ),
                itemBuilder: (context, index) {
                  return ItemListMovie(
                    dataMovie: provider.loadData()[index],
                  );
                },
              ),
      ),
    );
  }
}
