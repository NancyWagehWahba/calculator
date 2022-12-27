import 'dart:math';

import 'package:calculator/buttons/back_bn.dart';
import 'package:calculator/buttons/delete_bn.dart';
import 'package:calculator/buttons/first_line_bn.dart';
import 'package:calculator/buttons/num_bn.dart';
import 'package:calculator/buttons/operator_bn.dart';
import 'package:calculator/provider/main_provider.dart';
import 'package:calculator/result_layout/result_widget.dart';
import 'package:calculator/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'MainScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MainProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
              value: _switchValue,
              onChanged: (isOn) {
                if (!_switchValue) {
                  mainProvider.changeTheme(ThemeMode.dark);
                } else {
                  mainProvider.changeTheme(ThemeMode.light);
                }
                setState(() {
                  _switchValue = isOn;
                });
              },
            )
          ],
        ),
        body: Column(
          children: [
            // Result screen
            Result(
              lhs: lhs,
              rhs: rhs,
              operator: op,
              res: result,
            ),

            // Keyboard Screen
            Expanded(
                flex: 2,
                child: Container(
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FirstLine('√', signFun),
                          FirstLine('x²', signFun),
                          FirstLine('x³', signFun),
                          FirstLine('π', signFun),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DeleteButton("Ac", aC),
                          BackDelButton(backBtn),
                          OperatorButton(
                            op: '/',
                            marginNumVer: 10.0,
                            marginNumHor: 10.0,
                            opFunction: getOp,
                          ),
                          OperatorButton(
                              op: '*',
                              marginNumVer: 10.0,
                              marginNumHor: 10.0,
                              opFunction: getOp)
                        ],
                      ),

                      //numbers
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      NumberButton(
                                        txt: '7',
                                        marginNumVer: 10.0,
                                        marginNumHor: 10.0,
                                        onClickCallBack: getNumber,
                                      ),
                                      NumberButton(
                                          txt: '8',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                      NumberButton(
                                          txt: '9',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      NumberButton(
                                          txt: '4',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                      NumberButton(
                                          txt: '5',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                      NumberButton(
                                          txt: '6',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      NumberButton(
                                          txt: '1',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                      NumberButton(
                                          txt: '2',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                      NumberButton(
                                          txt: '3',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: getNumber),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      NumberButton(
                                          txt: '0',
                                          marginNumVer: 10.0,
                                          marginNumHor: 55.0,
                                          onClickCallBack: getNumber),
                                      NumberButton(
                                          txt: '.',
                                          marginNumVer: 10.0,
                                          marginNumHor: 10.0,
                                          onClickCallBack: () {}),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  OperatorButton(
                                      op: '-',
                                      marginNumVer: 10.0,
                                      marginNumHor: 14.0,
                                      opFunction: getOp),
                                  OperatorButton(
                                      op: '+',
                                      marginNumVer: 10.0,
                                      marginNumHor: 10.0,
                                      opFunction: getOp),
                                  OperatorButton(
                                      op: '=',
                                      marginNumVer: 40.0,
                                      marginNumHor: 10.0,
                                      opFunction: equalSign),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  String rhs = '';
  String lhs = '';
  String op = '';
  String result = '0';
  double cal = 0;
  double lhsNum = 0;
  double rhsNum = 0;

  void getNumber(String num) {
    if (op.isEmpty) {
      lhs += num;
    } else {
      lhs = result;
      rhs += num;
    }
    setState(() {});
  }

  void getOp(String operator) {
    if (op.isEmpty) {
      result = lhs;
      getNumber(rhs);
    } else {
      calculation(op);
      lhs = result;
      rhs = '';
    }
    op = operator;
    setState(() {});
  }

  void equalSign(String operator) {
    calculation(op);
    setState(() {});
    if (operator == '=') {
      lhs = '';
      rhs = '';
      op = '';
      cal = 0;
      lhsNum = 0;
      rhsNum = 0;
    }
  }

  void calculation(String operator) {
    cal = double.parse(result);
    lhsNum = double.parse(lhs);
    rhsNum = double.parse(rhs);

    if (operator == '+') {
      cal = lhsNum + rhsNum;
    } else if (operator == '-') {
      cal = lhsNum - rhsNum;
    } else if (operator == '*') {
      cal = lhsNum * rhsNum;
    } else if (operator == '/') {
      cal = (lhsNum / rhsNum);
    }
    result = "$cal";
  }

  int lhsInt = 0;
  int rhsInt = 0;

  void backBtn() {
    if (op.isEmpty) {
      lhsInt = int.parse(lhs);
      lhsInt = (lhsNum ~/ 10);
      lhs = "$lhsNum";
    } else {
      rhsInt = int.parse(rhs);
      rhsInt = (rhsNum ~/ 10);
      rhs = "$rhsNum";
    }
    setState(() {});
  }

  void aC() {
    lhs = '';
    rhs = '';
    result = '0';
    op = '';
    cal = 0;
    lhsNum = 0;
    rhsNum = 0;
    setState(() {});
  }

  void signFun(String sign) {
    if (op.isEmpty) {
      op = sign;
      lhsNum = double.parse(lhs);
    }
    if (sign == '√') {
      lhsNum = sqrt(lhsNum);
    } else if (sign == 'x²') {
      lhsNum = lhsNum * lhsNum;
    } else if (sign == 'x³') {
      lhsNum = lhsNum * lhsNum * lhsNum;
    } else if (sign == 'π') {
      lhsNum = lhsNum * 22 / 7;
    }
    result = '$lhsNum';
    op = '';
    lhs = result;
    setState(() {});
  }
}
