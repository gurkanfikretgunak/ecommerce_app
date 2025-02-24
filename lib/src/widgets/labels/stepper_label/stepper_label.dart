import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class StepperLabel extends StatelessWidget {
  final int currentStep;
  final List<String>? steps;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double? lineHeight;

  const StepperLabel({
    Key? key,
    required this.currentStep,
    this.steps,
    this.activeColor,
    this.inactiveColor,
    this.borderColor,
    this.padding,
    this.lineHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSteps = ["Cart", "Checkout", "Delivery"];
    final stepsList = steps ?? defaultSteps;

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Row(
              children: List.generate(
                stepsList.length - 1,
                (index) => Expanded(
                  child: Container(
                    height: lineHeight ?? 1,
                    color: currentStep >= index + 1
                        ? activeColor ?? ColorConstant.instance.neutral1
                        : inactiveColor ?? ColorConstant.instance.neutral5,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              stepsList.length,
              (index) => StepperLabelRadius(
                text: stepsList[index],
                isActive: currentStep >= index,
                activeDotColor: activeColor,
                inactiveDotColor: inactiveColor,
                borderColor: borderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
