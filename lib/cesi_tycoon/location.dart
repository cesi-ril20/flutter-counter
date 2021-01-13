import 'package:flutter_app/cesi_tycoon/deposit.dart';
import 'package:flutter_app/cesi_tycoon/tickable.dart';

abstract class Location implements Tickable {
  final deposit = Deposit();
}

class Foret extends Location {
  @override
  void tick() {
    deposit.dropOff("arbre", 1);
  }
}

class Scierie extends Location {
  @override
  void tick() {
    if (deposit.hasRoomFor("planche", 5) && deposit.pickup("arbre", 1))
      deposit.dropOff("planche", 5);
  }
}
