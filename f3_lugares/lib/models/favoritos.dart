import 'package:f3_lugares/models/place.dart';
import 'package:flutter/material.dart';

class Favoritos extends ChangeNotifier {
  late List<Place> _placesList;

  final List<String> _placeIds = [];

  List<Place> get places => [..._placesList];

  set places(List<Place> newPlacesList) {
    _placesList = newPlacesList;
    notifyListeners();
  }

  List<Place> get favoritePlaces => _placeIds
      .map((placeId) => _placesList.firstWhere((place) => place.id == placeId))
      .toList();

  void addPlace(Place newPlace) {
    _placeIds.add(newPlace.id);
    notifyListeners();
  }

  void removePlace(Place place) {
    _placeIds.remove(place.id);
    notifyListeners();
  }
}
