import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_app/scaffold.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  String _data = "Wirf eine Münze";

  String _generate() {
    return Random().nextBool() ? "Kopf" : "Zahl";
  }

  @override
  Widget build(BuildContext context) {
    return RandomScaffold(
      selected: 0,
      title: "Münzwurf",
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _data = _generate();
          });
        },
        child: const Icon(Icons.shuffle),
      ),
      body: Center(
        child: Text(
          _data,
          style: const TextStyle(fontSize: 42),
        ),
      ),
    );
  }
}
