import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class GoalScoreWidget extends StatelessWidget {
  final int goalScoreIdx;
  final void Function(int idx) onTap;

  const GoalScoreWidget({
    super.key,
    required this.goalScoreIdx,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        8,
        (index) {
          return Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                onTap: () {
                  onTap(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.35),
                    color: (goalScoreIdx == index) ? ColorStyles.selectBlue : Colors.white,
                  ),
                  child: Center(child: Text('${13 + index}')),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
