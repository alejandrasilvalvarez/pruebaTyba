import 'package:flutter/material.dart';

import 'package:soloquieroquefuncione/constants.dart';
import 'package:soloquieroquefuncione/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick&Morty app - Tyba',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: TextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
