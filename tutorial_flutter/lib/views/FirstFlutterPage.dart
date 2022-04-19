import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  _onClick() {
    setState(() {
      count++;
    });
  }

  _reset() {
    setState(() {
      count = 0;
    });
  }

  Widget getBigButton(int c) {
    return Container(
        height: 300,
        width: 300,
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: getCounter(c));
  }

  Widget getCounter(int c) {
    return Center(
        child: Text(
      "Você clicou no botão \n $count\n vezes",
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.center,
    ));
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
        children: <Widget>[
          GestureDetector(
            onTap: _onClick,
            child: getBigButton(count),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => _reset()),
        child: const Text('limpar'),
      ),
    );
  }
}
