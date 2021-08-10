import "package:flutter/material.dart";

class ExpandedRow extends StatelessWidget {
  final List<Widget> buttonList;

  ExpandedRow(this.buttonList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: buttonList[0],
          ),
          Expanded(
            child: buttonList[1],
          ),
          Expanded(
            child: buttonList[2],
          ),
          Expanded(
            child: buttonList[3],
          )
        ],
      ),
    );
  }
}
