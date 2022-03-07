import 'package:drag_candies/ui/candie_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CandiesGeneration extends StatefulWidget {
  const CandiesGeneration({Key? key, required this.color}) : super(key: key);
  final int color;
  @override
  State<CandiesGeneration> createState() => _CandiesGenerationState();
}

class _CandiesGenerationState extends State<CandiesGeneration> {
  double top = generateRandomTop();
  double right = generateRandom();
  //1 to 5
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ((MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight) /
              2) *
          top,
      right: MediaQuery.of(context).size.width * right,
      // left: MediaQuery.of(context).size.width * right,
      child: Transform.rotate(
        angle: pi * top / right,
        child: Draggable(
            data: widget.color,
            feedback: CandyForm(
              color: widget.color,
            ),
            childWhenDragging: const CandyForm(color: 0),
            child: CandyForm(color: widget.color)),
      ),
    );
  }

  static double generateRandom() {
    Random random = Random();
    double randomNumber = (random.nextInt(82) + 3) * 0.01;
    return randomNumber;
  }

  static double generateRandomTop() {
    Random random = Random();
    double randomNumber = (random.nextInt(97)) * 0.01;
    return randomNumber;
  }
}
