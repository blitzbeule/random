import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomScaffold extends StatelessWidget {
  final String title;
  final int selected;
  final Widget body;
  final Widget? floatingActionButton;

  const RandomScaffold({
    super.key,
    required this.title,
    required this.selected,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: floatingActionButton,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Random App",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.toll),
              title: const Text("Münzwurf"),
              selected: selected == 0,
              onTap: () {
                context.goNamed("coin");
              },
            ),
            ListTile(
              leading: const Icon(Icons.groups),
              title: const Text("Gruppen"),
              selected: selected == 1,
              onTap: () {
                context.goNamed("groups");
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
