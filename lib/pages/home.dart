import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:idea/models/product.dart';
import 'package:idea/pages/basket.dart';
import 'package:idea/pages/widget/iconBasket.dart';
import 'package:idea/pages/widget/textfield.dart';
import 'package:idea/res.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> isActive;
  TextEditingController priceFrom = new TextEditingController(),
      priceUntil = new TextEditingController(),
      valueFrom = new TextEditingController(),
      valueUntil = new TextEditingController();
  int flag = 0;
  List<bool> iter;

  void upload() {
    map.clear();

    double p1 = 0, p2 = 1000, v1 = 0, v2 = 1000;
    if (priceFrom.text.isNotEmpty) p1 = double.parse(priceFrom.text);
    if (priceUntil.text.isNotEmpty) p2 = double.parse(priceUntil.text);
    if (valueFrom.text.isNotEmpty) v1 = double.parse(valueFrom.text);
    if (valueUntil.text.isNotEmpty) v2 = double.parse(valueUntil.text);
    print('p1=$p1 - $p2 - $v1 - $v2  \n flag = $flag');
    List<Products> _product;
    switch (flag) {
      case 0:
        _product = products
            .where((e) => ((e.price >= p1) &&
                (e.price <= p2) &&
                (e.value >= v1) &&
                (e.value <= v2)))
            .toList();
        break;
      case 1:
        _product = products
            .where((e) => ((e.type == 'with gas') &&
                (e.price >= p1) &&
                (e.price <= p2) &&
                (e.value >= v1) &&
                (e.value <= v2)))
            .toList();
        break;
      case 2:
        _product = products
            .where((e) => ((e.type == 'without gas') &&
                (e.price >= p1) &&
                (e.price <= p2) &&
                (e.value >= v1) &&
                (e.value <= v2)))
            .toList();
        break;
    }

    setState(() {
      _product.forEach((element) {
        if (map == null) {
          map = [
            {element: 0}
          ];
        } else
          map.add({element: 0});
      });
      iter = List(map.length);
      print(iter.length);
      for (int g = 0; g < iter.length; g++) {
        iter[g] = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    products.forEach((element) {
      if (map == null) {
        map = [
          {element: 0}
        ];
      } else
        map.add({element: 0});
    });
    iter = List(map.length);
    print(iter.length);
    for (int g = 0; g < iter.length; g++) {
      iter[g] = true;
    }
    isActive = List(news.length);
    for (int i = 0; i < isActive.length; i++) {
      isActive[i] = true;
    }
  }

  calls() {
    showDialog(
        context: context,
        builder: (context) {
          var title = TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5);
          var settings = TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.5);
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 16,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Manager',
                      style: title,
                    ),
                    SizedBox(height: 20),
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://profile-images.xing.com/images/d2fe3c90f65e8a25558e8c7245fa03ea-4/roman-esterbauer.256x256.jpg')),
                            border:
                                Border.all(color: Colors.blueAccent, width: 3),
                            borderRadius: BorderRadius.circular(50))),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Vladimir Putin',
                      style: title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.call,
                              color: Colors.greenAccent,
                              size: 30,
                            )),
                        Text(
                          'Call to Manager...',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.5),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.email,
                              color: Colors.greenAccent,
                              size: 30,
                            )),
                        Text(
                          'Send message...',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.5),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  filters() {
    showDialog(
        context: context,
        builder: (context) {
          var title = TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5);
          var settings = TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.5);
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 16,
              child: Container(
                height: 300,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'VIEW SETINGS',
                      style: title,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: WidgetText(
                            emailcontroller: priceFrom,
                            name: 'from',
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Price',
                            style: settings,
                          ),
                        ),
                        Container(
                          width: 100,
                          child: WidgetText(
                            emailcontroller: priceUntil,
                            name: 'Until',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: WidgetText(
                            emailcontroller: valueFrom,
                            name: 'from',
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Value',
                            style: settings,
                          ),
                        ),
                        Container(
                          width: 100,
                          child: WidgetText(
                            emailcontroller: valueUntil,
                            name: 'Until',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 270,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                flag = 1;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 90,
                              height: 50,
                              child: Text(
                                'WithGas',
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: flag == 1
                                      ? Border.all(
                                          width: 3, color: Colors.orange)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                flag = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 90,
                              height: 50,
                              child: Text(
                                'All',
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: flag == 0
                                    ? Border.all(width: 3, color: Colors.orange)
                                    : null,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                flag = 2;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 90,
                              height: 50,
                              child: Text(
                                'WithoutGas',
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  border: flag == 2
                                      ? Border.all(
                                          width: 3, color: Colors.orange)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  flag = 0;
                                  priceFrom.clear();
                                  priceUntil.clear();
                                  valueFrom.clear();
                                  valueUntil.clear();
                                  filter.clear();
                                  map.clear();
                                  upload();
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                'default',
                                style: title,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                upload();
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'to apply',
                                style: title,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BlueWaters',
          style: GoogleFonts.pinyonScript(
              fontSize: 40, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                calls();
              },
              icon: Icon(Icons.call)),
          IconButton(
              onPressed: () {
                filters();
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Busket()));
              },
              icon: IconBasket())
        ],
      ),
      body: Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 3, left: 3, right: 3),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 2, right: 2, bottom: 10),
                //color: Colors.red,
                height: 80,
                child: story(),
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: map.length,
                    itemBuilder: (context, i) {
                      var styleName = TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue);
                      var styleTitle = TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey);
                      var styleDes =
                          TextStyle(fontSize: 14, color: Colors.grey);
                      var stylePrice =
                          TextStyle(fontSize: 20, color: Colors.red);
                      String u1 = 'assets/addtobasket.png',
                          u2 = 'assets/gul.png';

                      return Container(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Row(
                            children: [
                              Container(
                                height: 190,
                                width: 200,
                                padding: EdgeInsets.only(right: 2, bottom: 2),
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    //print(iter[i].toString());
                                    if (map[i].values.first > 0)
                                      setState(() {
                                        if (iter[i]) {
                                          if (basket == null) {
                                            basket = [
                                              {
                                                map[i].keys.first:
                                                    map[i].values.first
                                              }
                                            ];
                                          } else
                                            basket.add({
                                              map[i].keys.first:
                                                  map[i].values.first
                                            });
                                          showToast('added', Colors.green);
                                        } else {
                                          setState(() {
                                            print(basket.length.toString() +
                                                ' before');
                                            //basket.remove(map[i].keys.first);
                                            basket.removeWhere((element) =>
                                                element.keys.first ==
                                                map[i].keys.first);
                                            showToast('removed', Colors.blue);
                                            print(basket.length);
                                          });
                                        }
                                        iter[i] = !(iter[i]);
                                      });
                                    else {
                                      showToast('indicate the quantity please',
                                          Colors.red);
                                    }
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                iter[i] == true ? u1 : u2))),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            map[i].keys.first.url))),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 220,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        map[i].keys.first.name,
                                        style: styleName,
                                      ),
                                      Text(
                                        map[i].keys.first.title +
                                            ' - ' +
                                            map[i].keys.first.value.toString() +
                                            'L',
                                        style: styleTitle,
                                      ),
                                      Text(
                                        map[i].keys.first.type,
                                        style: styleTitle,
                                      ),
                                      Text(
                                        map[i].keys.first.descriptiom,
                                        overflow: TextOverflow.ellipsis,
                                        style: styleDes,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          map[i].keys.first.price.toString() +
                                              ' AED',
                                          style: stylePrice,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 0.5)),
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  if (map[i].values.first > 0) {
                                                    setState(() {
                                                      map[i][map[i]
                                                              .keys
                                                              .first] =
                                                          map[i].values.first -
                                                              1;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 50,
                                              color: Colors.white,
                                              child: Text(
                                                map[i].values.first.toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  if (map[i].values.first <
                                                      10) {
                                                    setState(() {
                                                      map[i][map[i]
                                                              .keys
                                                              .first] =
                                                          map[i].values.first +
                                                              1;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          ],
                                        ),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }

  showToast(String s, Color c) {
    return Toast.show(s, context,
        backgroundColor: c,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM);
  }

  ListView story() {
    return ListView.builder(
      itemCount: news.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        var borderRed = Border.all(width: 2, color: Colors.red);
        var borderGrey = Border.all(width: 1, color: Colors.grey);
        return GestureDetector(
          onTap: () {
            setState(() {
              isActive[i] = false;
            });
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 16,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(news[i].name),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(news[i].url))),
                    ),
                  );
                });
          },
          child: Container(
            padding: EdgeInsets.only(left: 8),
            child: Container(
              alignment: Alignment.center,
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  border: isActive[i] ? borderRed : borderGrey,
                  shape: BoxShape.circle),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(news[i].url)),
                    shape: BoxShape.circle),
              ),
            ),
          ),
        );
      },
    );
  }
}
