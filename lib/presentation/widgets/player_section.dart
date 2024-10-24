import 'package:flutter/material.dart';

class PlayerSection extends StatelessWidget {
  final List<String> players;

  const PlayerSection({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Player', style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: players.map((player) => Text(player)).toList(),
        ),
      ],
    );
  }
}