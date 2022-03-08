import 'package:flutter/material.dart';
import 'colors.dart';

class CandyForm extends StatefulWidget {
  const CandyForm({Key? key, required this.color}) : super(key: key);
  final int color;
  @override
  State<CandyForm> createState() => _CandyFormState();
}

class _CandyFormState extends State<CandyForm> {
  Widget candyBody() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      width: 40,
      height: 27,
    );
  }

  Widget candyUp() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      width: 10,
      height: 12,
    );
  }

  Widget candyDown() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      width: 10,
      height: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColorsP(color: widget.color, container: candyUp()),
        ColorsP(
          color: widget.color,
          container: candyBody(),
        ),
        ColorsP(color: widget.color, container: candyDown()),
      ],
    );
  }
}
