import 'package:flutter/material.dart';
import '../widgets/image_input.dart';
import '../providers/great_places.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../widgets/location_input.dart';
import '../models/place.dart';


class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add_place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController=TextEditingController();
  File ? _pickedImage;
  PlaceLocation _pickedLocation;

  void _selectImage(File pickedImage){
  _pickedImage=pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(latitude: lat, longitude: lng, address: '');
  }

  void _savedPlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!, _pickedLocation);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a new place'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'title'),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10,),
                      ImageInput(_selectImage),
                      SizedBox(height: 10,),
                      LocationInput(_selectPlace),
                    ],
                  ),
                  ),
              ),
            ),
            //Text('User input'),
            ElevatedButton.icon(
              onPressed: _savedPlace,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.black),
            )
          ],
        ));
  }
}
