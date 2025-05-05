import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RangeSliderInput extends StatefulWidget {
  final double? min;
  final double? max;
  final RangeValues? initialRange;
  final Function(double)? onChanged;
  final double? trackHeight;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final Color? overlayColor;
  final Color? valueIndicatorColor;
  final TextStyle? valueIndicatorTextStyle;
  final double? thumbRadius;
  final double? overlayRadius;
  final ShowValueIndicator? showValueIndicator;

  const RangeSliderInput({
    super.key,
    this.min,
    this.max,
    this.initialRange,
    this.onChanged,
    this.trackHeight,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.overlayColor,
    this.valueIndicatorColor,
    this.valueIndicatorTextStyle,
    this.thumbRadius,
    this.overlayRadius,
    this.showValueIndicator,
  });

  @override
  State<RangeSliderInput> createState() => _RangeSliderInputState();
}

class _RangeSliderInputState extends State<RangeSliderInput> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = widget.initialRange ?? const RangeValues(0, 100);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: widget.trackHeight ?? 1,
            activeTrackColor:
                widget.activeTrackColor ?? ColorConstant.instance.neutral1,
            inactiveTrackColor:
                widget.inactiveTrackColor ?? ColorConstant.instance.neutral5,
            thumbColor: widget.thumbColor ?? ColorConstant.instance.neutral1,
            overlayColor: widget.overlayColor ?? Colors.blue.withOpacity(0.1),
            valueIndicatorColor: widget.valueIndicatorColor ?? Colors.black,
            valueIndicatorTextStyle: widget.valueIndicatorTextStyle ??
                const TextStyle(
                  color: Colors.white,
                ),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: widget.thumbRadius ?? 12,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: widget.overlayRadius ?? 20,
            ),
            showValueIndicator:
                widget.showValueIndicator ?? ShowValueIndicator.always,
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            min: widget.min ?? 0,
            max: widget.max ?? 100,
            labels: RangeLabels(
              '\$ ${_currentRangeValues.start.round()}',
              '\$ ${_currentRangeValues.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues =
                    RangeValues(_currentRangeValues.start, values.end);
              });
              if (widget.onChanged != null) {
                widget.onChanged!(values.end.round().toDouble());
              }
            },
          ),
        ),
      ],
    );
  }
}
