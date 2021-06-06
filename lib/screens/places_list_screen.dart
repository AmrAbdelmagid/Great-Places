import 'package:flutter/material.dart';
import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Great Places!'),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, AddPlaceScreen.routeName);
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
