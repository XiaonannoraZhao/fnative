import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart'as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  //add a ?
  //File _storedImage = File('');
  //_storedImage.path != ''
  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(imageFile==null){
      return;
    }
    setState(() {
      _storedImage= File(imageFile.path);
      //add a null check
    });
    final appDir=await syspaths.getApplicationDocumentsDirectory();
    final fileName=path.basename(imageFile.path);
    ///var savedFile = File.fromUri(Uri.file(imageFile.path));
    final savedImage= await _storedImage!.copy('${appDir.path}/ $fileName');
    widget.onSelectImage(savedImage);
  }

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
          alignment: Alignment.center,

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
