import 'package:flutter/material.dart';

class FirstLine extends StatelessWidget {
  String text;
  Function signFun;

  FirstLine(this.text, this.signFun);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          signFun(text);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).textTheme.bodyText1?.backgroundColor),
        ),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(text, style: Theme.of(context).textTheme.bodyText1),
        ),
      ),
    );
  }
}
