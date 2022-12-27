import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  String txt = '';
  double marginNumVer = 8.0;
  double marginNumHor = 8.0;
  Function onClickCallBack;

  NumberButton(
      {required this.txt,
      required this.marginNumVer,
      required this.marginNumHor,
      required this.onClickCallBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            onClickCallBack(txt);
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).textTheme.headline5?.backgroundColor),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: marginNumVer, horizontal: marginNumHor),
            child: Text(
              txt,
              style: Theme.of(context).textTheme.headline5,
            ),
          )),
    );
  }
}
