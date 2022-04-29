import 'package:f3_lugares/screens/countries_screen.dart';
import 'package:f3_lugares/screens/favoritos_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _tabsScreenState();
}

class _tabsScreenState extends State<TabsScreen> {
  int _indexSelectedScreen = 0;

  final List<Widget> _screens = [CountriesScreen(), FavoritosScreen()];

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Bora Viajar?'),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categoria',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favoritos',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CountriesScreen(),
    //         FavoritosScreen(),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text('Bora viajar?'),
      ),
      body: _screens[_indexSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _indexSelectedScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categoria'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos')
        ],
      ),
      drawer: Drawer(
        child: Container(
          height: 120,
          padding: EdgeInsets.all(20),
          child: Text('Menu Principal'),
        ),
      ),
    );
  }
}
