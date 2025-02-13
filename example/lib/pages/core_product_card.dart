import 'package:example/widgets/core_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CoreProductPage extends StatelessWidget {
  const CoreProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CorePageView(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const SingleChildScrollView(
              child: Column(
            children: [
              HorizontalProductCard(
                textColor: Colors.white,
                backgroundColor: Colors.orange,
                title: 'Core Product Hello',
              )
            ],
          )),
        ),
        title: 'Core Product Card');
  }
}
