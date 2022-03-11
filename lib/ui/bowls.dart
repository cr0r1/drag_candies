import 'package:audioplayers/audioplayers.dart';
import 'package:drag_candies/model/candies_object.dart';
import 'package:drag_candies/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bolws extends StatefulWidget {
  const Bolws(
      {Key? key,
      required this.deleteCandie,
      required this.addCandie,
      required this.song,
      required this.candieList})
      : super(key: key);

  final Function(int index) deleteCandie;
  final List<CandieColor> candieList;
  final Function() addCandie;
  final bool song;

  @override
  State<Bolws> createState() => _BolwsState();
}

class _BolwsState extends State<Bolws> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Wrap(
        runSpacing: 10.0,
        spacing: 10.0,
        alignment: WrapAlignment.center,
        children: [
          ColorsP(
              color: 1,
              container: BowlForm(
                song: widget.song,
                addCandie: widget.addCandie,
                candieList: widget.candieList,
                deleteCandie: widget.deleteCandie,
                color: 1,
              )),
          ColorsP(
              color: 2,
              container: BowlForm(
                song: widget.song,
                addCandie: widget.addCandie,
                candieList: widget.candieList,
                deleteCandie: widget.deleteCandie,
                color: 2,
              )),
          ColorsP(
              color: 3,
              container: BowlForm(
                song: widget.song,
                addCandie: widget.addCandie,
                candieList: widget.candieList,
                deleteCandie: widget.deleteCandie,
                color: 3,
              )),
          ColorsP(
              color: 4,
              container: BowlForm(
                song: widget.song,
                addCandie: widget.addCandie,
                candieList: widget.candieList,
                deleteCandie: widget.deleteCandie,
                color: 4,
              )),
          ColorsP(
              color: 5,
              container: BowlForm(
                song: widget.song,
                addCandie: widget.addCandie,
                candieList: widget.candieList,
                deleteCandie: widget.deleteCandie,
                color: 5,
              )),
        ],
      ),
    );
  }
}

class BowlForm extends StatefulWidget {
  const BowlForm(
      {Key? key,
      required this.color,
      required this.deleteCandie,
      required this.addCandie,
      required this.candieList,
      required this.song})
      : super(key: key);
  final int color;
  final Function(int index) deleteCandie;
  final Function() addCandie;
  final List<CandieColor> candieList;
  final bool song;
  @override
  State<BowlForm> createState() => _BowlFormState();
}

class _BowlFormState extends State<BowlForm> {
  AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) => true,
      onAccept: (CandieColor data) {
        if (data.color == widget.color) {
          //mettre à jour la taille dans la liste de variable
          int i = data.otherVariable;
          widget.deleteCandie(data.otherVariable);
          while (i < widget.candieList.length) {
            widget.candieList[i].otherVariable--;
            i++;
          }
          debugPrint(
              "The color is ${data.color} --- Remove the ${data.otherVariable} candy and we are good");
          if (widget.song) {
            playSongGood();
          }
        } else {
          widget.addCandie();
          widget.addCandie();
          if (widget.song) {
            playSongBad();
          }
        }
        playHaptic();
      },
      builder: (context, candidateData, rejectedData) {
        return bowlForm();
      },
    );
  }

  Future<AudioPlayer> playSongGood() async {
    return await player.play("./audio/bubblemp3.mp3");
  }

  Future<AudioPlayer> playSongBad() async {
    return await player.play("./audio/caillou.mp3");
  }

  Widget bowlForm() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60), color: Colors.white),
        ),
        Container(
          width: 60,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
        ),
      ],
    );
  }

  void playHaptic() {
    HapticFeedback.heavyImpact();
  }
}
