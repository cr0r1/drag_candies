import 'package:flutter/material.dart';

class CandyForm extends StatefulWidget {
  const CandyForm({Key? key, required this.color}) : super(key: key);
  final int color;
  @override
  State<CandyForm> createState() => _CandyFormState();
}

class _CandyFormState extends State<CandyForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: choseColor(),
          ),
          width: 10,
          height: 12,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: choseColor(),
          ),
          width: 40,
          height: 27,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: choseColor(),
          ),
          width: 10,
          height: 12,
        ),
      ],
    );
  }

  Color choseColor() {
    if (widget.color == 0) {
      return Theme.of(context).colorScheme.background;
    } else if (widget.color == 1) {
      return Colors.blue;
    } else if (widget.color == 2) {
      return Colors.green;
    } else if (widget.color == 3) {
      return Colors.red;
    } else if (widget.color == 4) {
      return Colors.blueAccent;
    } else if (widget.color == 5) {
      return Colors.purple;
    }
    return Colors.yellow;
  }
}
