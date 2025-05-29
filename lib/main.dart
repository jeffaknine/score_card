import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_card/features/table/table_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Carte - Sainte-Maxime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ProviderScope(child: TablePage()),
      // home: ImageViewer(
      //   players: List.generate(
      //     4,
      //     (index) => Player(name: 'Player ${index + 1}', score: {
      //       1: 4,
      //       2: 5,
      //       3: 4,
      //       4: 3,
      //       5: 5,
      //       6: 5,
      //       7: 3,
      //       8: 4,
      //       9: 3,
      //       10: 4,
      //       11: 5,
      //       12: 3,
      //       13: 5,
      //       14: 4,
      //       15: 3,
      //       16: 4,
      //       17: 3,
      //       18: 5
      //     }),
      //   ),
      // ),
    );
  }
}
