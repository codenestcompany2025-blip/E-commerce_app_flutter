import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WhiteAuthContainer extends StatelessWidget {
  final Widget child;
  final double paddingTop;

  const WhiteAuthContainer({
    super.key,
    required this.child,
    required this.paddingTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, paddingTop, 24, 24),
      child: child,
    );
  }
}
