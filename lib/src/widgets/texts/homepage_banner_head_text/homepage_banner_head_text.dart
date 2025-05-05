import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class HomepageBannerHeadText extends StatelessWidget {
  final String text;
  const HomepageBannerHeadText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7.5)),
          color: ColorConstant.instance.neutral9.withOpacity(0.36),
        ),
        child: ContentText(
          text: text,
          fontSize: 10,
        ));
  }
}
