import 'package:flutter/foundation.dart';

class MightyViewModel extends ChangeNotifier {
  List<String> players = ['A', 'B', 'C', 'D', 'E'];
  List<String> history = ['A : 10, B : -10, C : -10, D : -10, E : 20'];
  Map<String, int> scores = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
  Map<String, String> friends = {
    'A': 'A',
    'B': 'B',
    'C': 'C',
    'D': 'D',
    'E': 'E'
  };
  int targetScore = 16;

  void updateScore(String player, int score) {
    scores[player] = score;
    notifyListeners();
  }

  void updateFriend(String player, String friend) {
    friends[player] = friend;
    notifyListeners();
  }

  void updateTargetScore(int score) {
    targetScore = score;
    notifyListeners();
  }

  void saveGame() {
    // 게임 저장 로직 구현
    print('게임이 저장되었습니다.');
  }
}
