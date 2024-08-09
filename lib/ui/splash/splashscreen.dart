import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/core/network/repository/core_http_repository.dart';
import 'package:pilem/core/routing/routes/homepage_routes.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/design/my_ds/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // late Image backgroundImage;
  late Image logoImage;
  final _coreHttpRepository = serviceLocator.get<CoreHttpRepository>();

  @override
  void initState() {
    super.initState();
    logoImage = Image.asset(
      'assets/images/img_splash_pilem.png',
      scale: 4,
    );
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await _coreHttpRepository.setToken(
            'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMGM4ZTZkOWQ1MjVjOTg3YTAwMTI3NjIyZ'
            'jVkZDUwYSIsInN1YiI6IjVlOGViZDY1ZmRjMTQ2MDAxODQ1MWYxNiIsInNjb3BlcyI'
            '6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fO9azplclsZXKtlqeT0WaeoO7Fary5'
            'EayR-mILwANFo');

        if (mounted) context.goNamed(HomepageRoutes.main.name!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: MyDsColors.white,
          ),
          Center(
            child: logoImage,
          ),
        ],
      ),
    );
  }
}
