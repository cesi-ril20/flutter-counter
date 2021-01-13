import 'package:flutter_app/cesi_tycoon/deposit.dart';
import 'package:flutter_app/cesi_tycoon/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deposit', () {
    final deposit = Deposit();

    expect(deposit.getQuantity("arbre"), 0);
    expect(deposit.hasRoomFor("arbre", 10), true);
    expect(deposit.hasRoomFor("arbre", 100), true);
    expect(deposit.hasRoomFor("arbre", 101), false);
    expect(deposit.dropOff("arbre", 50), true);
    expect(deposit.dropOff("arbre", 51), false);
    expect(deposit.hasRoomFor("arbre", 50), true);
    expect(deposit.pickup("arbre", 50), true);
    expect(deposit.pickup("arbre", 1), false);
  });

  test('foret', () {
    final foret = Foret();
    expect(foret.deposit.getQuantity("arbre"), 0);
    expect(foret.deposit.getQuantity("poney"), 0);
    foret.tick();
    expect(foret.deposit.getQuantity("arbre"), 1);
    expect(foret.deposit.getQuantity("poney"), 0);
  });
}
