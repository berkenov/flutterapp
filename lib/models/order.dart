import 'package:idea/models/product.dart';

class Order {
  String id;
  String user;
  List<Map<Products, int>> orders;
  double total;
  Order({this.total});
}
