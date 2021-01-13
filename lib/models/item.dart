import 'package:flutter_app/models/observable.dart';

abstract class Tickable {
  void tick();
}

class ObservableItem implements Observable, Tickable {
  String name;
  int count = 1;
  final _observers = <Observer>[];
  ObservableItem(this.name, this.count);

  void addObserver(Observer obs) {
    _observers.add(obs);
    obs.changes("$name: $count");
  }

  void tick() {
    count += 1;
    notifyObservers();
  }

  notifyObservers() {
    _observers.forEach((obs) {
      obs.changes("$name: $count");
    });
  }
}
