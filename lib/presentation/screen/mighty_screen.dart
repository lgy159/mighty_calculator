import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_calculator/presentation/widgets/goal_score_widget.dart';
import 'package:mighty_calculator/presentation/widgets/pattern_widget.dart';
import 'package:mighty_calculator/presentation/widgets/player_dialog.dart';
import 'package:mighty_calculator/presentation/widgets/player_widget.dart';
import 'package:mighty_calculator/presentation/widgets/title_box.dart';
import 'package:provider/provider.dart';

import '../../ui/color_styles.dart';
import '../viewmodel/mighty_viewmodel.dart';
import '../widgets/history_dialog.dart';

class MightyScreen extends StatelessWidget {
  const MightyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MightyViewModel>(context);
    final players = viewModel.players;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.primary100,
        centerTitle: true,
        title: const Text('Mighty Counter'),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirmation"),
                    content: const Text("Are you sure you want to reset?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          viewModel.clearData();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 35,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('Reset'),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBox(title: 'Player (Click Name Edit)'),
          Row(
            children: [
              ...players.mapIndexed(
                (idx, player) => Expanded(
                  child: PlayerDialog(
                      onTap: (String text) {
                        if (text.isEmpty) {
                          // 빈 값 입력시 A B C D E 중 idx 에 맞게 default 값
                          viewModel.updatePlayerName(
                              idx, String.fromCharCode(65 + idx));
                        } else {
                          viewModel.updatePlayerName(idx, text);
                        }
                      },
                      player: player),
                ),
              ),
            ],
          ),
          const TitleBox(title: 'Amount Score'),
          Row(
            children: [
              ...players.mapIndexed(
                (idx, player) => Expanded(
                  child: PlayerWidget(text: player.score.toString()),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: AdWidget(ad: viewModel.bannerAd),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return HistoryDialog(
                    histories: viewModel.histories,
                    players: players,
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: ColorStyles.primary100,
              child: const Center(
                child: Text(
                  'View All History',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
          const TitleBox(title: 'Set Pattern'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...['\u2660', '\u2666', '\u2665', '\u2663', '\u2716'].mapIndexed(
                (idx, pattern) => Expanded(
                  child: PatternWidget(
                    pattern: pattern,
                    onTap: () {
                      viewModel.selectPattern(idx);
                    },
                    index: idx,
                    isSelected: viewModel.isPatternSelected(idx),
                  ),
                ),
              )
            ],
          ),
          const TitleBox(title: 'Set Declare'),
          Row(
            children: [
              ...players.mapIndexed(
                (idx, player) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      viewModel.selectMain(idx);
                    },
                    child: Container(
                        color: (viewModel.selectedMainIndex == idx)
                            ? ColorStyles.selectBlue
                            : Colors.white,
                        child: PlayerWidget(text: player.name)),
                  ),
                ),
              ),
            ],
          ),
          const TitleBox(title: 'Set Friend'),
          Row(
            children: [
              ...players.mapIndexed(
                (idx, player) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      viewModel.selectFriend(idx);
                    },
                    child: Container(
                        color: (viewModel.selectedFriendIndex == idx)
                            ? ColorStyles.selectBlue
                            : Colors.white,
                        child: PlayerWidget(text: player.name)),
                  ),
                ),
              ),
            ],
          ),
          const TitleBox(title: 'Goal Score'),
          GoalScoreWidget(
            goalScoreIdx: viewModel.selectedGoalScoreIndex,
            onTap: (index) {
              viewModel.selectGoalScore(index);
            },
          ),
          const TitleBox(title: 'Result Declare Team Score'),
          const SizedBox(height: 8),
          Center(
            child: Text(
              viewModel.getScore.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.remove),
                Expanded(
                  child: Slider(
                    value: viewModel.getScore.toDouble(),
                    min: 0,
                    max: 20,
                    divisions: 100,
                    onChanged: (double newValue) {
                      viewModel.updateSliderValue(newValue);
                    },
                  ),
                ),
                const Icon(Icons.add),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              viewModel.saveHistory();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return HistoryDialog(
                    histories: viewModel.histories,
                    players: players,
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: ColorStyles.primary100,
              child: const Center(
                child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
