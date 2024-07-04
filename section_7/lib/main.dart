import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text("App test"),
        ),
      ),
      body: AppDice(),
    ),
  ));
}

class AppDice extends StatefulWidget {

  const AppDice({super.key});

  @override
  State<AppDice> createState() => _AppDiceState();
}

class _AppDiceState extends State<AppDice> {
  var diceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  onPressed: ()  {
                    setState(() {
                      onClickButton();
                    });
                  },
                  child: Image.asset('images/dice$diceNumber.png')),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(child: Image.asset("images/dice$diceNumber.png"),
                onPressed: (){
                  setState(() {
                    onClickButton();
                  });
                },),
              ))
        ],
      ),
    );
  }
  void onClickButton() {
    diceNumber = Random().nextInt(6) + 1;
  }
}


