import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CameraState();
  }
}

class CameraState extends State<CameraApp> {
  File bestandje;

  picker() async {
    // ImagePicker.pickImage(source: null);
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      bestandje = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(title: new Text('ImagePicker')),
        body: new Center(
          child: bestandje == null
              ? new Text('No image selected.')
              : new Image.file(bestandje),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: picker,
          child: new Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
