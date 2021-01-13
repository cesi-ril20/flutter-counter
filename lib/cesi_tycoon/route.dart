import 'package:flutter_app/cesi_tycoon/location.dart';
import 'package:flutter_app/cesi_tycoon/tickable.dart';

class Route implements Tickable {
  final Location origin;
  final Location destination;
  final String resource;
  Route(this.origin, this.destination, this.resource);

  @override
  void tick() {
    if (destination.deposit.hasRoomFor(resource, 1) &&
        origin.deposit.pickup(resource, 1))
      destination.deposit.dropOff(resource, 1);
  }
}
