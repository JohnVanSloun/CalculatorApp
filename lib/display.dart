import "package:flutter/material.dart";

class Display extends StatelessWidget {
  final String text;

  Display(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(right: 15, bottom: 10),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
            ),
          ),
        ),
      ),
      color: Colors.black,
    );
  }
}
