import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_app/components/keyboard_row.dart';
import 'package:wordle_app/constants/words.dart';
import 'package:wordle_app/controller.dart';
//import 'package:wordle_app/data/keys_map.dart';
import '../components/grid.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String _word;

  @override
  void initState() {
    final r = Random().nextInt(words.length);
    _word = words[r];
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setCorrectWord(word: _word);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wordle',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
// Making grids in this
        body: Column(
          children: [
            Expanded(
                flex: 7,
                child: Container(
                  color: Colors.white,
                  child: const Grid(),
                )),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: const Column(
                  children: [
                    KeyboardRow(min: 1, max: 10),
                    KeyboardRow(min: 11, max: 19),
                    KeyboardRow(min: 20, max: 29),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
