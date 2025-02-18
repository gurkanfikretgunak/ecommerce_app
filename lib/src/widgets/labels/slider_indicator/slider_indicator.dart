import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SliderIndicator extends StatefulWidget {
  final PageController pageController;
  final int count;

  const SliderIndicator(
      {super.key, required this.pageController, required this.count});

  @override
  State<SliderIndicator> createState() => _SliderIndicatorState();
}

class _SliderIndicatorState extends State<SliderIndicator> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: widget.pageController,
      count: widget.count,
      effect: WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        type: WormType.thinUnderground,
        dotColor: ColorConstant.instance.neutral9,
        activeDotColor: ColorConstant.instance.primary_main,
      ),
    );
  }
}
