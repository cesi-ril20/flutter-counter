import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/observable.dart';

class ValueObserverWidget extends StatefulWidget {
  final Observable observable;
  //ValueObserver(String data) : super(data);
  ValueObserverWidget(this.observable);

  @override
  _ValueObserverState createState() => _ValueObserverState();
}

class _ValueObserverState extends State<ValueObserverWidget>
    implements Observer {
  String _value = "";

  _ValueObserverState();

  @override
  void initState() {
    super.initState();
    widget.observable.addObserver(this);
  }

  void changes(String value) {
    setState(() {
      _value = value;
    });
  }

  Widget build(BuildContext context) {
    return Text(_value);
  }
}
