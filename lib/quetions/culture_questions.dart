import 'package:flutter/material.dart';
import 'package:quizapp/view/answer_view.dart';
import 'package:quizapp/view/quesion_view.dart';
import 'package:quizapp/view/result.dart';
class CultureQuestion extends StatefulWidget {

  @override
  _CultureQuestionState createState() => _CultureQuestionState();
}

class _CultureQuestionState extends State<CultureQuestion> {
  final List<Map<String, dynamic>> question = [
    {
      'questionText': 'من هو مُكتشف الدورة الدمويةالكبرى؟',
      'qAnswer': [
        {'text': 'بليز باسكال', 'score': 0,},
        {'text': 'ابن سينا', 'score': 0,},
        {'text': 'وليام هارفى', 'score': 10,},
        {'text': 'ابن النفيس', 'score': 0,},
      ],
    },
    {
      'questionText': 'ما هو شكل مجرة درب التبانة؟',
      'qAnswer': [
        {'text': 'حلزوني', 'score': 10,},
        {'text': 'بيضاوي', 'score': 0,},
        {'text':'مربعة' , 'score': 0,},
        {'text': 'دائرى', 'score': 0,},
      ],
    },
    {
      'questionText': 'ما هو اكبر حيوان فى العالم؟',
      'qAnswer': [
        {'text': 'القرش', 'score': 0,},
        {'text': 'الحوت الأزرق', 'score': 10,},
        {'text': 'الديناصور', 'score': 0,},
        {'text': 'الماموث', 'score': 0,},
      ],
    },
    {
      'questionText': 'ما عدد أجنحة النحلة؟',
      'qAnswer': [
        {'text': 'ثلاثة ازواج', 'score': 0,},
        {'text': 'اربعة ازواج', 'score': 0,},
        {'text': 'خمسة ازواج', 'score': 0,},
        {'text': 'زوجين', 'score': 10,},
      ],
    },
    {
      'questionText': 'من هو أسرع حيوان برى فى العالم؟',
      'qAnswer': [
        {'text': ' الفهد', 'score': 10,},
        {'text': 'الأسد', 'score': 0,},
        {'text': 'النمر', 'score': 0,},
        {'text': 'الكنغر', 'score': 0,},
      ],
    },
    {
      'questionText': 'ما هو الكوكب الأحمر؟',
      'qAnswer': [
        {'text': 'الأرض', 'score': 0,},
        {'text': 'زحل', 'score': 0,},
        {'text': 'المريخ', 'score': 10,},
        {'text': 'عطارد', 'score': 0,},
      ],
    },
    {
      'questionText': 'ما هي أكبر دولة فى العالم من حيث المساحة؟',
      'qAnswer': [
        {'text': 'فرنسا', 'score': 0,},
        {'text': 'روسيا', 'score': 10,},
        {'text': 'اليونان', 'score': 0,},
        {'text': 'الصين', 'score': 0,},
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
      onWillPop:onWellPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('أسئلة ثقافية',
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
