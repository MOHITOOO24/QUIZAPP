
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../Services/database.dart';
import '../Supporting files/title.dart';

class AddQuestion extends StatefulWidget {
   final String  quizId;
  AddQuestion({required this.quizId,});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formkey=GlobalKey<FormState>();
  late String question,option1,option2,option3,option4;

  Databaseservice databaseservice=new Databaseservice();

  bool _isloading=false;

  upLoadQuestiondata () async {
    if( _formkey.currentState!.validate()){

      setState(() {
        _isloading=true;
      });

    Map<String,String>  questionmap={
      "question":question ,
      "option1":option1,
      "option2":option2,
      "option3":option3,
      "option4":option4
    };
   await databaseservice.addQuestionData(questionmap, widget.quizId).then((value) {
      setState(() {
        _isloading=false;
      });
    });

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        iconTheme: IconThemeData(color: Colors.black45),
      ),
      body: _isloading?Container(
        child: Center(child: CircularProgressIndicator(),),
      ): Form (
        key: _formkey,
        child: Container(
           padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            TextFormField(
                        validator: (val){return val!.isEmpty? "Enter  Question" : null;},
                         decoration: InputDecoration(
                           hintText: "Enter Question"
                         ),
                         onChanged: (val) {
                            question=val;
                         },
                ),
                SizedBox(height: 10,),
      
                TextFormField(
                        validator: (val){return val!.isEmpty? "Enter Option1" : null;},
                         decoration: InputDecoration(
                           hintText: "Enter Option1 (correct answer)"
                         ),
                         onChanged: (val) {
                            option1=val;
                         },
                ),
                SizedBox(height: 10,),
      
                TextFormField(
                        validator: (val){return val!.isEmpty? "Enter  Option2" : null;},
                         decoration: InputDecoration(
                           hintText: "Enter Option2"
                         ),
                         onChanged: (val) {
                            option2=val;
                         },
                ),
                SizedBox(height: 10,),
      
               
          
        ),
      ),
    );
  }
}