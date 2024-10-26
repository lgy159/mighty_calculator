import 'package:flutter/material.dart';

import '../model/history.dart';
import '../model/player.dart';
import 'history_widget.dart';

class HistoryDialog extends StatelessWidget {
  final List<Player> players;
  final List<History> histories;

  const HistoryDialog({
    super.key,
    required this.players,
    required this.histories,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('History'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                  child: Text(
                    'No.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ...players.map(
                  (player) => Expanded(
                    child: Text(
                      player.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            ...histories.map((history) => HistoryWidget(history: history)),
          ],
        ),
      ),
    );
    ;
  }
}
