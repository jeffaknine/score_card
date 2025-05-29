import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/models/player.dart';
import 'package:score_card/name_dialog.dart';
import 'package:score_card/notifiers/player_notifier.dart';

class PlayerAvatar extends ConsumerWidget {
  const PlayerAvatar({
    super.key,
    required this.player,
  });
  final Player player;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerNotifier = ref.read(playerProvider.notifier);
    return Center(
      child: InkWell(
        onTap: () async {
          final (name, teeColor) = await showDialog(
            context: context,
            builder: (context) => NameDialog(initialName: player.name),
          );
          if (name != null) {
            playerNotifier.updatePlayer(player.copyWith(name: name, teeColor: teeColor));
          }
        },
        child: CircleAvatar(
          backgroundColor: player.teeColor.color,
          child: Text(
            player.name.split(' ').map((e) => e[0]).join(),
          ),
        ),
      ),
    );
  }
}
