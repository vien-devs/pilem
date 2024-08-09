import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/search/provider/search_provider.dart';
import 'package:pilem/ui/search/widgets/filter_search_view.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final searchController = TextEditingController();
  var groupValue = 'movie';
  var visibleClearIcon = false;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SearchProvider>();

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.r),
              color: MyDsColors.fog.withOpacity(0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                      controller: searchController,
                      cursorColor: MyDsColors.neutralOne,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: MyDsColors.white,
                        ),
                        hintText: 'Search...',
                        hintStyle: context.textTheme.bodyLarge?.copyWith(
                          color: MyDsColors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: MyDsColors.white,
                      ),
                      onChanged: (value) => setState(
                            () {
                              visibleClearIcon =
                                  searchController.text.isNotEmpty
                                      ? true
                                      : false;
                            },
                          ),
                      onEditingComplete: () {
                        provider.searchMovie(searchController.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                      }),
                ),
                SizedBox(width: 8.w),
                Visibility(
                  visible: visibleClearIcon,
                  child: IconButton(
                    onPressed: () => setState(() {
                      searchController.clear();
                      visibleClearIcon = false;
                      provider.clearListResult();
                    }),
                    splashRadius: 15.r,
                    icon: const Icon(
                      Icons.clear,
                      color: MyDsColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 6.w),
        InkWell(
          onTap: () => showBottomDialog(context, provider),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: MyDsColors.fog,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.tune_rounded,
                  color: MyDsColors.forest,
                  size: 20,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Filter',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MyDsColors.forest,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Future showBottomDialog(
    BuildContext context,
    SearchProvider provider,
  ) {
    return showModalBottomSheet<String>(
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
              return FilterSearchView(
                filterSearch: provider.filterSearch,
                selectedItem: provider.searchType,
              );
            })
        .then((value) => provider.setSearchType(value ?? provider.searchType));
  }
}
