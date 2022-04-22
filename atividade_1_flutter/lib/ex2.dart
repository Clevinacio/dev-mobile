import 'package:flutter/material.dart';

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
