import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  _onClick() {
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Olá, Mundo!"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Olá, mundo! (de novo)"),
          Text("Esse é meu primeiro app em Flutter"),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClick,
        child: const Icon(Icons.add),
      ),
    );
  }
}
