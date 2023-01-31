import 'package:flutter/material.dart';

class FullogoImage extends StatelessWidget {
  final double height;
  final double width;
  const FullogoImage({super.key, this.height = 100, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/LogoMainPage.png',
      height: height,
      width: width,
    );
  }
}
