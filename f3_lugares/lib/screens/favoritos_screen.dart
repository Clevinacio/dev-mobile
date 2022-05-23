import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/place_item.dart';
import '../models/favoritos.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoritos = context.watch<Favoritos>();

    return Center(
      child: ListView.builder(
          itemCount: favoritos.favoritePlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(favoritos.favoritePlaces[index]);
          }),
    );
  }
}
