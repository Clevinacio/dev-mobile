import 'package:f3_lugares/models/place.dart';
import 'package:f3_lugares/models/places.dart';
import 'package:flutter/material.dart';

class Favoritos extends ChangeNotifier {
  late List<Place> _placesList;

  final Places _places = Places();

  final List<String> _placeIds = [];

  List<Place> get places => _places.places;

  set places(List<Place> newPlacesList) {
    _places.places = newPlacesList;
    notifyListeners();
  }

  List<Place> get favoritePlaces => _placeIds
      .map((placeId) =>
          _places.places.firstWhere((place) => place.id == placeId))
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
