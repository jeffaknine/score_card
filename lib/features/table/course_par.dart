import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/notifiers/hole_notifier.dart';

class CoursePar extends ConsumerWidget {
  const CoursePar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holes = ref.watch(holeProvider);
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Total',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          Text(
            holes.map((e) => e.par).reduce((value, element) => value + element).toString(),
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
