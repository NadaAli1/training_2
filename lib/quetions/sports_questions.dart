import 'package:flutter/material.dart';
import 'package:quizapp/view/answer_view.dart';
import 'package:quizapp/view/quesion_view.dart';
import 'package:quizapp/view/result.dart';

class SportsQuestions extends StatefulWidget {


  @override
  _SportsQuestionsState createState() => _SportsQuestionsState();
}

class _SportsQuestionsState extends State<SportsQuestions> {
  final List<Map<String, dynamic>> question = [
    {
      'questionText': 'في أي مكان من العالم أُقيمت أول بطولات كأس العالم لكرة القدم؟',
      'qAnswer': [
        {'text': 'مصر', 'score': 0,},
        {'text': 'روسيا', 'score': 0,},
        {'text': 'أرجواي', 'score': 10,},
        {'text': 'ألمانيا', 'score': 0,},
      ],
    },
    {
      'questionText': ' متى أقيمت أول بطولة لكأس القارات؟',
      'qAnswer': [
        {'text': '1992', 'score': 10,},
        {'text': '1993', 'score': 0,},
        {'text':'1994' , 'score': 0,},
        {'text': '1995', 'score': 0,},
      ],
    },
    {
      'questionText': 'كم عدد أشواط كرة السلة؟',
      'qAnswer': [
        {'text': '1', 'score': 0,},
        {'text': '2', 'score': 10,},
        {'text': '3', 'score': 0,},
        {'text': '4', 'score': 0,},
      ],
    },
    {
      'questionText': 'كم عدد لاعبين كرة الطائرة لكل فريق؟',
      'qAnswer': [
        {'text': 'اربعة لاعبين', 'score': 0,},
        {'text': 'خمسة لاعبين', 'score': 0,},
        {'text': 'سبعة لاعبين', 'score': 0,},
        {'text': 'ستة لاعبين', 'score': 10,},
      ],
    },
    {
      'questionText': 'كم عدد اللاعبين لكل فريق في كرة اليد للملاعب الخارجية؟',
      'qAnswer': [
        {'text': '11', 'score': 10,},
        {'text': '12', 'score': 0,},
        {'text': '13', 'score': 0,},
        {'text': '14', 'score': 0,},
      ],
    },
    {
      'questionText': ' كم مدة كل جولة في لعبة الملاكمة؟',
      'qAnswer': [
        {'text': 'أربع دقائق لكل جولة', 'score': 0,},
        {'text': 'ستة دقائق لكل جولة', 'score': 0,},
        {'text': 'ثلاثة دقائق لكل جولة', 'score': 10,},
        {'text': 'سبعة دقائق لكل جولة', 'score': 0,},
      ],
    },
    {
      'questionText': 'متى أصبحت كرة اليد في القاعات الداخلية جزءاً من الألعاب الأولمبية؟',
      'qAnswer': [
        {'text': 'عام 1980', 'score': 0,},
        {'text': 'عام 1972', 'score': 10,},
        {'text': 'عام 1953', 'score': 0,},
        {'text': 'عام 1961', 'score': 0,},
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
          title: Text('أسئلة رياضية',
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
