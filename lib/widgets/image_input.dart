import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  //add a ?
  //File _storedImage = File('');
  //_storedImage.path != ''

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ?
              //Image.file(_storedImage,fit: BoxFit.cover,width: double.infinity,)
              Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            //textButton.icon
            icon: Icon(Icons.camera),
             style: TextButton.styleFrom(

            foregroundColor: Theme.of(context).primaryColor),
            onPressed: () {}, label: Text('Take pics'), 
          ),
        ),
      ],
    );
  }
}
//theme: ThemeData(
//           colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
