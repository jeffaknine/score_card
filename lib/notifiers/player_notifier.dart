import 'package:riverpod/riverpod.dart';
import 'package:score_card/models/hole.dart';
import 'package:score_card/models/player.dart';

final playerProvider = StateNotifierProvider<PlayerNotifier, List<Player>>((ref) => PlayerNotifier());

class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier() : super([const Player(id: 1, name: 'Player 1')]);

  void addPlayer(Player player) {
    state = List.from(state..add(player));
  }

  void updatePlayer(Player player) {
    final index = state.indexWhere((element) => element.id == player.id);
    state = List.from(state..[index] = player);
  }
}

final selectedPlayerHoleProvider = StateNotifierProvider<SelectedPlayerHoleNotifier, ({Hole hole, Player player})?>(
  (ref) => SelectedPlayerHoleNotifier(),
);

class SelectedPlayerHoleNotifier extends StateNotifier<({Hole hole, Player player})?> {
  SelectedPlayerHoleNotifier() : super(null);

  void selectPlayer(({Hole hole, Player player})? playerHole) {
    state = playerHole;
  }
}
