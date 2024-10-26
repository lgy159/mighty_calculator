import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class PatternWidget extends StatelessWidget {
  final String pattern;
  final int index;
  final void Function() onTap;
  final bool isSelected;

  const PatternWidget({
    super.key,
    required this.pattern,
    required this.onTap,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.35),
          color: isSelected ? ColorStyles.selectBlue : Colors.white, // 여기에 color 이동
        ),
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Text(pattern, style: const TextStyle(fontSize: 40)),
      ),
    );
  }
}
