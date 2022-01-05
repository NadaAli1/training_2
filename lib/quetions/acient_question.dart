import 'package:flutter/material.dart';
import 'package:quizapp/view/quesion_view.dart';

import '../view/answer_view.dart';
import '../view/result.dart';
class AcientQuestion extends StatefulWidget {

  @override
  _AcientQuestionState createState() => _AcientQuestionState();
}

class _AcientQuestionState extends State<AcientQuestion> {
  final List<Map<String, dynamic>> question = [
    {
      'questionText': 'في أي مدينة وجدت إحدى عجائب العالم القديم ، “الحدائق المعلقة”؟',
      'qAnswer': [
        {'text': 'طرابلس', 'score': 0,},
        {'text': 'البصرة', 'score': 0,},
        {'text': 'بابل', 'score': 10,},
        {'text': 'بغداد', 'score': 0,},
      ],
    },
    {
      'questionText': 'عقد أول معاهدة سلام في التاريخ كانت في عهد الملك من؟',
      'qAnswer': [
        {'text': 'الملك رمسيس الثاني', 'score': 10,},
        {'text': 'الملك رمسيس الأول', 'score': 0,},
        {'text':'الملك رمسيس الثالث' , 'score': 0,},
        {'text': 'الملك امنحتب الرابع', 'score': 0,},
      ],
    },
    {
      'questionText': 'من هو إله الشمس لدى المصريين القدماء؟',
      'qAnswer': [
        {'text': 'اخناتون', 'score': 0,},
        {'text': 'رع', 'score': 10,},
        {'text': 'تحتمس الثالث', 'score': 0,},
        {'text': 'سيتناخت', 'score': 0,},
      ],
    },
    {
      'questionText': 'كم عدد السلالات الحاكمة في مصر القديمة؟',
      'qAnswer': [
        {'text': '40', 'score': 0,},
        {'text': '30', 'score': 0,},
        {'text': '37', 'score': 0,},
        {'text': '31', 'score': 10,},
      ],
    },
    {
      'questionText': 'كم سنة استمرت حضارة مصر القديمة؟',
      'qAnswer': [
        {'text': '3000', 'score': 10,},
        {'text': '4000', 'score': 0,},
        {'text': '5000', 'score': 0,},
        {'text': '6000', 'score': 0,},
      ],
    },
    {
      'questionText': 'كم سنة حكم الملك توت عنخ أمون؟ ',
      'qAnswer': [
        {'text': '11', 'score': 0,},
        {'text': '15', 'score': 0,},
        {'text': '10', 'score': 10,},
        {'text': '9', 'score': 0,},
      ],
    },
    {
      'questionText': 'في أي سنة تم اكتشاف قبر الملك توت عنخ أمون؟',
      'qAnswer': [
        {'text': '1925', 'score': 0,},
        {'text': '1922', 'score': 10,},
        {'text': '1927', 'score': 0,},
        {'text': '1926', 'score': 0,},
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
              title: Text('أسئلة تاريخية',
              style: TextStyle(
                fontWeight: FontWeight.w600,
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
