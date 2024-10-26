import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mighty_calculator/presentation/model/player.dart';

part 'history.freezed.dart';

part 'history.g.dart';

@freezed
class History with _$History {
  const factory History({
    required int id,
    required List<Player> players,
  }) = _History;

  factory History.fromJson(Map<String, Object?> json) => _$HistoryFromJson(json);
}