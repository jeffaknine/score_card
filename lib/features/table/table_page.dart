import 'package:file_saver/file_saver.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/features/painter/image_painter.dart';
import 'package:score_card/features/table/add_player_button.dart';
import 'package:score_card/features/table/course_par.dart';
import 'package:score_card/features/table/hole_info.dart';
import 'package:score_card/features/table/player_avatar.dart';
import 'package:score_card/features/table/player_score.dart';
import 'package:score_card/features/table/score_input.dart';
import 'package:score_card/features/table/score_input_bottom_sheet.dart';
import 'package:score_card/notifiers/hole_notifier.dart';
import 'package:score_card/notifiers/player_notifier.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class TablePage extends ConsumerStatefulWidget {
  const TablePage({super.key});

  @override
  ConsumerState<TablePage> createState() => _TablePageState();
}

class _TablePageState extends ConsumerState<TablePage> {
  final ScrollController horizontalController = ScrollController();
  final ScrollController verticalController = ScrollController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final holes = ref.watch(holeProvider);
    final players = ref.watch(playerProvider);
    var selectedPlayerHole = ref.watch(selectedPlayerHoleProvider);
    onPlayerHoleSelected();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golf de Sainte-Maxime'),
        leading:
            loading
                ? const Center(child: CircularProgressIndicator())
                : IconButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      ByteData? data = await rootBundle.load('assets/score_card.png');
                      if (!context.mounted) return;
                      final updatedImage = await writeScoresOnScorecard(imageData: data, players: players);
                      await FileSaver.instance.saveFile(
                        name: 'carte_de_score_sainte_maxime',
                        ext: 'jpeg',
                        mimeType: MimeType.jpeg,
                        bytes: updatedImage,
                      );
                      // Log analytics event after successful export
                      final numPlayers = players.length;
                      final holesFilled =
                          players
                              .expand((p) => p.score.values)
                              .where((hs) => hs.score != 0)
                              .map((hs) => hs.number)
                              .toSet()
                              .length;
                      await FirebaseAnalytics.instance.logEvent(
                        name: 'export_golf_card',
                        parameters: {
                          'num_players': numPlayers,
                          'num_holes_filled': holesFilled,
                        },
                      );
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  icon: const Icon(Icons.downloading_outlined),
                ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: selectedPlayerHole != null ? 140 : 0),
        child: TableView.builder(
          horizontalDetails: ScrollableDetails.horizontal(controller: horizontalController),
          verticalDetails: ScrollableDetails.vertical(controller: verticalController),
          diagonalDragBehavior: DiagonalDragBehavior.free,
          columnCount: 2 + players.length,
          pinnedColumnCount: 2,
          pinnedRowCount: 2,
          rowCount: 20,
          columnBuilder: (index) {
            return TableSpan(extent: FixedTableSpanExtent(index == 0 ? 40 : 80));
          },
          rowBuilder: (index) {
            return const TableSpan(extent: FixedTableSpanExtent(80));
          },
          cellBuilder: (context, vicinity) {
            if (vicinity.row == 0 && vicinity.column > 1) {
              final player = players[vicinity.column - 2];
              return TableViewCell(child: PlayerAvatar(player: player));
            }
            if (vicinity.column == 0) {
              if (vicinity.row < 2) return TableViewCell(child: Container());
              var imageName = 'assets/hole${vicinity.row - 1}.png';
              return TableViewCell(
                child: InkWell(
                  child: Image.asset(imageName),
                  onTap:
                      () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder:
                            (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                spacing: 8,
                                children: [
                                  Text("Trou ${vicinity.row - 1}", style: Theme.of(context).textTheme.titleLarge),
                                  Text(
                                    "Par ${holes[vicinity.row - 2].par} - Hdp ${holes[vicinity.row - 2].handicap}",
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),

                                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(imageName)]),
                                ],
                              ),
                            ),
                      ),
                ),
              );
            }
            if (vicinity.column == 1) {
              if (vicinity.row == 0) {
                return const TableViewCell(child: AddPlayerButton());
              } else if (vicinity.row == 1) {
                return const TableViewCell(child: CoursePar());
              }
              final hole = holes[vicinity.row - 2];
              return TableViewCell(child: HoleInfo(hole: hole));
            } else if (vicinity.row == 1) {
              final player = players[vicinity.column - 2];
              return TableViewCell(child: PlayerScore(player: player));
            }
            final player = players[vicinity.column - 2];
            final hole = holes[vicinity.row - 2];
            return TableViewCell(child: ScoreInput(hole: hole, player: player));
          },
        ),
      ),
      bottomSheet: selectedPlayerHole != null ? ScoreInputBottomSheet(key: ValueKey(selectedPlayerHole)) : null,
    );
  }

  void onPlayerHoleSelected() {
    ref.listen(selectedPlayerHoleProvider, (previous, next) async {
      if (next == null) return;
      //Wait for the bottom sheet to show
      if (previous == null) await Future.delayed(Durations.short4);
      final verticalIndex = next.hole.number;
      final horizontalIndex = next.player.id;
      horizontalController.animateTo(
        ((horizontalIndex - 1) * 80).clamp(0, horizontalController.position.maxScrollExtent).toDouble(),
        duration: Durations.short4,
        curve: Curves.easeInOut,
      );
      verticalController.animateTo(
        ((verticalIndex - 1) * 80).clamp(0, verticalController.position.maxScrollExtent).toDouble(),
        duration: Durations.short4,
        curve: Curves.easeInOut,
      );
    });
  }
}
