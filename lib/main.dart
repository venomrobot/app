import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(new MyApp());

bool available = false;
List<Check> checks = new List();
TextStyle buttonTextStyle = new TextStyle(color: Colors.white);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new HomePage(title: 'App Home'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeAvailable() {
    available = !available;
  }

//  void openCamera() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
          style: buttonTextStyle,
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.90,
              child: new RaisedButton(
                child: new Text("Beschikbaarheid instellen",
                    style: buttonTextStyle),
                color: Theme.of(context).accentColor,
                splashColor: Colors.yellowAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AvailabilityScreen()),
                  );
                },
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.90,
              child: new RaisedButton(
                child: new Text("Nieuwe controle", style: buttonTextStyle),
                color: Theme.of(context).accentColor,
                splashColor: Colors.yellowAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewCheckScreen()));
                },
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.90,
              child: new RaisedButton(
                child: new Text("Controleren", style: buttonTextStyle),
                color: Theme.of(context).accentColor,
                splashColor: Colors.yellowAccent,
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailabilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Availability", style: buttonTextStyle),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _HomePageState()._changeAvailable();
            Navigator.pop(context);
          },
          child: available
              ? Text('I am available!')
              : Text('I am no longer available'),
        ),
      ),
    );
  }
}

class NewCheckScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CameraState();
  }
}

class CameraState extends State<NewCheckScreen> {
  File bestandje;

  picker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      bestandje = image;
    });
  }

  @override
  Widget build(BuildContext context) {
//    return new MaterialApp(
    return Scaffold(
      appBar: AppBar(
        title: new Text('Nieuwe controle', style: buttonTextStyle),
      ),
      body: new Column(children: [
        (bestandje == null
            ? new Text('Maak een foto =)')
            : new Image.file(bestandje)),
        (bestandje == null
            ? new Text('')
            : TextField(
                decoration: InputDecoration(hintText: 'Name of patient'),
              )),
        (bestandje == null
            ? new Text('')
            : RaisedButton(
                onPressed: () {
                  checks.add(new Check(null, bestandje));
                  Navigator.pop(context);
                },
                child: new Text('Verstuur')))
      ]),
      floatingActionButton: new FloatingActionButton(
        onPressed: picker,
        backgroundColor: Colors.deepOrangeAccent,
        child: new Icon(Icons.camera_alt),
      ),
    );
  }
}

class Check {
  String patientName;
  File photo;

  Check(String name, File photo) {
    this.patientName = name;
    this.photo = photo;
  }
}

//class NewCheckScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Availability"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            _HomePageState()._changeAvailable();
//            Navigator.pop(context);
//          },
//          child: available
//              ? Text('I am available!')
//              : Text('I am no longer available'),
//        ),
//      ),
//    );
//  }
//}
