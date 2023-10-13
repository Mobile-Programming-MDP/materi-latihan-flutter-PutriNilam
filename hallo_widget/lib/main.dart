import 'package:flutter/material.dart';

void main() {
  runApp(const Mywidget());
}

class Mywidget extends StatelessWidget {
  const Mywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hallo Widget",
        theme: ThemeData(primarySwatch: Colors.red),
        home: FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nilam"),
      ),
      body: const Center(
        child: Text("Hallo Nilam"),
      ),
    );
  }
}
