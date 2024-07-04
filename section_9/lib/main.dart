
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: () {
        play();
      }, child: Text("click me"),),
    );
  }
  void play() async {
    var player = AudioPlayer();
    try {
      await player.play(AssetSource('note1.wav'));
    }
    catch (e) {
      print(e);
    }
  }

}