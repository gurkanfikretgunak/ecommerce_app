import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderIndicator extends StatelessWidget {
  final PageController pageController;
  final int count;
  final Color activeColor;
  final Color inactiveColor;
  final double size;
  final double spacing;

  const SliderIndicator({
    super.key,
    required this.pageController,
    required this.count,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.white60,
    this.size = 8.0,
    this.spacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, _) {
        final double page =
            pageController.hasClients ? (pageController.page ?? 0) : 0;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ColorConstant.instance.neutral1.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              count,
              (index) {
                final double distance = (page - index).abs();

                final double scaleFactor =
                    1.0 - (distance * 0.3).clamp(0.0, 0.3);
                final double opacity = 1.0 - (distance * 0.6).clamp(0.0, 0.6);
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: spacing / 2),
                  height: size * scaleFactor,
                  width: size * scaleFactor,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == page.round()
                        ? activeColor
                        : inactiveColor.withOpacity(opacity),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
