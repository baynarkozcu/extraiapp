import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extraiapp/answer.dart';
import 'package:flutter_extraiapp/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  Void _answerQuestions() {
    setState(() {
      questionIndex++;
    });
    print('Answer choosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color? ',
      'What\'s your favorite animal? '
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Answer and Question"),
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]),
            Answer(_answerQuestions),
            Answer(_answerQuestions),
            Answer(_answerQuestions),
          ],
        ),
      ),
    );
  }
}
