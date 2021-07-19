import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/checkbox_painter.dart';
import 'package:flutter_application_1/parametrs.dart';
import 'package:provider/provider.dart';

import 'currentId.dart';
import 'myButton.dart';
import 'my_checkBox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int animatedSpeed = 100;

  List<MyCheckBox> list = [];
  CurrentId currentId = CurrentId();
  double fraction = 0.0;
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: animatedSpeed));

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          print(animatedSpeed.round());
          currentId.setDuration(animation.value);
        });
      });
  }

  start() {
    print('start');
    controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height - 300;
    double kof = list.length / 7 * 50;
    return ChangeNotifierProvider.value(
      value: currentId,
      child: Scaffold(
        floatingActionButton: buttons(),
        body: Container(
          padding: EdgeInsets.only(top: 30, bottom: 150),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              Container(
                height: h > kof ? kof : h,
                child: SizedBox(
                  height: 100,
                  child: GridView.count(
                      padding: EdgeInsets.all(5),
                      primary: false,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 7,
                      children: list.map((e) {
                        return e;
                      }).toList()),
                ),
              ),
              Slider(
                  value: animatedSpeed.toDouble(),
                  min: 100,
                  max: 2000,
                  label: animatedSpeed.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      animatedSpeed = value.toInt();
                      controller.duration =
                          Duration(milliseconds: animatedSpeed);
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              Text(animatedSpeed.toString() + ' ms'),
              Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buttons() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                function: () {
                  setState(() {
                    for (int i = 1; i <= 10; i++) {
                      list.add(MyCheckBox(
                        func: () => start(),
                        id: Random().nextInt(colors.length),
                      ));
                    }
                  });
                },
                name: 'Add checkboxes',
                color: Colors.orangeAccent,
              ),
              MyButton(
                function: () {
                  print('clear');
                  setState(() {
                    list.clear();
                  });
                },
                name: 'Clear',
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
