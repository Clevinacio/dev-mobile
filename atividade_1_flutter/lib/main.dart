import 'package:flutter/material.dart';

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
      home: const MyHomePage1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        title: const Text('Application'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal info",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'First name'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Last name'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Birthday'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Social Security'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Personal info",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Address'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'City'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButtonFormField(
                      items: const [],
                      onChanged: null,
                      decoration: const InputDecoration(labelText: 'State'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'ZIP Code'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: DropdownButtonFormField(
                    items: const [],
                    onChanged: null,
                    decoration: const InputDecoration(labelText: 'Country'),
                  )),
                ],
              ),
            ]),
      ),
    );
  }
}
