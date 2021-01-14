import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/cesi_tycoon/location.dart';
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
  _ValueObserverState();

  String _name;
  String _deposit;

  @override
  void initState() {
    super.initState();
    widget.observable.addObserver(this);
  }

  void changes(String value) {
    setState(() {
      _name = (widget.observable as Location).name;
      _deposit = (widget.observable as Location).deposit.toString();
    });
  }

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_name),
      subtitle: Text(_deposit),
      //onTap: () => onTapped(book),
    );
  }
}
