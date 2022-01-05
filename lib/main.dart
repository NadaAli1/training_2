import 'package:flutter/material.dart';
import 'package:quizapp/questions_type/question_type.dart';

main()=>runApp(MyApp());
bool isSwitched=false;
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuestionTypes(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.cyan,),

      ),

    );
  }
}