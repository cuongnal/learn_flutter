import 'dart:core';

import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];

  List<Question> lQuestion = [
    Question(question: "cau hoi 1", answers: true),
    Question(question: "cau hoi 2", answers: false),
    Question(question: "cau hoi 3", answers: true),
    Question(question: "cau hoi 4", answers: true),
    Question(question: "cau hoi 5", answers: false),
    Question(question: "cau hoi 6", answers: false),
    Question(question: "cau hoi 7", answers: true),
    Question(question: "END", answers: true),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  lQuestion[index].question ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  onClick(true, context);
                  if (index < lQuestion.length - 1) {
                    index++;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  onClick(false, context);
                  if (index < lQuestion.length - 1) {
                    index++;
                  }
                });
              },
            ),
          ),
        ),
        Row(children: score)
      ],
    );
  }

  void addFalse() {
    score.add(Icon(Icons.close, color: Colors.red));
  }

  void addTrue() {
    score.add(Icon(Icons.check, color: Colors.green));
  }

  void onClick(bool b, BuildContext context) {
    if (index >= lQuestion.length - 1) {
      showAlert(context);
      return;
    }
    if (b == lQuestion[index].answers) {
      addTrue();
      return;
    }
    addFalse();
  }
  void showAlert(BuildContext context) {

    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Da hoan thanh"),
      );
    });
  }
}

class Question {
  String? question;

  bool? answers;

  Question({this.question, this.answers});
}
