import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(new CameraApp());

}

class CameraApp extends StatefulWidget{
@override
  State<StatefulWidget> createState() {
  return new CameraState();
}
}

class CameraState extends State<CameraApp>{
  picker(){
    print ('picker is called');
   // ImagePicker.pickImage(source: null);
    ImagePicker.pickImage(source: ImageSource.camera);  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home : new Scaffold(
        appBar: AppBar(
          title: new Text('ImagePicker')
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: picker ,
          child: new Icon(Icons.camera_alt),
        ),



      ),

    );
  }

}
