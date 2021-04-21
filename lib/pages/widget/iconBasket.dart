import 'package:flutter/material.dart';
import 'package:idea/res.dart';

class IconBasket extends StatefulWidget {
  IconBasket({Key key}) : super(key: key);

  @override
  _IconBasketState createState() => _IconBasketState();
}

class _IconBasketState extends State<IconBasket> {
  @override
  Widget build(BuildContext context) {
    double summ = 0;
    if ((basket != null) && (basket.length != 0))
      basket.forEach((element) {
        summ += element.keys.first.price * element.values.first;
      });
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(2)),
          child: Text(
            summ.toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
        Expanded(
          child: Icon(
            Icons.shopping_basket,
          ),
        ),
      ],
    ));
  }
}
