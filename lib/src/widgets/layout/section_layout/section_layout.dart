import 'package:flutter/material.dart';
import 'package:shopapp_widgets/src/widgets/texts/section_text/section_text.dart';

class SectionLayout extends StatelessWidget {
  final String sectionText;
  final Widget layout;
  final Widget? rightWidget;

  const SectionLayout(
      {super.key,
      required this.sectionText,
      required this.layout,
      this.rightWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionText(text: sectionText),
              if (rightWidget != null) rightWidget!,
            ],
          ),
          layout,
        ],
      ),
    );
  }
}
