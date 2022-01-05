import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final String questionText;
  QuizScreen(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            questionText,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// Icon(Icons.check,color: Colors.green,),
// SizedBox(width: 10,),
// Icon(Icons.close,color: Colors.red,),