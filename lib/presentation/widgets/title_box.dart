import 'package:flutter/material.dart';
import 'package:mighty_calculator/ui/color_styles.dart';

class TitleBox extends StatelessWidget {
  final String title;

  const TitleBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      color: ColorStyles.primary80,
      child: Center(
          child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      )),
    );
    ;
  }
}
