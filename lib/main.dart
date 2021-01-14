import 'package:flutter/material.dart';
import 'package:flutter_app/cesi_tycoon/commercial_route.dart';
import 'package:flutter_app/models/observable.dart';
import 'package:flutter_app/widgets/value_observer_widget.dart';

import 'cesi_tycoon/game.dart';
import 'cesi_tycoon/location.dart';

void main() {
  final game = Game();
  final foret = Foret("Sherwood");
  final scierie = Scierie("Scierie");
  final route = CommercialRoute(foret, scierie, "arbre");
  game.locations.add(foret);
  game.locations.add(scierie);
  game.routes.add(route);
  game.init();
  runApp(MyApp(game));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Game game;

  MyApp(this.game);

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
      home: MyList(game.locations),
    );
  }
}

class MyList extends StatelessWidget {
  List<Observable> locations;
  MyList(locations, {Key key}) : super(key: key) {
    this.locations = locations.cast<Observable>();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: SizedBox(
                height: kToolbarHeight,
                child: Center(child: Text("CESI Tycoon")))),
        body: Container(
            color: Colors.white,
            child: ListView(
                padding: const EdgeInsets.all(8),
                children: locations
                    .map((e) => ValueObserverWidget(e))
                    .toList()
                    .cast<Widget>())));
  }
}
