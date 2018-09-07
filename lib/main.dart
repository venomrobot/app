import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

bool available = false;

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
  //todo delete
  void refresh() {
    setState(() {});
  }

  void _changeAvailable() {
    available = !available;
    print(available);
  }

//  void openCamera() {}

  @override
  Widget build(BuildContext context) {
    TextStyle buttonTextStyle = new TextStyle(color: Colors.white);

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
                onPressed: refresh,
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.90,
              child: new RaisedButton(
                child: new Text("Controleren", style: buttonTextStyle),
                color: Theme.of(context).accentColor,
                splashColor: Colors.yellowAccent,
                onPressed: refresh,
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
        title: Text("Availability"),
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
