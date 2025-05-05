import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class TimerLabel extends StatefulWidget {
  const TimerLabel({super.key});

  @override
  State<TimerLabel> createState() => _TimerLabelState();
}

class _TimerLabelState extends State<TimerLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TimerLabelBox(),
        context.emptySizedWidthBoxLow,
        const Text(":"),
        context.emptySizedWidthBoxLow,
        const TimerLabelBox(),
        context.emptySizedWidthBoxLow,
        const Text(":"),
        context.emptySizedWidthBoxLow,
        const TimerLabelBox(),
      ],
    );
  }
}
