import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  String op;
  double marginNumVer = 8.0;
  double marginNumHor = 8.0;
  Function opFunction;

  OperatorButton(
      {required this.op,
      required this.marginNumVer,
      required this.marginNumHor,
      required this.opFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            opFunction(op);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).textTheme.headline6?.backgroundColor)),
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: marginNumVer, horizontal: marginNumHor),
            child: Text(op, style: Theme.of(context).textTheme.headline6),
          )),
    );
  }
}
