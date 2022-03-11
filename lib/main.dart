import 'package:drag_candies/ui/drag_candies.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'model/candies_object.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode usedTheme = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    FlexScheme usedScheme = FlexScheme.green;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: usedScheme, appBarElevation: 0.8),
      darkTheme: FlexThemeData.dark(scheme: usedScheme, appBarElevation: 0.3),
      themeMode: usedTheme,
      home: ChangeMode(
        changeMode: changeMode,
      ),
    );
  }

  void changeMode(ThemeMode modeToChange) {
    setState(() {
      usedTheme = modeToChange;
    });
  }
}

class ChangeMode extends StatefulWidget {
  const ChangeMode({Key? key, required this.changeMode}) : super(key: key);
  final Function(ThemeMode) changeMode;

  @override
  State<ChangeMode> createState() => _ChangeModeState();
}

class _ChangeModeState extends State<ChangeMode> {
  bool isDark = false;
  int numberOfCandies = 17;
  int candiesSorted = 0;
  bool song = true;
  late List<CandieColor> candieList;
  @override
  void initState() {
    super.initState();
    candieList = List.generate(numberOfCandies, (index) {
      return CandieColor(otherVariable: index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          numberOfCandies.toString(),
          style: const TextStyle(fontSize: 50),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
                widget.changeMode(isDark ? ThemeMode.dark : ThemeMode.light);
              },
              child: Icon(
                isDark ? Icons.sunny : Icons.mode_night_outlined,
              )),
          ElevatedButton(
              onPressed: () => muteSong(),
              child: Icon(song ? Icons.music_note : Icons.music_off_rounded))
        ],
      ),
      body: DragCandies(
          numberOfCandies: numberOfCandies,
          candiesSorted: candiesSorted,
          song: song,
          addCandie: addCandie,
          candieList: candieList,
          resetCandie: resetCandie,
          deleteCandie: deleteCandie),
    );
  }

  void muteSong() {
    setState(() {
      song = !song;
    });
  }

  void deleteCandie(int index) {
    setState(() {
      candieList.removeAt(index);
      //appres avoir remove faut rechanger dans dataCandie
      numberOfCandies = candieList.length;
      candiesSorted++;
    });
  }

  void addCandie() {
    setState(() {
      numberOfCandies++;
      candieList.add(CandieColor(otherVariable: candieList.length));
    });
  }

  void resetCandie() {
    setState(() {
      candieList.clear();
      numberOfCandies = candieList.length;
    });
  }
}
