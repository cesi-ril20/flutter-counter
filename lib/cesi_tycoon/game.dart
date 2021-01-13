import 'dart:async';

import 'package:flutter_app/cesi_tycoon/location.dart';
import 'package:flutter_app/cesi_tycoon/tickable.dart';

class Game {
  final locations = List<TickableObservable>();
  final routes = List<Tickable>();

  void init() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      locations.forEach((tickable) => tickable.tick());
      routes.forEach((tickable) => tickable.tick());
    });
  }
}
