import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class LoadingAnimation extends StatelessWidget {
  final Color? color;
  final double? size;

  const LoadingAnimation({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fallingDot(
      color: color ?? ColorConstant.instance.neutral9,
      size: size ?? 20,
    );
  }
}
