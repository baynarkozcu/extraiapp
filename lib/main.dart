import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extraiapp/answer.dart';
import 'package:flutter_extraiapp/question.dart';
import 'package:flutter_extraiapp/quiz.dart';
import 'package:flutter_extraiapp/result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color? ',
      'answer': [
        {'name': 'Black', 'score': 25},
        {'name': 'White', 'score': 20},
        {'name': 'Red', 'score': 10},
        {'name': 'Purple', 'score': 0}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal? ',
      'answer': [
        {'name': 'Dog', 'score': 10},
        {'name': 'Chicken', 'score': 15},
        {'name': 'Cat', 'score': 50},
        {'name': 'Bird', 'score': 30}
      ]
    },
    {
      'questionText': 'What\'s your favorite book? ',
      'answer': [
        {'name': 'Harry Potter', 'score': 25},
        {'name': 'Sherlock Holmes', 'score': 20},
        {'name': 'Lord of the Rings', 'score': 30},
        {'name': 'Kürk Mantolu Madonna', 'score': 35}
      ]
    },
  ];
  var questionIndex = 0;
  var _totalScores = 0;

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScores = 0;
    });
  }

  Void _answerQuestions(int score) {
    _totalScores = _totalScores + score;

    if (questionIndex < _questions.length) {
      setState(() {
        questionIndex++;
      });
    }

    print('Answer choosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Answer and Question"),
          ),
          body: questionIndex < _questions.length
              ? Quiz(
                  questionIndex: questionIndex,
                  answerQuestions: _answerQuestions,
                  questions: _questions,
                )
              : Result(
                  totalScore: _totalScores,
                  reset: _resetQuiz,
                )),
    );
  }
}
