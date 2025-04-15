import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:score_card/extension.dart';
import 'package:score_card/models/hole.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final holes = [
    Hole(number: 1, par: 4, handicap: 5, distanceWhite: 381, distanceYellow: 363, distanceBlue: 331, distanceRed: 300),
    Hole(number: 2, par: 5, handicap: 3, distanceWhite: 517, distanceYellow: 472, distanceBlue: 472, distanceRed: 300),
    Hole(number: 3, par: 4, handicap: 11, distanceWhite: 345, distanceYellow: 314, distanceBlue: 287, distanceRed: 255),
    Hole(number: 4, par: 3, handicap: 15, distanceWhite: 166, distanceYellow: 135, distanceBlue: 114, distanceRed: 110),
    Hole(number: 5, par: 5, handicap: 17, distanceWhite: 443, distanceYellow: 390, distanceBlue: 347, distanceRed: 347),
    Hole(number: 6, par: 5, handicap: 1, distanceWhite: 443, distanceYellow: 387, distanceBlue: 343, distanceRed: 297),
    Hole(number: 7, par: 3, handicap: 13, distanceWhite: 166, distanceYellow: 170, distanceBlue: 144, distanceRed: 144),
    Hole(number: 8, par: 4, handicap: 7, distanceWhite: 313, distanceYellow: 284, distanceBlue: 244, distanceRed: 234),
    Hole(number: 9, par: 3, handicap: 9, distanceWhite: 166, distanceYellow: 143, distanceBlue: 129, distanceRed: 101),
    Hole(
        number: 10, par: 4, handicap: 16, distanceWhite: 275, distanceYellow: 264, distanceBlue: 252, distanceRed: 241),
    Hole(number: 11, par: 5, handicap: 6, distanceWhite: 424, distanceYellow: 169, distanceBlue: 379, distanceRed: 366),
    Hole(number: 12, par: 3, handicap: 4, distanceWhite: 169, distanceYellow: 158, distanceBlue: 138, distanceRed: 121),
    Hole(
        number: 13, par: 5, handicap: 12, distanceWhite: 419, distanceYellow: 398, distanceBlue: 370, distanceRed: 352),
    Hole(number: 14, par: 4, handicap: 2, distanceWhite: 368, distanceYellow: 358, distanceBlue: 307, distanceRed: 256),
    Hole(number: 15, par: 3, handicap: 8, distanceWhite: 166, distanceYellow: 138, distanceBlue: 123, distanceRed: 111),
    Hole(
        number: 16, par: 4, handicap: 14, distanceWhite: 332, distanceYellow: 260, distanceBlue: 227, distanceRed: 216),
    Hole(
        number: 17, par: 3, handicap: 10, distanceWhite: 176, distanceYellow: 160, distanceBlue: 146, distanceRed: 138),
    Hole(
        number: 18, par: 5, handicap: 18, distanceWhite: 433, distanceYellow: 411, distanceBlue: 390, distanceRed: 339),
  ];

  TeeColor teeColor = TeeColor.yellow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golf de Sainte-Maxime'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () async {
                final TeeColor? selectedTeeColor = await showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return const TeePickerDialog();
                  },
                );
                if (selectedTeeColor != null) {
                  setState(() {
                    teeColor = selectedTeeColor;
                  });
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: switch (teeColor) {
                    TeeColor.white => Colors.white,
                    TeeColor.blue => Colors.blue,
                    TeeColor.yellow => Colors.yellow,
                    TeeColor.red => Colors.red,
                    TeeColor.black => Colors.black,
                  },
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 70, left: 12, right: 12),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 12,
                children: holes
                    .mapIndexed(
                      (h, i) => SizedBox(
                        height: 48,
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
                spacing: 12,
                children: holes
                    .mapIndexed(
                      (h, i) => SizedBox(
                          height: 48,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Par ${h.par}",
                                style: theme.textTheme.bodyLarge?.copyWith(),
                              ),
                              Text(
                                "${h.handicap}",
                                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.scrim),
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
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) => newValue.text == '0' ? oldValue : newValue)
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
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 12,
                children: holes
                    .mapIndexed(
                      (h, i) => SizedBox(
                        height: 48,
                        child: Center(
                          child: Text(
                            "${h.distance(teeColor)}m",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.tertiary,
                              fontFeatures: [const FontFeature.tabularFigures()],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          )
        ],
      ),
      bottomSheet: Total(theme: theme, holes: holes),
    );
  }
}

class Total extends StatelessWidget {
  const Total({
    super.key,
    required this.theme,
    required this.holes,
  });

  final ThemeData theme;
  final List<Hole> holes;

  @override
  Widget build(BuildContext context) {
    final int score = holes.fold<int>(
        0, (previous, element) => previous + (element.score != null ? element.score! - element.par : 0));
    final int totalShots = holes.fold<int>(0, (previous, element) => previous + (element.score ?? 0));
    return Padding(
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
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$totalShots'),
              Text('${!score.isNegative ? '+' : ''}$score'),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class TeePickerDialog extends StatelessWidget {
  const TeePickerDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text("Choisissez votre couleur de départ"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              TextButton(onPressed: () => Navigator.of(context).pop(TeeColor.white), child: const Text("Blanc")),
              TextButton(onPressed: () => Navigator.of(context).pop(TeeColor.blue), child: const Text("Bleu"))
            ],
          ),
          Column(
            children: [
              TextButton(onPressed: () => Navigator.of(context).pop(TeeColor.yellow), child: const Text("Jaune")),
              TextButton(onPressed: () => Navigator.of(context).pop(TeeColor.red), child: const Text("Rouge"))
            ],
          ),
        ],
      ),
    );
  }
}
