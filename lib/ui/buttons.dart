import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({
    Key? key,
    required this.addCandie,
    required this.resetCandie,
  }) : super(key: key);
  final Function() addCandie;
  final Function() resetCandie;
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Wrap(
        children: [
          ElevatedButton(
            child: const Icon(Icons.add_box_outlined),
            onPressed: () {
              widget.addCandie();
            },
          ),
          const SizedBox(
            height: 19,
            width: 40,
          ),
          ElevatedButton(
            child: const Icon(Icons.restart_alt_outlined),
            onPressed: () {
              widget.resetCandie();
            },
          ),
        ],
      ),
    );
  }
}
