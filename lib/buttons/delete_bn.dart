import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  String text = '';
  Function delFun;

  DeleteButton(this.text, this.delFun);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            delFun();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).textTheme.bodyText2?.backgroundColor),
          ),
          child: Container(
            margin: const EdgeInsets.all(9.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )),
    );
  }
}
