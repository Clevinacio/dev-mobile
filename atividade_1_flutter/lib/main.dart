import 'package:flutter/material.dart';

import 'ex1.dart';
import 'ex2.dart';
import 'ex3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 1',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      //substituir pelo número do exercício
      home: const MyHomePage3(),
      debugShowCheckedModeBanner: false,
    );
  }
}
