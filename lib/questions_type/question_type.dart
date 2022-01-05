import 'package:flutter/material.dart';
import 'package:quizapp/quetions/acient_question.dart';
import 'package:quizapp/quetions/artistic_questions.dart';
import 'package:quizapp/quetions/culture_questions.dart';
import 'package:quizapp/quetions/math_questions.dart';
import 'package:quizapp/quetions/milestones_questions.dart';
import 'package:quizapp/quetions/sports_questions.dart';
class QuestionTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(' اختر نوع الأسئلة',style: TextStyle(
         // color: Colors.black,
          fontWeight: FontWeight.bold,
        ),)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AcientQuestion()));},
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage('assets/acient.jpg')),
                          ),
                        ),
                        Text('تاريخية',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SportsQuestions()));},
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage('assets/sports.jpg'),fit: BoxFit.fitHeight),
                          ),
                        ),
                        Text('رياضية',style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtisticQuestions()));},
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage('assets/f.jpg')),
                          ),
                        ),
                        Text('فنية',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CultureQuestion()));},
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage('assets/d.jpg'),fit: BoxFit.fitHeight),
                          ),
                        ),
                        Text('ثقافية',style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MilestonesQuestions()));},
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage('assets/m.jpg'),fit: BoxFit.fitHeight),
                          ),
                        ),
                        Text('معالم',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MathQuestions()));},
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage('assets/math.jpg'),fit: BoxFit.fitHeight),
                          ),
                        ),
                        Text('رياضيات',style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
