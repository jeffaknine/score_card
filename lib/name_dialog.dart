import 'package:flutter/material.dart';
import 'package:score_card/models/hole.dart';

class NameDialog extends StatefulWidget {
  const NameDialog({super.key, this.initialName = ''});
  final String initialName;

  @override
  State<NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<NameDialog> {
  late final TextEditingController _controller = TextEditingController(text: widget.initialName);
  TeeColor selectedTeeColor = TeeColor.yellow;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrer le nom et départ du joueur'),
      content: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Nom', border: OutlineInputBorder()),
            autofocus: true,
          ),
          Row(
            spacing: 4,
            children: TeeColor.values
                .map(
                  (e) => InkWell(
                    onTap: () => setState(() {
                      selectedTeeColor = e;
                    }),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: selectedTeeColor == e ? Theme.of(context).colorScheme.inversePrimary : e.color,
                      child: CircleAvatar(
                        backgroundColor: e.color,
                        radius: 16,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop((_controller.text, selectedTeeColor));
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
