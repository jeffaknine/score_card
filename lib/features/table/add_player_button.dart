import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/models/player.dart';
import 'package:score_card/notifiers/player_notifier.dart';

class AddPlayerButton extends ConsumerWidget {
  const AddPlayerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerProvider);
    final playerNotifer = ref.read(playerProvider.notifier);
    final theme = Theme.of(context);
    return Center(
      child: Tooltip(
        message: 'Cliquez sur le nom pour le modifier',
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Joueurs',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            if (players.length < 4)
              IconButton(
                onPressed: () =>
                    playerNotifer.addPlayer(Player(id: players.length + 1, name: 'Player ${players.length + 1}')),
                icon: const Icon(Icons.add),
              ),
          ],
        ),
      ),
    );
  }
}
