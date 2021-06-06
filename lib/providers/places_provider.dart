import 'package:flutter/foundation.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

}