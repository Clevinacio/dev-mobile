import 'dart:ui';

import 'package:f3_lugares/screens/countries_places_screen.dart';
import 'package:flutter/material.dart';

import 'screens/countries_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlacesToGo',
      theme: ThemeData(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.amber),
          //primarySwatch: Colors.purple,
          //accentColor: Colors.amber,
          fontFamily: 'Roboto',
          canvasColor: Color.fromARGB(255, 255, 255, 255),
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      debugShowCheckedModeBanner: false,
      home: CountriesScreen(),
      initialRoute: '/',
      routes: {
        '/country-places': (context) => CountryPlacesScreen(),
      },
    );
  }
}
