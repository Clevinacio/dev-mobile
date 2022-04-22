import 'package:flutter/material.dart';

class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.blue.shade900,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.blue.shade900,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 100,
                color: Colors.yellow,
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                height: 100,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.blue.shade900,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
