import 'package:flutter/material.dart';

import "./display.dart";
import "./calcbutton.dart";
import "./expandedRow.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var displayText = "";

  void addNumber(String text) {
    setState(() {
      displayText += text;
    });
  }

  void addOperator(String text) {
    setState(() {
      displayText += " " + text + " ";
    });
  }

  void clearDisplay() {
    setState(() {
      displayText = "";
    });
  }

  void evaluate() {
    setState(() {
      List<String> lst = displayText.split(" ");
      double value = double.parse(lst[0]);

      for (var i = 1; i < lst.length; i++) {
        switch (lst[i]) {
          case "+":
            {
              value += double.parse(lst[i + 1]);
            }
            break;
          case "-":
            {
              value -= double.parse(lst[i + 1]);
            }
            break;
          case "x":
            {
              value *= double.parse(lst[i + 1]);
            }
            break;
          case "/":
            {
              value /= double.parse(lst[i + 1]);
            }
            break;
        }
      }
      displayText = value.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Display(displayText),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CalculatorButton.clearOrInterpret(
                          "Clear", Colors.blue, clearDisplay))
                ],
              ),
            ),
            ExpandedRow([
              CalculatorButton("7", Colors.white, addNumber),
              CalculatorButton("8", Colors.white, addNumber),
              CalculatorButton("9", Colors.white, addNumber),
              CalculatorButton("/", Colors.blue, addOperator)
            ]),
            ExpandedRow([
              CalculatorButton("4", Colors.white, addNumber),
              CalculatorButton("5", Colors.white, addNumber),
              CalculatorButton("6", Colors.white, addNumber),
              CalculatorButton("x", Colors.blue, addOperator)
            ]),
            ExpandedRow([
              CalculatorButton("1", Colors.white, addNumber),
              CalculatorButton("2", Colors.white, addNumber),
              CalculatorButton("3", Colors.white, addNumber),
              CalculatorButton("-", Colors.blue, addOperator)
            ]),
            ExpandedRow([
              CalculatorButton("0", Colors.white, addNumber),
              CalculatorButton(".", Colors.white, addNumber),
              CalculatorButton.clearOrInterpret("=", Colors.blue, evaluate),
              CalculatorButton("+", Colors.blue, addOperator)
            ]),
          ],
        ),
      ),
    );
  }
}
