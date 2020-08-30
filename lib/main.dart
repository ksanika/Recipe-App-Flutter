import 'package:flutter/material.dart';
import 'RecipeHome.dart';

void main() {
  runApp(RecipeApp());
}


class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeHome(),
    );
  }
}