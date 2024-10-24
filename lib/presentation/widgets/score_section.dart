import 'package:flutter/material.dart';

class ScoreSection extends StatelessWidget {
  final Map<String, int> scores;
  final Function(String, int) onScoreChange;
  final Map<String, String> friends;
  final Function(String, String) onFriendChange;

  const ScoreSection({
    Key? key,
    required this.scores,
    required this.onScoreChange,
    required this.friends,
    required this.onFriendChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('문양 및 프렌즈 설정', style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: Text('주공')),
            Expanded(child: Text('프렌즈')),
          ],
        ),
        ...scores.keys.map((player) => Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: player,
                items: scores.keys.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    onScoreChange(player, scores[newValue]!);
                  }
                },
              ),
            ),
            Expanded(
              child: DropdownButton<String>(
                value: friends[player],
                items: scores.keys.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    onFriendChange(player, newValue);
                  }
                },
              ),
            ),
          ],
        )).toList(),
      ],
    );
  }
}