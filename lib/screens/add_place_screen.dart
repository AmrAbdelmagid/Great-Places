import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place-screen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  File _pickedImage;
  _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  _savePlace(){
    if (_controller.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<PlacesProvider>(context,listen: false).addPlace(_controller.text,_pickedImage);
    Navigator.of(context).pop();
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _controller,
                  ),
                  SizedBox(height: 10.0,),
                  InputImage(_selectImage),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            label: Text('Add Place'),
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            style: buildButtonStyle(context),
          )
        ],
      ),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(double.infinity, 70)),
      backgroundColor:
          MaterialStateProperty.all(Theme.of(context).primaryColor),
      foregroundColor: MaterialStateProperty.all(Colors.black),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}
