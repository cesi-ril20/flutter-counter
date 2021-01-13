import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/value_observer_widget.dart';

import 'models/item.dart';

var observableItem = ObservableItem("Foret", 0);
var observableItem2 = ObservableItem("Scierie", 14);
var tickables = <Tickable>[observableItem, observableItem2];
void main() {
  runApp(MyApp());

  const oneSec = const Duration(seconds: 1);
  new Timer.periodic(
      oneSec,
      (Timer t) => {
            tickables.forEach((tickable) => {tickable.tick()})
          });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyList(),
    );
  }
}

class MyList extends StatelessWidget {
  MyList({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.indigo[400],
              child: Center(child: ValueObserverWidget(observableItem)),
            ),
            Container(
              height: 50,
              color: Colors.indigo[400],
              child: Center(child: ValueObserverWidget(observableItem2)),
            )
          ],
        ));
  }
}
