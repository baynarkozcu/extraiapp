import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;

  String get phrase {
    if (totalScore > 100) {
      return "Successfull";
    } else {
      return "Very Bad";
    }
  }

  const Result({Key key, this.totalScore , this.reset}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
      phrase,
      style: TextStyle(
              fontSize: 25,
              color: Colors.red.shade800,
              fontWeight: FontWeight.bold),
    ),
    ElevatedButton(onPressed: reset, child: Text("Restart Quiz"))
          ],
        ));
  }
}
