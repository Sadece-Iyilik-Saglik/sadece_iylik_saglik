import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/app/color_strings.dart';

class CustomIndicator extends StatelessWidget {
  final PageController controller;
  final int dotsLength;
  final double? height;
  final double? width;
  const CustomIndicator({
    required this.controller,
    required this.dotsLength,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: dotsLength,
      onDotClicked: (index) {},
      effect: SlideEffect(
        dotColor: AppColor.kSecondary.withOpacity(0.3),
        activeDotColor: AppColor.kSecondary,
        dotHeight: height ?? 8,
        dotWidth: width ?? 8,
      ),
    );
  }
}
