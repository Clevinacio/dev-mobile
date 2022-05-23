import 'package:f3_lugares/models/favoritos.dart';
import 'package:f3_lugares/models/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _FavoriteButton extends StatelessWidget {
  final Place place;

  const _FavoriteButton(this.place);

  @override
  Widget build(BuildContext context) {
    var isFavorite = context.select<Favoritos, bool>(
      (favoritos) => favoritos.favoritePlaces.contains(place),
    );

    return FloatingActionButton(
      onPressed: isFavorite
          ? () {
              context.read<Favoritos>().removePlace(place);
            }
          : () {
              context.read<Favoritos>().addPlace(place);
            },
      child: isFavorite
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
    );
  }
}

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context)?.settings.arguments as Place;

    return Scaffold(
      appBar: AppBar(
        title: Text(place.titulo),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              place.imagemUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Dicas',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            width: 300,
            height: 250,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
                itemCount: place.recomendacoes.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(place.recomendacoes[index]),
                        subtitle: Text(place.titulo),
                        onTap: () {
                          print(place.recomendacoes[index]);
                        },
                      ),
                      Divider(),
                    ],
                  );
                }),
          )
        ],
      ),
      floatingActionButton: _FavoriteButton(place),
    );
  }
}
