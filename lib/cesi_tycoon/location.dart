import 'package:flutter_app/cesi_tycoon/deposit.dart';
import 'package:flutter_app/cesi_tycoon/tickable.dart';
import 'package:flutter_app/models/observable.dart';

abstract class TickableObservable implements Tickable, Observable {}

abstract class Location implements TickableObservable {
  final deposit = Deposit();
  final String name;
  Location(this.name);
  final _observers = <Observer>[];
  @override
  void addObserver(Observer valueObserver) {
    _observers.add(valueObserver);
    valueObserver.changes("$name: $deposit");
  }

  void tick() {
    notifyObservers();
  }

  notifyObservers() {
    _observers.forEach((obs) {
      obs.changes("$name: $deposit");
    });
  }
}

class Foret extends Location {
  Foret(String name) : super(name);

  @override
  void tick() {
    deposit.dropOff("arbre", 1);
    super.tick();
  }
}

class Scierie extends Location {
  Scierie(String name) : super(name);

  @override
  void tick() {
    if (deposit.hasRoomFor("planche", 5) && deposit.pickup("arbre", 1))
      deposit.dropOff("planche", 5);
    super.tick();
  }
}
