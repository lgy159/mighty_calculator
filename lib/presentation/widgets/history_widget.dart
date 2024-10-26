import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_calculator/presentation/model/history.dart';
import 'package:mighty_calculator/presentation/model/player.dart';

class HistoryWidget extends StatelessWidget {
  final History history;

  const HistoryWidget({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 32,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '${history.id}.',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          ...history.players.map(
                (player) => Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                child: Text(
                  '${player.score}',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
