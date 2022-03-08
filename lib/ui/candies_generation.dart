import 'package:drag_candies/model/candies_object.dart';
import 'package:drag_candies/ui/candie_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CandiesGeneration extends StatefulWidget {
  const CandiesGeneration({Key? key, required this.candieData})
      : super(key: key);
  // final int color;
  final CandieColor candieData;
  @override
  State<CandiesGeneration> createState() => _CandiesGenerationState();
}

class _CandiesGenerationState extends State<CandiesGeneration> {
  bool move = false;
  //1 to 6 inclu

  @override
  Widget build(BuildContext context) {
    double top = ((MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight) /
            2) *
        generateRandomTop();

    double right = MediaQuery.of(context).size.width * generateRandom();
    return AnimatedPositioned(
      curve: Curves.slowMiddle,
      duration: const Duration(seconds: 3),
      top: move ? top : top,
      right: move ? right : right,
      child: Transform.rotate(
        angle: pi * top / right,
        child: Draggable(
          data: widget.candieData,
          feedback: CandyForm(
            color: widget.candieData.color,
          ),
          childWhenDragging: Container(),
          child: GestureDetector(
            child: CandyForm(color: widget.candieData.color),
            onTap: () {
              setState(() {
                move = !move;
              });
            },
          ),
        ),
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
