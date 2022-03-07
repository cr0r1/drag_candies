import 'package:drag_candies/ui/candies_generation.dart';
import 'package:drag_candies/model/candies_object.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';

class DragCandies extends StatefulWidget {
  const DragCandies(
      {Key? key,
      required this.numberOfCandies,
      required this.addCandie,
      required this.resetCandie,
      required this.candieList})
      : super(key: key);
  final int numberOfCandies;
  final Function() addCandie;
  final Function() resetCandie;
  final List<CandieColor> candieList;

  @override
  State<DragCandies> createState() => _DragCandiesState();
}

class _DragCandiesState extends State<DragCandies> {
  //create the generated number here, and then we know before the color

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).backgroundColor,
              ),
              // color: Theme.of(context).secondaryHeaderColor,
            ),
          ],
        ),
        Buttons(
          addCandie: widget.addCandie,
          resetCandie: widget.resetCandie,
        ),
        for (var i = 0; i < widget.candieList.length; i++)
          CandiesGeneration(
            color: widget.candieList[i].color,
          ),
      ],
    );
  }
}
