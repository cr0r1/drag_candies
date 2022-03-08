import 'package:drag_candies/ui/bowls.dart';
import 'package:drag_candies/ui/candies_generation.dart';
import 'package:drag_candies/model/candies_object.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';

class DragCandies extends StatefulWidget {
  const DragCandies(
      {Key? key,
      required this.numberOfCandies,
      required this.candiesSorted,
      required this.addCandie,
      required this.resetCandie,
      required this.deleteCandie,
      required this.candieList})
      : super(key: key);

  final int numberOfCandies;
  final int candiesSorted;
  final Function() addCandie;
  final Function() resetCandie;
  final Function(int index) deleteCandie;
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
              child: Stack(
                children: [
                  Container(
                    color: Theme.of(context).backgroundColor,
                  )
                ],
              ),
              // color: Theme.of(context).secondaryHeaderColor,
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget.candiesSorted}",
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Buttons(
              addCandie: widget.addCandie,
              resetCandie: widget.resetCandie,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Bolws(
                addCandie: widget.addCandie,
                deleteCandie: widget.deleteCandie,
                candieList: widget.candieList,
              ),
            ),
          ],
        ),
        for (var i = 0; i < widget.candieList.length; i++)
          CandiesGeneration(
            candieData: widget.candieList[i],
          ),
      ],
    );
  }
}
