import 'package:flutter/material.dart';

import '../model/player.dart';

class PlayerWidget extends StatelessWidget {
  final String text;

  const PlayerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black, width: 0.5),
          right: BorderSide(color: Colors.black, width: 0.5),
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      alignment: Alignment.center,
      height: 56,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
