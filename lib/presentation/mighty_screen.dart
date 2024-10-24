import 'package:flutter/material.dart';
import 'package:mighty_calculator/presentation/widgets/player_section.dart';
import 'package:mighty_calculator/presentation/widgets/save_button.dart';
import 'package:mighty_calculator/presentation/widgets/score_section.dart';
import 'package:mighty_calculator/presentation/widgets/target_score_section.dart';
import 'package:provider/provider.dart';
import 'mighty_viewmodel.dart';
import 'widgets/history_section.dart';

class MightyScreen extends StatelessWidget {
  const MightyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MightyViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('마이티 카운터'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlayerSection(players: viewModel.players),
              SizedBox(height: 16),
              HistorySection(history: viewModel.history),
              SizedBox(height: 16),
              ScoreSection(
                scores: viewModel.scores,
                onScoreChange: viewModel.updateScore,
                friends: viewModel.friends,
                onFriendChange: viewModel.updateFriend,
              ),
              SizedBox(height: 16),
              TargetScoreSection(
                targetScore: viewModel.targetScore,
                onTargetScoreChange: viewModel.updateTargetScore,
              ),
              SizedBox(height: 16),
              SaveButton(onSave: viewModel.saveGame),
            ],
          ),
        ),
      ),
    );
  }
}
