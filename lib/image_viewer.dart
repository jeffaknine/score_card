import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:score_card/features/painter/image_painter.dart';
import 'package:score_card/models/player.dart';

class ImageViewer extends StatefulWidget {
  final List<Player> players;
  const ImageViewer({required this.players, super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  Uint8List? imageData;
  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  _loadImage() async {
    ByteData? data = await rootBundle.load('assets/score_card.png');
    final updatedImage = await writeScoresOnScorecard(imageData: data, players: widget.players);
    setState(() {
      imageData = updatedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageData != null ? Image.memory(imageData!) : const Center(child: CircularProgressIndicator()),
    );
  }
}
