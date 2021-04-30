import 'package:flutter/material.dart';
import 'package:flutter_extraiapp/question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestions;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  const Quiz(
      {Key key, this.answerQuestions, this.questionIndex, this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) => Answer(()=> answerQuestions(answer['score']), answer['name']))
            .toList()
      ],
    );
  }
}
