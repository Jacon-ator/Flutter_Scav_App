import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                title: const Text("PFT Scav Hunt")),
            body: Container(child: const Text("Hello PFT I am text!"))));
  }
}
