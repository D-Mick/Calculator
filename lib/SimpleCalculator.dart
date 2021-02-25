import 'package:calculator/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class simpleCalculator extends StatefulWidget {
  @override
  _simpleCalculatorState createState() => _simpleCalculatorState();
}

class _simpleCalculatorState extends State<simpleCalculator> {
  String _history = '';
  String _expresssion = '';

  void buttonClicked(String text){
    setState(() {
      _expresssion += text;
    });
  }

  void clearAll(String text){
    setState(() {
      _expresssion = '';
      _history = '';
    });
  }

  void clear(String text){
    setState(() {
      _expresssion = '';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expresssion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expresssion;
      _expresssion = eval.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 24,
                    ),
                    color: Color(0xff545f61),
                ),
              ),
              alignment: Alignment(1,1),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Text(
                _expresssion,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 48,
                  ),
                  color: Colors.white
                ),
              ),
              alignment: Alignment(1,1),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                  text: "AC",
                  fillColor: 0xFF1D1E33,
                  callBack: clearAll,
                ),
                button(
                  text: "C",
                  fillColor: 0xFF1D1E33,
                  callBack: clear,
                ),
                button(
                  text: "%",
                  fillColor: 0xFFFFA500,
                  callBack: buttonClicked,
                ),
                button(
                  text: "/",
                  fillColor: 0xFFFFA500,
                  callBack: buttonClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                  text: "7",
                  callBack: buttonClicked,
                ),
                button(
                  text: "8",
                  callBack: buttonClicked,
                ),
                button(
                  text: "9",
                  callBack: buttonClicked,
                ),
                button(
                  text: "*",
                  fillColor: 0xFFFFA500,
                  callBack: buttonClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                  text: "4",
                  callBack: buttonClicked,
                ),
                button(
                  text: "5",
                  callBack: buttonClicked,
                ),
                button(
                  text: "6",
                  callBack: buttonClicked,
                ),
                button(
                  text: "-",
                  fillColor: 0xFFFFA500,
                  callBack: buttonClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                  text: "1",
                  callBack: buttonClicked,
                ),
                button(
                  text: "2",
                  callBack: buttonClicked,
                ),
                button(
                  text: "3",
                  callBack: buttonClicked,
                ),
                button(
                  text: "+",
                  fillColor: 0xFFFFA500,
                  callBack: buttonClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                  text: ".",
                  callBack: buttonClicked,
                ),
                button(
                  text: "0",
                  callBack: buttonClicked,
                ),
                button(
                  text: "00",
                  callBack: buttonClicked,
                ),
                button(
                  text: "=",
                  fillColor: 0xFFFFA500,
                  callBack: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
