import 'package:flutter/material.dart';
import 'package:shopapp_widgets/src/widgets/texts/section_text/section_text.dart';

class SectionLayout extends StatelessWidget {
  final String sectionText;
  final Widget layout;

  const SectionLayout(
      {super.key, required this.sectionText, required this.layout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SectionText(text: sectionText),
          ],
        ),
        layout,
      ],
    );
  }
}
