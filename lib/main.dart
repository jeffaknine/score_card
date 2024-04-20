import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:score_card/extension.dart';
import 'package:score_card/models/hole.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade100),
        useMaterial3: true,
      ),
      home: const RealCard(),
    );
  }
}

class RealCard extends StatefulWidget {
  const RealCard({super.key});

  @override
  State<RealCard> createState() => _RealCardState();
}

class _RealCardState extends State<RealCard> {
  final holes = [
    Hole(number: 1, par: 4, handicap: 5),
    Hole(number: 2, par: 5, handicap: 3),
    Hole(number: 3, par: 4, handicap: 11),
    Hole(number: 4, par: 3, handicap: 15),
    Hole(number: 5, par: 5, handicap: 17),
    Hole(number: 6, par: 5, handicap: 1),
    Hole(number: 7, par: 3, handicap: 13),
    Hole(number: 8, par: 4, handicap: 7),
    Hole(number: 9, par: 3, handicap: 9),
    Hole(number: 10, par: 4, handicap: 16),
    Hole(number: 11, par: 5, handicap: 6),
    Hole(number: 12, par: 3, handicap: 4),
    Hole(number: 13, par: 5, handicap: 12),
    Hole(number: 14, par: 4, handicap: 2),
    Hole(number: 15, par: 3, handicap: 8),
    Hole(number: 16, par: 4, handicap: 14),
    Hole(number: 17, par: 3, handicap: 10),
    Hole(number: 18, par: 5, handicap: 18),
  ];
  @override
  Widget build(BuildContext context) {
    int getScore({int take = 18}) {
      return holes.take(take).fold<int>(
          0,
          (previous, element) =>
              previous + (element.score != null ? element.score! - element.par : 0));
    }

    int getBrut({int take = 18}) {
      return holes.take(take).fold(0,
          (previousValue, element) => previousValue + (element.score != null ? element.score! : 0));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma carte'),
      ),
      body: InteractiveViewer(
        minScale: .00001,
        maxScale: 100000,
        child: Stack(
          children: [
            Image.asset('assets/score_card.png'),
            Positioned(
              top: 410,
              left: -68,
              child: Transform.scale(
                scale: .5,
                child: Form(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: holes
                        .take(9)
                        .mapIndexed((h, i) => SizedBox(
                              width: 74,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 32),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TextInputFormatter.withFunction((oldValue, newValue) =>
                                      newValue.text == '0' ? oldValue : newValue)
                                ],
                                onChanged: (value) => setState(() {
                                  holes[i].score = int.tryParse(value);
                                }),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 417,
                left: 430,
                child: Transform.scale(
                  scale: .5,
                  child: Text(
                    "${getBrut(take: 9)}",
                    style: const TextStyle(fontSize: 32),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final holes = [
    Hole(number: 1, par: 4, handicap: 5),
    Hole(number: 2, par: 5, handicap: 3),
    Hole(number: 3, par: 4, handicap: 11),
    Hole(number: 4, par: 3, handicap: 15),
    Hole(number: 5, par: 5, handicap: 17),
    Hole(number: 6, par: 5, handicap: 1),
    Hole(number: 7, par: 3, handicap: 13),
    Hole(number: 8, par: 4, handicap: 7),
    Hole(number: 9, par: 3, handicap: 9),
    Hole(number: 10, par: 4, handicap: 16),
    Hole(number: 11, par: 5, handicap: 6),
    Hole(number: 12, par: 3, handicap: 4),
    Hole(number: 13, par: 5, handicap: 12),
    Hole(number: 14, par: 4, handicap: 2),
    Hole(number: 15, par: 3, handicap: 8),
    Hole(number: 16, par: 4, handicap: 14),
    Hole(number: 17, par: 3, handicap: 10),
    Hole(number: 18, par: 5, handicap: 18),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int score = holes.fold<int>(
        0,
        (previous, element) =>
            previous + (element.score != null ? element.score! - element.par : 0));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma carte'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 70),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: holes
                    .mapIndexed(
                      (h, i) => SizedBox(
                        height: 60,
                        child: Text(
                          "${h.number}",
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontFeatures: [const FontFeature.tabularFigures()],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: holes
                    .mapIndexed(
                      (h, i) => SizedBox(
                          height: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${h.par}",
                                style: theme.textTheme.bodyLarge?.copyWith(),
                              ),
                              Text(
                                "${h.handicap}",
                                style: theme.textTheme.bodyLarge
                                    ?.copyWith(color: theme.colorScheme.scrim),
                              ),
                            ],
                          )),
                    )
                    .toList(),
              ),
              const Spacer(),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: holes
                      .mapIndexed((h, i) => SizedBox(
                            width: 70,
                            height: 60,
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TextInputFormatter.withFunction((oldValue, newValue) =>
                                    newValue.text == '0' ? oldValue : newValue)
                              ],
                              onChanged: (value) => setState(() {
                                holes[i].score = int.tryParse(value);
                              }),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'TOTAL',
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  'PAR ${holes.fold<int>(0, (previous, element) => previous + element.par)}',
                  style: theme.textTheme.titleMedium,
                )
              ],
            ),
            const Spacer(),
            Text('${!score.isNegative && score != 0 ? '+' : ''}$score'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
