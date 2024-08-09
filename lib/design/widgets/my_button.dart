import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/design/my_ds/colors.dart';

/// General button component
class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onPressed,
    this.enabled = true,
    this.flat = false,
    required this.variant,
    required this.child,
  });

  /// Button callback
  final VoidCallback? onPressed;

  /// Button variant
  final ButtonVariant variant;

  /// Is button enabled
  final bool enabled;

  /// Is flat type
  ///
  /// Only [ButtonVariant.primary] for now
  final bool flat;

  /// Button child
  final Widget child;

  Widget _buildPrimary(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: flat
          ? ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              backgroundColor: MyDsColors.fog.withOpacity(0.7),
            )
          : ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              backgroundColor: MyDsColors.granite.withOpacity(0.4),
            ),
      child: child,
    );
  }

  Widget _buildSecondary(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      child: child,
    );
  }

  Widget _buildTertiary(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: MyDsColors.neutral200,
          width: 2.w,
        ),
      ),
      child: child,
    );
  }

  Widget _buildText(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return _buildPrimary(context);
      case ButtonVariant.secondary:
        return _buildSecondary(context);
      case ButtonVariant.tertiary:
        return _buildTertiary(context);
      case ButtonVariant.text:
        return _buildText(context);
    }
  }
}

enum ButtonVariant {
  primary,
  secondary,
  tertiary,
  text,
}
