// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:reservations/style/color.dart';

class Steper extends StatefulWidget {
  int? steps, step;
  Axis? dirction;
  List<Widget>? body;

  Steper(
      {Key? key,
      @required this.steps,
      @required this.step,
      @required this.body,
      @required this.dirction})
      : super(key: key);

  @override
  _SteperState createState() => _SteperState();
}

class _SteperState extends State<Steper> {
  @override
  Widget build(BuildContext context) {
    return widget.dirction == Axis.horizontal
        ? _bulidHorizontal()
        : Container();
  }

  _bulidHorizontal() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(widget.steps!, (index) => stepWidget(index + 1)),
          ),
        ),
        Expanded(child: widget.body![widget.step! - 1]),
      ],
    );
  }

  Color? getColorByNumStep(int numStep) {
    if (widget.step == widget.steps) return goldenColor;
    if (numStep == widget.step) return goldenColor;
    if (numStep < widget.step!) return mainColor;
    if (numStep > widget.step!) return Colors.grey;
    return null;
  }

  stepWidget(int index) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: getColorByNumStep(index),
          child: Text(
            "$index",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        index != widget.steps
            ? Container(
                width: 30,
                height: 3,
                color:
                    getColorByNumStep(index), // Theme.of(context).primaryColor,
              )
            : Container(),
      ],
    );
  }
}
