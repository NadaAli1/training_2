import 'package:flutter/material.dart';
import 'package:quizapp/view/answer_view.dart';
import 'package:quizapp/view/quesion_view.dart';
import 'package:quizapp/view/result.dart';

class MathQuestions extends StatefulWidget {
  @override
  _MathQuestionsState createState() => _MathQuestionsState();
}

class _MathQuestionsState extends State<MathQuestions> {
  final List<Map<String, dynamic>> question = [
    {
      'questionText': 'ماهو الرقم الذي عندما تضربه مع الرقم الذي يليه سيكون حاصل ضربهما هو نفس حاصل جمعهما بعد إضافة رقم 11 إليه؟',
      'qAnswer': [
        {'text': '6,7', 'score': 0,},
        {'text': '9,10', 'score': 0,},
        {'text': '4,5', 'score': 10,},
        {'text': '11,12', 'score': 0,},
      ],
    },
    {
      'questionText': 'ما هو الرقم الذي إن قمت بضربه في نفسه، ثم أضفت عليه الرقم خمسة، يكون الناتج النهائي 30؟',
      'qAnswer': [
        {'text': '5', 'score': 10,},
        {'text': '6', 'score': 0,},
        {'text':'7' , 'score': 0,},
        {'text': '8', 'score': 0,},
      ],
    },
    {
      'questionText': '1+1/1+1*1-1=...?',
      'qAnswer': [
        {'text': '3', 'score': 0,},
        {'text': '2', 'score': 10,},
        {'text': '4', 'score': 0,},
        {'text': '5', 'score': 0,},
      ],
    },
    {
      'questionText': '4/2(4-2)=...?',
      'qAnswer': [
        {'text': '2', 'score': 0,},
        {'text': '5', 'score': 0,},
        {'text': '9', 'score': 0,},
        {'text': ' 1', 'score': 10,},
      ],
    },
    {
      'questionText': '9/3+9/3=...?',
      'qAnswer': [
        {'text': '6', 'score': 10,},
        {'text': '13', 'score': 0,},
        {'text': '15', 'score': 0,},
        {'text': '10', 'score': 0,},
      ],
    },
    {
      'questionText': '24/6(8-4)=...?',
      'qAnswer': [
        {'text': '10', 'score': 0,},
        {'text': '20', 'score': 0,},
        {'text': '1', 'score': 10,},
        {'text': '8', 'score': 0,},
      ],
    },
    {
      'questionText': '4/2(1/2)=...?',
      'qAnswer': [
        {'text': '16', 'score': 0,},
        {'text': '4', 'score': 10,},
        {'text': '5', 'score': 0,},
        {'text': '7', 'score': 0,},
      ],
    },
  ];
  int totalScore=0,questionIndex=0;
  void resetQuiz(){
    setState(() {
      totalScore=0;
      questionIndex=0;

    });
  }
  void questionAnswer(score){
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
    if(score==10){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Correct Answer!'),
        backgroundColor: Colors.green,
      ),);

      print('right answer');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wrong Answer!'),
          backgroundColor: Colors.red
      ),);

      print('false answer');
    }
    print(totalScore);
    print(questionIndex);
  }
  Future<bool> onWellPop()async{
    final shouldPop=await showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        title: Text('هل أنت متأكد من الخروج؟'),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pop(true);
          },child: Text('نعم',style: TextStyle(color: Colors.cyan,fontSize: 20)),
          ),FlatButton(onPressed: (){
            Navigator.of(context).pop(false);
          },child: Text('لا',style: TextStyle(color: Colors.cyan,fontSize: 20),),
          ),

        ],
      ),
    );
    return shouldPop??false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWellPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('أسئلة رياضيات',
            style: TextStyle(
                fontWeight: FontWeight.w600
            ),),
        ),
        body: Container(
          color: Colors.white,
          child: (questionIndex==question.length)?ResultScreen(totalScore, resetQuiz):
          Column(
            children: [
              QuizScreen(question[questionIndex]['questionText']),
              Answer(question[questionIndex]['qAnswer'][0]['text'],
                question[questionIndex]['qAnswer'][1]['text'],
                    (){
                  questionAnswer(question[questionIndex]['qAnswer'][0]['score'],);
                },
                    (){
                  questionAnswer(question[questionIndex]['qAnswer'][1]['score'],);
                },
              ),
              Answer(question[questionIndex]['qAnswer'][2]['text'],
                question[questionIndex]['qAnswer'][3]['text'],
                    (){
                  questionAnswer(question[questionIndex]['qAnswer'][2]['score'],);                      },
                    (){
                  questionAnswer(question[questionIndex]['qAnswer'][3]['score'],);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
