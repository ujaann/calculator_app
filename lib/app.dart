import 'package:calculator_app/view/calculator_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Calculator",
      home: CalculatorView(),
    );
  }
}