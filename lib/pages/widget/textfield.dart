import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({
    Key key,
    this.emailcontroller,
    this.name,
  });
  final String name;
  final TextEditingController emailcontroller;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: emailcontroller,
        style: TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black45),
          hintText: name,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[800], width: 3)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45, width: 1)),
        ));
  }
}
