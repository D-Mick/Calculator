import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callBack;

  const button({
    Key key,
    this.text,
    this.textColor = 0xffffffff,
    this.fillColor,
    this.textSize = 24,
    this.callBack
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () => {
              callBack(text)
            },
            color: fillColor != null ? Color(fillColor) : null,
            textColor: Color(textColor),
            child: Text(
              text,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: textSize,
              )),
            )),
      ),
    );
  }
}
