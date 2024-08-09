import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/common/app_bar.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/movie/provider/review_provider.dart';
import 'package:pilem/ui/movie/widget/item_review.dart';
import 'package:provider/provider.dart';

class MovieReviewPage extends StatelessWidget {
  const MovieReviewPage({
    super.key,
    required this.movieId,
  });

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewProvider(movieId),
      child: _ReviewMovieView(),
    );
  }
}

class _ReviewMovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ReviewProvider>();
    var reviews = provider.reviewsMovie;

    return Scaffold(
      appBar: popTextAppBar('Reviews (${reviews.length})', context),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : reviews.isEmpty
              ? const Center(child: Text('Reviews is Empty'))
              : Padding(
                  padding: EdgeInsets.all(10.r),
                  child: ListView.builder(
                    itemCount: reviews.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var author = reviews[index].authorDetails;
                      return ItemReview(
                        author: author,
                        contentReview: reviews[index].content,
                      );
                    },
                  ),
                ),
    );
  }
}
