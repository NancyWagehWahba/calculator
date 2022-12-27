import 'package:flutter/material.dart';

class BackDelButton extends StatelessWidget {
  Function backFun;

  BackDelButton(this.backFun);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            backFun();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).textTheme.bodyText2?.backgroundColor),
          ),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.backspace_outlined,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
          )),
    );
  }
}
