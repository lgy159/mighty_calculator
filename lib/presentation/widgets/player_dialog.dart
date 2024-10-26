import 'package:flutter/material.dart';
import 'package:mighty_calculator/presentation/widgets/player_widget.dart';

import '../model/player.dart';

class PlayerDialog extends StatelessWidget {
  final Player player;
  final void Function(String text) onTap;

  const PlayerDialog({super.key, required this.player, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController controller =
                TextEditingController(text: player.name);
            return AlertDialog(
              title: const Text('Edit Player Name'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Player Name',
                  border: OutlineInputBorder(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    onTap(controller.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
      child: PlayerWidget(text: player.name),
    );
  }
}
