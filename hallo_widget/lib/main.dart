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
    theme : ThemeData(primarySwatch:Colors.blue),
    home : Scaffold(
    appBar : AppBar(title: const Text("Putri Nilam")),
    body : const Center (
    child: Text ("Hallo Nilam"),
    ),));
  }



  
}
