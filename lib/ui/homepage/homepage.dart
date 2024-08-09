import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/search_routes.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/homepage/component/movie/tab_movies.dart';
import 'package:pilem/ui/homepage/component/series/tab_series.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> tabs = [
    const Tab(text: StringResource.labelMovies),
    const Tab(text: StringResource.labelSeries),
  ];

  TabBar get _newTabBar => TabBar(
        tabs: tabs,
        indicator: UnderlineTabIndicator(
          borderSide: const BorderSide(color: MyDsColors.white, width: 5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.symmetric(vertical: 5.h),
        labelColor: MyDsColors.white,
        unselectedLabelColor: MyDsColors.white,
        labelStyle: context.textTheme.titleMedium,
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: MyDsColors.forest,
        body: Stack(
          children: [
            const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                TabMovies(),
                TabSeries(),
              ],
            ),
            SafeArea(
              child: Container(
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                ),
                child: Column(
                  children: [
                    ColoredBox(
                      color: Colors.transparent,
                      child: _newTabBar,
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () => context.pushNamed(
                        SearchRoutes.toSearchPage.name!,
                      ),
                      child: Container(
                        height: 40.h,
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        padding: EdgeInsets.only(left: 12.w, right: 8.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20.r),
                          color: MyDsColors.fog.withOpacity(0.2),
                        ),
                        child: TextFormField(
                          enabled: false,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                              color: MyDsColors.white,
                            ),
                            hintText: 'Search',
                            hintStyle: context.textTheme.bodyLarge?.copyWith(
                              color: MyDsColors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
