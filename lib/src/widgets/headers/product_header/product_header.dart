import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductHeader extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<String> imagePaths;
  final Widget? iconRow;

  const ProductHeader({
    super.key,
    required this.imagePaths,
    this.onPressed,
    this.iconRow,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    PageController _pageController = PageController();

    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.3,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          top: screenHeight * 0.02,
          left: 5,
          right: 15,
          child: Row(
            children: [
              CustomAppbar(
                iconColor: ColorConstant.instance.neutral1,
                onPressed: onPressed,
              ),
              Expanded(child: SizedBox()),
              if (iconRow != null) iconRow!,
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: SliderIndicator(
            pageController: _pageController,
            count: imagePaths.length,
          ),
        ),
      ],
    );
  }
}
