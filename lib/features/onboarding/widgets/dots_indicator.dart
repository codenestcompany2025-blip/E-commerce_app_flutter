import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const DotsIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primary
                : AppColors.primaryLight,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
