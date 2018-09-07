import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(title: 'App Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void refresh() {
    setState(() {});
  }

  void openCamera() {

  }

  @override
  Widget build(BuildContext context) {
    TextStyle buttonTextStyle = new TextStyle(color: Colors.white);


    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title, style: buttonTextStyle,),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Button1", style: buttonTextStyle),
              color: Theme
                  .of(context)
                  .accentColor,
              splashColor: Colors.yellowAccent,
              onPressed: refresh,
            ),
            new RaisedButton(
              child: new Text("Button2", style: buttonTextStyle),
              color: Theme
                  .of(context)
                  .accentColor,
              splashColor: Colors.yellowAccent,
              onPressed: refresh,
            ),
            new RaisedButton(
              child: new Text("Button3", style: buttonTextStyle),
              color: Theme
                  .of(context)
                  .accentColor,
              splashColor: Colors.yellowAccent,
              onPressed: refresh,
            ),
          ],
        ),
      ),
    );
  }
}
