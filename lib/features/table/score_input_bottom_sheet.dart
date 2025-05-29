import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/models/player.dart';
import 'package:score_card/notifiers/player_notifier.dart';

class ScoreInputBottomSheet extends ConsumerStatefulWidget {
  const ScoreInputBottomSheet({super.key});
  @override
  ConsumerState<ScoreInputBottomSheet> createState() => _ScoreInputBottomSheetState();
}

class _ScoreInputBottomSheetState extends ConsumerState<ScoreInputBottomSheet> {
  late int score;
  @override
  void didChangeDependencies() {
    score = ref.watch(selectedPlayerHoleProvider.select((value) => value?.hole.par ?? 0));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPlayerHole = ref.watch(selectedPlayerHoleProvider);
    if (selectedPlayerHole == null) return const SizedBox();
    final player = ref.watch(playerProvider).firstWhere((player) => player.id == selectedPlayerHole.player.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  ref.read(selectedPlayerHoleProvider.notifier).selectPlayer(null);
                },
                icon: const Icon(Icons.close),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  ref
                      .read(playerProvider.notifier)
                      .updatePlayer(
                        player.copyWith(
                          score: Map.from(player.score)..update(
                            selectedPlayerHole.hole.number,
                            (holeScore) => holeScore.copyWith(score: score),
                            ifAbsent:
                                () => HoleScore(
                                  number: selectedPlayerHole.hole.number,
                                  score: score,
                                  par: selectedPlayerHole.hole.par,
                                ),
                          ),
                        ),
                      );
                  ref.read(selectedPlayerHoleProvider.notifier).selectPlayer(null);
                },
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  spacing: 4,
                  children: [
                    const Text('Score'),
                    SizedBox(
                      height: 60,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            score = value;
                          });
                        },
                        scrollController: FixedExtentScrollController(initialItem: score),
                        children: List.generate(12, (index) => Text('${index == 0 ? '-' : index}')),
                      ),
                    ),
                  ],
                ),
              ),
              // Flexible(
              //   child: Column(
              //     spacing: 4,
              //     children: [
              //       const Text('Putts'),
              //       SizedBox(
              //         height: 60,
              //         child: CupertinoPicker(
              //           itemExtent: 30,
              //           onSelectedItemChanged: (value) {},
              //           scrollController: FixedExtentScrollController(initialItem: 2),
              //           children: List.generate(12, (index) => Text('${index == 0 ? '-' : index}')),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
