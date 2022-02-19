import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:werewulfs/ui/settings_screen.dart';
import 'package:werewulfs/ui/singleton.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late TextEditingController _controller;
  late Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();

  bool isNight = false;


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(SettingsScreen.route());
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Center(child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: _controller),
                  if (!isNight)
                    ElevatedButton(onPressed: () {
                      startTimer();
                      setState(() {
                        isNight = true;
                      });
                    }, child: Text('Start')),
                ],
              )),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    _controller.text,
                    style: TextStyle(fontSize: 50),
                  ),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  _controller.text,
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer(Duration(seconds: Singleton.instance.time), () {
      playLocal();
    });
  }

  playLocal() async {

    AudioCache player = AudioCache();
    // or as a local variable
    final player2 = AudioCache();

    // call this method when desired
    player2.play('shorter.mp3');
  }
}
