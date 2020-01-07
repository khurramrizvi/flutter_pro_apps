import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator App",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
    );
  }
}
