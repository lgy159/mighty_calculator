import 'package:flutter/foundation.dart';
import 'package:mighty_calculator/ad/ad_mob_service.dart';
import 'package:mighty_calculator/presentation/model/history.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../model/player.dart';

class MightyViewModel extends ChangeNotifier {
  List<Player> players = [];
  List<History> histories = [];

  int selectedPatternIndex = 0;
  int selectedMainIndex = 0;
  int selectedFriendIndex = 0;
  int selectedGoalScoreIndex = 0;
  int getScore = 13;

  late BannerAd bannerAd;

  MightyViewModel() {
    _initPlayer();
    _initBannerAd();
  }

  bool isPatternSelected(int index) => selectedPatternIndex == index;

  void _initPlayer() {
    players = List.generate(5, (index) => Player(name: String.fromCharCode(65 + index), score: 0));
  }

  void _initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  void updatePlayerName(int idx, String newName) {
    players[idx] = players[idx].copyWith(name: newName);
    notifyListeners();
  }

  void _updateSelection(int index, void Function(int) setter) {
    setter(index);
    notifyListeners();
  }

  void selectPattern(int index) => _updateSelection(index, (i) => selectedPatternIndex = i);
  void selectGoalScore(int index) => _updateSelection(index, (i) => selectedGoalScoreIndex = i);
  void selectMain(int index) => _updateSelection(index, (i) => selectedMainIndex = i);
  void selectFriend(int index) => _updateSelection(index, (i) => selectedFriendIndex = i);

  void updateSliderValue(double newValue) {
    getScore = newValue.toInt();
    notifyListeners();
  }

  void saveHistory() {
    final standardScore = _calculateStandard();
    final List<Player> tempPlayers = players.map((player) => player.copyWith()).toList();

    for (int idx = 0; idx < tempPlayers.length; idx++) {
      final amountScore = players[idx].score;
      int score = _calculatePlayerScore(idx, standardScore);

      tempPlayers[idx] = tempPlayers[idx].copyWith(score: score);
      players[idx] = players[idx].copyWith(score: amountScore - score);
    }

    histories.add(History(id: histories.length + 1, players: tempPlayers));
    notifyListeners();
  }

  int _calculatePlayerScore(int idx, int standardScore) {
    if (idx == selectedMainIndex && idx == selectedFriendIndex) return standardScore * 4;
    if (idx == selectedMainIndex) return standardScore * 2;
    if (idx == selectedFriendIndex) return standardScore;
    return -standardScore;
  }

  int _calculateStandard() {
    final goalScore = selectedGoalScoreIndex + 13;
    int doubleScore = (selectedPatternIndex == 4) ? 2 : 1;

    return (goalScore <= getScore)
        ? (goalScore + getScore - 12 * 2 - 1) * doubleScore
        : -(goalScore - getScore) * doubleScore;
  }
}
