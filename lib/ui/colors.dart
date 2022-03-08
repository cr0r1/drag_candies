import 'package:flutter/material.dart';

class ColorsP extends StatefulWidget {
  const ColorsP({Key? key, required this.color, required this.container})
      : super(key: key);
  final int color;
  final Widget container;
  @override
  State<ColorsP> createState() => _ColorsPState();
}

class _ColorsPState extends State<ColorsP> {
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(choseColor(), BlendMode.srcIn),
      child: widget.container,
    );
  }

  Color choseColor() {
    if (widget.color == 0) {
      return Theme.of(context).colorScheme.background;
    } else if (widget.color == 1) {
      return Colors.green;
    } else if (widget.color == 2) {
      return Colors.red;
    } else if (widget.color == 3) {
      return Colors.blueAccent;
    } else if (widget.color == 4) {
      return Colors.purple;
    }
    return Colors.yellow;
  }
}
