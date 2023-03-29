import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_app/scaffold.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final TextEditingController _countController = TextEditingController();
  final TextEditingController _groupController =
      TextEditingController(text: "3");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _data = "Geben Sie die Daten ein";

  String _generate(count, groups) {
    List<int> possibleGroups = List.generate(groups, (index) => index + 1);
    List<int> result = List.empty(growable: true);

    for (var i = 0; i < count % groups; i++) {
      int r = Random().nextInt(possibleGroups.length);
      result.add(possibleGroups[r]);
      possibleGroups.removeAt(r);
    }

    possibleGroups = List.generate(groups, (index) => index + 1);

    int remaining = count ~/ groups;
    for (var i = 0; i < remaining; i++) {
      result.addAll(possibleGroups);
    }

    int shuffles = Random().nextInt(7) + 4;
    for (var i = 0; i < shuffles; i++) {
      result.shuffle();
    }

    return result.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return RandomScaffold(
      selected: 1,
      title: "Gruppen",
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              _data = _generate(int.parse(_countController.text),
                  int.parse(_groupController.text));
            });
          }
        },
        child: const Icon(Icons.shuffle),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(left: 15)),
                Expanded(
                  child: TextFormField(
                    controller: _groupController,
                    decoration: const InputDecoration(
                      label: Text("Anzahl Gruppen"),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null) {
                        return "Bitte gebe eine Nummer ein";
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 15)),
                Expanded(
                  child: TextFormField(
                    controller: _countController,
                    decoration: const InputDecoration(
                      label: Text("Anzahl Teilnehmer"),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null) {
                        return "Bitte gebe eine Nummer ein";
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 15)),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SelectableText(
                    _data,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
