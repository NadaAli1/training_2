import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';

class ResultScreen extends StatelessWidget {
  final int totalScore;
  ResultScreen(this.totalScore ,[void Function() resetQuiz]);
  String get resultPharse{
    String resultText;
    if(totalScore==70){
      resultText='Excellent';
    }
    else if(totalScore>=60){
      resultText='Very Good';
    }
    else if(totalScore>=40){
      resultText='Good';
    }
    else if(totalScore>=30){
      resultText='Not Bad';
    }
    else if(totalScore<30){
      resultText='Bad';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Score is $totalScore /70',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text('You are $resultPharse ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                },
                child: Text
                  (
              'Reset Quiz', style: TextStyle(
                fontSize: 30,
                color:Colors.cyan
            ),
            ))
          ],
        ),
      ),
    );
  }
}
