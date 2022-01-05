import 'package:flutter/material.dart';
import 'package:quizapp/view/answer_view.dart';
import 'package:quizapp/view/quesion_view.dart';
import 'package:quizapp/view/result.dart';

class MilestonesQuestions extends StatefulWidget {
  @override
  _MilestonesQuestionsState createState() => _MilestonesQuestionsState();
}

class _MilestonesQuestionsState extends State<MilestonesQuestions> {
  final List<Map<String, dynamic>> question = [
    {
      'questionText': 'أين يقع معبد بوروندي؟',
      'qAnswer': [
        {'text': 'فلندا', 'score': 0,},
        {'text': 'أوروبا', 'score': 0,},
        {'text': 'أندونسيا', 'score': 10,},
        {'text': 'فرنسا', 'score': 0,},
      ],
    },
    {
      'questionText': 'أعلى قمة جبل في أفريقيا؟',
      'qAnswer': [
        {'text': 'كليمنجارو', 'score': 10,},
        {'text': 'الأطلس', 'score': 0,},
        {'text':'سانت كاترين' , 'score': 0,},
        {'text': 'بوليفيا', 'score': 0,},
      ],
    },
    {
      'questionText': 'أين يقع هيكل الكولوسيوم؟',
      'qAnswer': [
        {'text': 'اسيا', 'score': 0,},
        {'text': 'روما الحديثة', 'score': 10,},
        {'text': 'اليابان', 'score': 0,},
        {'text': 'انجلترا', 'score': 0,},
      ],
    },
    {
      'questionText': 'أين يقع ميناء فيكتوريا؟',
      'qAnswer': [
        {'text': 'فلندا', 'score': 0,},
        {'text': 'هولندا', 'score': 0,},
        {'text': 'باريس', 'score': 0,},
        {'text': 'هونغ كونغ', 'score': 10,},
      ],
    },
    {
      'questionText': 'أين يقع قصر جيونغ بوكينج؟',
      'qAnswer': [
        {'text': 'كوريا الجنوبية', 'score': 10,},
        {'text': 'كوريا الشمالية', 'score': 0,},
        {'text': 'أمريكا الشمالية', 'score': 0,},
        {'text': 'أمريكا الجنوبية', 'score': 0,},
      ],
    },
    {
      'questionText': 'أصغر دولة من حيث المساحة في العالم؟',
      'qAnswer': [
        {'text': 'قطر', 'score': 0,},
        {'text': 'البحرين', 'score': 0,},
        {'text': 'الفاتيكان', 'score': 10,},
        {'text': 'فلسطين', 'score': 0,},
      ],
    },
    {
      'questionText': 'أين تقع دار أبرا؟',
      'qAnswer': [
        {'text': 'مدينة البتراء', 'score': 0,},
        {'text': 'مدينة سيدني', 'score': 10,},
        {'text': 'مدينة تولوم', 'score': 0,},
        {'text': 'المدينة المحرمة', 'score': 0,},
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
          title: Text('أسئلة المعالم ',
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
