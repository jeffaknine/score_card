import 'package:flutter/material.dart';
import 'package:score_card/models/hole.dart';

class HoleInfo extends StatelessWidget {
  const HoleInfo({
    super.key,
    required this.hole,
  });

  final Hole hole;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${hole.number}",
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontFeatures: [const FontFeature.tabularFigures()],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Par ${hole.par}",
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                "${hole.handicap}",
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.scrim),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
