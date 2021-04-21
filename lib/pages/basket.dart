import 'package:flutter/material.dart';

class Busket extends StatefulWidget {
  Busket({Key key}) : super(key: key);

  @override
  _BusketState createState() => _BusketState();
}

class _BusketState extends State<Busket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Basket'),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {},
            ),
          ]),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Container(),
      ),
    );
  }
}
