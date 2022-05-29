import 'package:f3_lugares/components/main_drawer.dart';
import 'package:f3_lugares/components/place_item.dart';
import 'package:f3_lugares/models/places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _placesList = context.watch<Places>();

    return Scaffold(
      appBar: AppBar(title: Text('Gerenciar Lugares')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _placesList.allPlaces.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                    width: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    _placesList.allPlaces[index].titulo,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      color: Colors.black26,
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_forever),
                                      color: Colors.black26,
                                      onPressed: () {
                                        _placesList.removePlace(
                                            _placesList.allPlaces[index]);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Lugar removido com sucesso!'),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
