import 'package:f3_lugares/data/my_data.dart';
import 'package:f3_lugares/models/place.dart';
import 'package:flutter/material.dart';

class Places extends ChangeNotifier {
  late List<Place> _placesList;

  final List<Place> _allPlaces = [...DUMMY_PLACES];

  List<Place> get places => [..._placesList];

  set places(List<Place> newPlacesList) {
    _placesList = newPlacesList;
    notifyListeners();
  }

  List<Place> get allPlaces => _allPlaces;

  void addPlace(Place newPlace) {
    _allPlaces.add(newPlace);
    notifyListeners();
  }

  void removePlace(Place place) {
    _allPlaces.remove(place);
    notifyListeners();
  }
}
