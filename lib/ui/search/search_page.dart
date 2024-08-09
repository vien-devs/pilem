import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/custom_search_bar.dart';
import 'package:pilem/design/widgets/data_list_empty.dart';
import 'package:pilem/ui/search/provider/search_provider.dart';
import 'package:pilem/ui/search/widgets/item_search_result.dart';
import 'package:pilem/ui/search/widgets/shimmer_search.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  var isSearchBarVisible = true;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SearchProvider>();
    var data = provider.resultsSearch;

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: MyDsColors.forest,
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.chevron_left,
                  size: 40.r,
                  color: MyDsColors.white,
                ),
              ),
              title: const CustomSearchBar(),
              backgroundColor: Colors.transparent,
              leadingWidth: 30.w,
            ),
          ],
          body: provider.isLoading
              ? const ShimmerSearch()
              : data.isEmpty
                  ? const DataListEmpty()
                  : Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: NotificationListener<UserScrollNotification>(
                        onNotification: (notification) {
                          if (notification.direction ==
                              ScrollDirection.forward) {
                            if (!isSearchBarVisible) {
                              setState(() => isSearchBarVisible = true);
                            }
                          } else if (notification.direction ==
                              ScrollDirection.reverse) {
                            if (isSearchBarVisible) {
                              setState(() => isSearchBarVisible = false);
                            }
                          }
                          return true;
                        },
                        child: ListView.separated(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ItemSearchResult(
                              dataSearch: data[index],
                              searchType: provider.searchType,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: const Divider(
                                thickness: 2,
                                color: MyDsColors.fog,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
