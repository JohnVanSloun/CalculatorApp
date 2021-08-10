import "package:flutter/material.dart";

class CalculatorButton extends StatelessWidget {
  late final String label;
  late final Color color;
  late final Function func;
  late final bool clearOrIntepret;

  CalculatorButton(label, color, func) {
    this.label = label;
    this.color = color;
    this.func = func;
    this.clearOrIntepret = false;
  }

  CalculatorButton.clearOrInterpret(label, color, func) {
    this.label = label;
    this.color = color;
    this.func = func;
    this.clearOrIntepret = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        onPressed: () => (clearOrIntepret) ? func() : func(label),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(100, 400),
          side: BorderSide(
            style: BorderStyle.solid,
          ),
          primary: color,
        ),
      ),
      color: color,
    );
  }
}
