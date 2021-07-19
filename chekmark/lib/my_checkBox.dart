import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'checkbox_painter.dart';
import 'currentId.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox({
    Key? key,
    required this.id,
    required this.func,
  }) : super(key: key);

  int id;
  Function func;

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  void initState() {
    super.initState();

    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    CurrentId c = Provider.of<CurrentId>(context);

    return Container(
      child: InkWell(
        onTap: () {
          if (widget.id == c.currentId)
            return;
          else
            setState(() {
              widget.func.call();
              c.setPrevios(c.currentId);
              c.onTab(widget.id);
            });

          // print('$x');
        },
        child: Container(
          width: 10,
          height: 10,
          child: CustomPaint(
            willChange: true,
            foregroundPainter: MyCheckBoxPaint(
                id: widget.id,
                check: c.currentId,
                x: c.milisecond,
                previos: c.previosId),
          ),
        ),
      ),
    );
  }
}
