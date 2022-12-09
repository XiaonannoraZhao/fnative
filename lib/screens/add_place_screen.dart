import 'package:flutter/material.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add_place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController=TextEditingController();

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
                      ImageInput(),
                    ],
                  ),
                  ),
              ),
            ),
            //Text('User input'),
            ElevatedButton.icon(
              onPressed: () {},
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
