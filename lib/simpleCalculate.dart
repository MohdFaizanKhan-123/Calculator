import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class simpleCalculate extends StatefulWidget {
  @override
  _simpleCalculateState createState() => _simpleCalculateState();
}

class _simpleCalculateState extends State<simpleCalculate> {
  String equation = "0";
  String result = "0";
  double fontforequ = 38.8;
  double fontforres = 50.0;
  String expression = "";

  pressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll("×", "*");
        expression = expression.replaceAll("÷", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          equation = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget createButton(String bText, double bHeight, Color bColor) {
    return Container(
      height: MediaQuery.of(context).size.height * .1 * bHeight,
      color: bColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        padding: EdgeInsets.all(16.0),
        child: Text(
          bText,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.normal),
        ),
        onPressed: () => pressed(bText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            alignment: Alignment.centerRight,
            child: Text(
              equation,
              style: TextStyle(fontSize: fontforequ),
            ),
          ),
          Divider(
            color: Colors.white54,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: fontforres),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white54,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        createButton("C", 1, Colors.black26),
                        createButton("⌫", 1, Colors.black26),
                        createButton("÷", 1, Colors.black26),
                      ]),
                      TableRow(children: [
                        createButton("7", 1, Colors.grey),
                        createButton("8", 1, Colors.grey),
                        createButton("9", 1, Colors.grey),
                      ]),
                      TableRow(children: [
                        createButton("4", 1, Colors.grey),
                        createButton("5", 1, Colors.grey),
                        createButton("6", 1, Colors.grey),
                      ]),
                      TableRow(children: [
                        createButton("1", 1, Colors.grey),
                        createButton("2", 1, Colors.grey),
                        createButton("3", 1, Colors.grey),
                      ]),
                      TableRow(children: [
                        createButton(".", 1, Colors.grey),
                        createButton("0", 1, Colors.grey),
                        createButton("00", 1, Colors.grey),
                      ]),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        createButton("×", 1, Colors.black26),
                      ]),
                      TableRow(children: [
                        createButton("+", 1, Colors.black26),
                      ]),
                      TableRow(children: [
                        createButton("-", 1, Colors.black26),
                      ]),
                      TableRow(children: [
                        createButton("=", 2, Colors.red),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
