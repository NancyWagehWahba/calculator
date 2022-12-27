import 'package:calculator/theme/my_theme.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  String operator;
  String lhs;
  String rhs = '46557774';
  String equalSign = '=';
  String res;

  Result({required this.lhs, required this.rhs, required this.operator, required this.res});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                height: 40,
                child:  Text(
                  '$lhs$operator$rhs',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                alignment: Alignment.topRight,
                child: Text(
                  '$equalSign$res',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
