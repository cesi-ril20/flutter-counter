class Deposit {
  final _deposit = <String, int>{};
  // { bois: 12, planche: 2 }

  static const MAX_QUANTITY = 100;

  int getQuantity(String resource) {
    return _deposit[resource] ?? 0;
  }

  bool dropOff(String resource, int quantity) {
    if (hasRoomFor(resource, quantity)) {
      _deposit[resource] ??= 0;
      _deposit[resource] += quantity;
      return true;
    } else
      return false;
  }

  bool pickup(String resource, int quantity) {
    if (getQuantity(resource) >= quantity) {
      _deposit[resource] -= quantity;
      return true;
    } else {
      return false;
    }
  }

  bool hasRoomFor(String resource, int quantity) {
    return (_deposit[resource] ?? 0) + quantity <= MAX_QUANTITY;
  }
}
