import 'package:flutter/material.dart';
import 'package:quizapp/view/answer_view.dart';
import 'package:quizapp/view/quesion_view.dart';
import 'package:quizapp/view/result.dart';

class ArtisticQuestions extends StatefulWidget {
  @override
  _ArtisticQuestionsState createState() => _ArtisticQuestionsState();
}

class _ArtisticQuestionsState extends State<ArtisticQuestions> {
  final List<Map<String, dynamic>> question = [
    {
      'questionText': 'من هي بطلة فيلم “من 30 سنة“؟',
      'qAnswer': [
        {'text': 'شادية', 'score': 0,},
        {'text': 'حنان ترك', 'score': 0,},
        {'text': 'منى زكى', 'score': 10,},
        {'text': 'عبلة كامل', 'score': 0,},
      ],
    },
    {
      'questionText': 'من هو بطل مسلسل “رأس الغول“؟',
      'qAnswer': [
        {'text': 'محمود عبد العزيز', 'score': 10,},
        {'text': 'عادل امام', 'score': 0,},
        {'text':'يحي الفخرانى' , 'score': 0,},
        {'text': 'نور الشريف', 'score': 0,},
      ],
    },
    {
      'questionText': 'من هو مخرج مسلسل “تحت السيطرة“؟',
      'qAnswer': [
        {'text': 'رامى امام', 'score': 0,},
        {'text': 'تامر حسين', 'score': 10,},
        {'text': 'محمد جمال العدل', 'score': 0,},
        {'text': 'شادى على', 'score': 0,},
      ],
    },
    {
      'questionText': 'من هو مخرج فيلم “الفيل الأزرق“؟',
      'qAnswer': [
        {'text': 'بيتر ميمي', 'score': 0,},
        {'text': 'عمرو صالح', 'score': 0,},
        {'text': 'سعيد حامد', 'score': 0,},
        {'text': 'مروان حامد', 'score': 10,},
      ],
    },
    {
      'questionText': 'من مغنية أغنية”مسك الليل“؟',
      'qAnswer': [
        {'text': 'سعاد ماسي', 'score': 10,},
        {'text': 'شيرين', 'score': 0,},
        {'text': 'بلقيس', 'score': 0,},
        {'text': 'جميلة', 'score': 0,},
      ],
    },
    {
      'questionText': 'في أى عام بدأت سلسلة أفلام العراب؟',
      'qAnswer': [
        {'text': '1970', 'score': 0,},
        {'text': '1971', 'score': 0,},
        {'text': '1972', 'score': 10,},
        {'text': '1973', 'score': 0,},
      ],
    },
    {
      'questionText': 'ما هو اسم أول مطرب ظهر في الأفلام؟',
      'qAnswer': [
        {'text': 'عبد الحليم حافظ', 'score': 0,},
        {'text': 'محمد عبد الوهاب', 'score': 10,},
        {'text': 'فريد الأطرش', 'score': 0,},
        {'text': 'محمد فوزى', 'score': 0,},
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
          title: Text('أسئلة فنية',
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
