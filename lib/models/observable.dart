abstract class Observer {
  void changes(String data);
}

abstract class Observable {
  void addObserver(Observer valueObserver) {}
}
