import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/homepage/homepage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _currentPage = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          Homepage(),
          Center(
            child: Text('Not Decided Yet'),
          ),
          Center(
            child: Text('Halaman Profil'),
          ),
        ],
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: StringResource.labelHomepage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: StringResource.labelSearch,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: StringResource.labelProfile,
          ),
        ],
        backgroundColor: MyDsColors.forest.withOpacity(0.9),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: context.textTheme.titleSmall?.copyWith(
          fontSize: 12.sp,
        ),
        elevation: 10,
        selectedItemColor: MyDsColors.white,
        unselectedLabelStyle: context.textTheme.labelSmall,
        unselectedItemColor: MyDsColors.pine,
        showUnselectedLabels: false,
        currentIndex: _currentPage,
        onTap: _onTapNavbar,
      ),
    );
  }

  void _onTapNavbar(int index) {
    setState(() {
      _currentPage = index;
      _pageController!.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
