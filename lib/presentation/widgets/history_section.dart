import 'package:flutter/material.dart';

class HistorySection extends StatelessWidget {
  final List<String> history;

  const HistorySection({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('History', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: history.length,
          itemBuilder: (context, index) => Text(history[index]),
        ),
      ],
    );
  }
}
