import 'package:flutter/material.dart';
import 'package:pilem/common/const/general_const.dart';

class MyImageNetwork extends StatelessWidget {
  const MyImageNetwork({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      GeneralConst.imageBaseURl + url,
      fit: BoxFit.cover,
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
    );
  }
}
