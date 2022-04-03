import 'package:flutter/material.dart';
import 'package:flutter_observer_pattern/logic/count_observable.dart';
import 'package:flutter_observer_pattern/logic/count_observer.dart';
import 'package:flutter_observer_pattern/logic/observer_builder.dart';
import 'home_Screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
