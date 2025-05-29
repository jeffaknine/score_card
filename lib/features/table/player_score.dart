import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/models/player.dart';
import 'package:score_card/notifiers/hole_notifier.dart';

class PlayerScore extends ConsumerWidget {
  const PlayerScore({
    super.key,
    required this.player,
  });

  final Player player;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final holes = ref.watch(holeProvider);
    final playerStrokes = player.score.values.fold(0, (previousValue, holeScore) => previousValue + holeScore.score);
    final holesWithScore = Map<int, HoleScore>.from(player.score)..removeWhere((key, value) => value.score == 0);
    final scoreToPar = holesWithScore.values.fold(0, (previousValue, holeScore) {
      final hole = holes.firstWhere((hole) => hole.number == holeScore.number);
      return previousValue + (holeScore.score - hole.par);
    });
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${scoreToPar.isNegative ? '' : '+'} $scoreToPar",
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          Text(
            "$playerStrokes",
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
