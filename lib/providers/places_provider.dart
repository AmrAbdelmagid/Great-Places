import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  PlacesProvider();

  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _places.add(newPlace);
    notifyListeners();
  }
}
