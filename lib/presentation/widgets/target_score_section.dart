import 'package:flutter/material.dart';

class TargetScoreSection extends StatelessWidget {
  final int targetScore;
  final Function(int) onTargetScoreChange;

  const TargetScoreSection({
    super.key,
    required this.targetScore,
    required this.onTargetScoreChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('목표 점수', style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 8),
        Row(
          children: [
            for (int i = 13; i <= 20; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () => onTargetScoreChange(i),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: targetScore == i ? Colors.blue : Colors.white,
                    ),
                    child: Text(
                      i.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: targetScore == i ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 16),
        Text('현재의 목표 점수: $targetScore'),
      ],
    );
  }
}
