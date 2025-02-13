import 'package:flutter/material.dart';

class OrangeAppbar extends StatelessWidget {
  final double? height; 
  const OrangeAppbar({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:  height ?? 100,
      color: Colors.orange,
      child: const Center(
        child: Text(
          'Example AppBars',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
