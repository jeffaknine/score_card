import 'package:equatable/equatable.dart';
import 'package:score_card/models/hole.dart';

class HoleScore {
  final int number;
  final int score;
  final int par;

  HoleScore({required this.number, required this.score, required this.par});

  HoleScore copyWith({int? score, int? par}) {
    return HoleScore(number: number, score: score ?? this.score, par: par ?? this.par);
  }
}

class Player extends Equatable {
  final int id;
  final String name;
  final Map<int, HoleScore> score;
  final TeeColor teeColor;
  const Player({required this.id, required this.name, this.score = const {}, this.teeColor = TeeColor.yellow});

  Player copyWith({
    String? name,
    Map<int, HoleScore>? score,
    TeeColor? teeColor,
  }) {
    return Player(
      id: id,
      name: name ?? this.name,
      score: score ?? this.score,
      teeColor: teeColor ?? this.teeColor,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [id, name, score, teeColor];
}
