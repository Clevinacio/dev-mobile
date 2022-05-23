import 'package:f3_lugares/data/my_data.dart';
import 'package:f3_lugares/models/favoritos.dart';
import 'package:f3_lugares/models/place.dart';
import 'package:f3_lugares/screens/countries_places_screen.dart';
import 'package:f3_lugares/screens/place_detail_screen.dart';
import 'package:f3_lugares/screens/settings_screen.dart';
import 'package:f3_lugares/screens/tabs_screen.dart';
import 'package:f3_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/countries_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => DUMMY_PLACES,
        ),
        ChangeNotifierProxyProvider<List<Place>, Favoritos>(
          create: (context) => Favoritos(),
          update: (context, places, favoritos) {
            if (favoritos == null) throw ArgumentError.notNull('favoritos');
            favoritos.places = places;
            return favoritos;
          },
        ),
      ],
      child: MaterialApp(
        title: 'PlacesToGo',
        theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: Colors.purple, secondary: Colors.amber),
            //primarySwatch: Colors.purple,
            //accentColor: Colors.amber,
            fontFamily: 'Raleway',
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ))),
        initialRoute: '/',
        routes: {
          AppRoutes.HOME: (ctx) => TabsScreen(),
          AppRoutes.COUNTRY_PLACES: (ctx) => CountryPlacesScreen(),
          AppRoutes.PLACES_DETAIL: (ctx) => PlaceDetailScreen(),
          AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}
