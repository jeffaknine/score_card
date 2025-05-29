import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:ui' as ui;

import 'package:score_card/models/player.dart';

Future<Uint8List> writeScoresOnScorecard({required ByteData imageData, required List<Player> players}) async {
  // Load image from ByteData
  final codec = await ui.instantiateImageCodec(imageData.buffer.asUint8List());
  final frame = await codec.getNextFrame();
  final image = frame.image;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint();
  // Draw original scorecard image
  canvas.drawImage(image, Offset.zero, paint);

  //Draw date on the image
  printAtPosition(intl.DateFormat('dd/MM/yyyy').format(DateTime.now()), canvas, const Offset(1113, 1));

  const topLeft = Offset(148, 626);
  const cellWidth = 51;
  const cellHeight = 43;
  const divider = 3;
  var dy = topLeft.dy + (cellHeight / 3);

  const backNineWidth = 133;
  const padding = cellWidth + divider;

  for (int i = 0; i < players.length; i++) {
    final player = players[i];
    final name = player.name;
    final holeScores = player.score.values.toList();
    final frontNineTotal = holeScores
        .where((holeScore) => holeScore.number <= 9)
        .fold(0, (sum, score) => sum + score.score);
    final backNineTotal = holeScores
        .where((holeScore) => holeScore.number > 9)
        .fold(0, (sum, score) => sum + score.score);
    final total = frontNineTotal + backNineTotal;
    // final totalScore = (total - 72);
    // Draw name on the image`
    printAtPosition(name, canvas, Offset(0, dy + cellHeight * i));

    printAtPosition(
      frontNineTotal.toString(),
      canvas,
      Offset((topLeft.dx + cellWidth / 3) + padding * (9), dy + cellHeight * i),
    );

    printAtPosition(
      backNineTotal.toString(),
      canvas,
      Offset((topLeft.dx + backNineWidth + cellWidth / 3) + padding * (18), dy + cellHeight * i),
    );

    printAtPosition(
      total.toString(),
      canvas,
      Offset((topLeft.dx + backNineWidth + cellWidth / 3) + padding * (19), dy + cellHeight * i),
    );

    printAtPosition(
      total.toString(),
      canvas,
      Offset((topLeft.dx + backNineWidth + cellWidth / 3) + padding * (19), dy + cellHeight * i),
    );

    // printAtPosition(
    //     "${totalScore.isNegative ? '-' : '+'}$totalScore",
    //     canvas,
    //     Offset(
    //       (topLeft.dx + backNineWidth + cellWidth / 3) + padding * (21),
    //       dy + cellHeight * i,
    //     ));

    // Draw scores on the image
    for (int j = 1; j <= player.score.length; j++) {
      final holeScore = player.score[j];
      final spacing = j > 9 ? backNineWidth : 0;
      final position = Offset((topLeft.dx + spacing + cellWidth / 3) + padding * (j - 1), dy + cellHeight * i);
      printAtPosition(holeScore?.score.toString() ?? '', canvas, position);
    }
  }

  final picture = recorder.endRecording();
  final img = await picture.toImage(image.width, image.height);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}

void printAtPosition(String value, Canvas canvas, Offset position) {
  // Setup text style
  const textStyle = TextStyle(color: Colors.black, fontSize: 18);

  final textPainter = TextPainter(textDirection: TextDirection.ltr);
  final textSpan = TextSpan(text: value, style: textStyle);

  textPainter.text = textSpan;
  textPainter.layout();
  textPainter.paint(canvas, position);
}
