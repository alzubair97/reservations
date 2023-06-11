import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Line extends StatelessWidget {
  final bool isStartOpsity;
  const Line({
    Key? key,
    this.isStartOpsity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: isStartOpsity
                ? <Color>[
              Colors.grey,
              Colors.white10,
            ]
                : <Color>[
              Colors.white10,
              Colors.grey,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            stops: const <double>[0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      width: 30.w,
      height: 1.0,
    );
  }
}