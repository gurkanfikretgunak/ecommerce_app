import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderIndicator extends StatefulWidget {
  final PageController pageController;
  final int count;
  final double? dotHeight;
  final double? dotWidth;
  final WormType? wormType;
  final Color? dotColor;
  final Color? activeDotColor;

  const SliderIndicator({
    super.key,
    required this.pageController,
    required this.count,
    this.dotHeight,
    this.dotWidth,
    this.wormType,
    this.dotColor,
    this.activeDotColor,
  });

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
        dotHeight: widget.dotHeight ?? 8,
        dotWidth: widget.dotWidth ?? 8,
        type: widget.wormType ?? WormType.thinUnderground,
        dotColor: widget.dotColor ?? ColorConstant.instance.neutral9,
        activeDotColor:
            widget.activeDotColor ?? ColorConstant.instance.primary_main,
      ),
    );
  }
}
