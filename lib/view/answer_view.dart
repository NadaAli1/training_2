import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String qAnswer,qAnswer2;
  final Function() onpressed;
  final Function() onpressed2;
  Answer(this.qAnswer,this.qAnswer2,this.onpressed,this.onpressed2);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: RaisedButton(
                    color:Colors.cyan,
                    child: Text(
                      qAnswer,
                    style: TextStyle(
                      color:Colors.black,
                    ),
                    ),
                    onPressed:
                      onpressed

                ),
              ),
              SizedBox(width:  100,),
              Expanded(
                child: RaisedButton(
                  color: Colors.cyan,
                    child: Text(qAnswer2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    onPressed:
                      onpressed2
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
