import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/models/hole.dart';
import 'package:score_card/models/player.dart';
import 'package:score_card/notifiers/player_notifier.dart';

class ScoreInput extends ConsumerStatefulWidget {
  const ScoreInput({super.key, required this.player, required this.hole});
  final Player player;
  final Hole hole;

  @override
  ConsumerState<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends ConsumerState<ScoreInput> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    final player = widget.player;
    final hole = widget.hole;
    final holeScore = player.score[hole.number] ?? HoleScore(number: hole.number, score: 0, par: hole.par);
    final distance = hole.distance(player.teeColor);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedPlayerHole = ref.watch(selectedPlayerHoleProvider);
    var isSelected = selectedPlayerHole?.hole.number == hole.number && selectedPlayerHole?.player.id == player.id;
    var parDifference = holeScore.score - hole.par;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onHover:
            (value) => setState(() {
              hovered = value;
            }),
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          ref.read(selectedPlayerHoleProvider.notifier).selectPlayer((hole: hole, player: player));
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: (isSelected || hovered) ? colorScheme.tertiaryContainer : colorScheme.secondaryContainer,
            border: Border.all(color: isSelected ? colorScheme.tertiary : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          duration: Durations.short4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 3),
              Row(
                children:
                    holeScore.score != 0
                        ? [
                          const Spacer(flex: 3),
                          Text('${holeScore.score}', style: theme.textTheme.titleLarge),
                          Spacer(flex: parDifference < 0 ? 1 : 2),
                          Text('${parDifference > 0 ? '+' : ''}$parDifference', style: theme.textTheme.labelSmall),
                        ]
                        : [],
              ),
              const Spacer(flex: 1),
              Text('${distance}m', style: theme.textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }
}
