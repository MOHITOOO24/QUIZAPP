import 'package:application1/Services/database.dart';
import 'package:application1/Supporting_files/quizplaywiddget.dart';
import 'package:application1/Supporting_files/title.dart';
import 'package:application1/components/results.dart';
import 'package:application1/models/Questionmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class playQuiz extends StatefulWidget {
   final String quizId;
   playQuiz({required this.quizId});

  @override
  State<playQuiz> createState() => _playQuizState();
}
int _correct =0;
int _incorrect=0;
int _notattempted=0;
int total=0;
class _playQuizState extends State<playQuiz> {

   Databaseservice databaseservice = new Databaseservice();
   QuerySnapshot ? questionsSnapshot;
   
    

 QuestionModel getQuestionModelFromDatasnapShot(DocumentSnapshot questionsSnapshot){
   QuestionModel questionModel= new QuestionModel();
   questionModel.question=questionsSnapshot["question"];

   List<String> options =[
     questionsSnapshot["option1"],
     questionsSnapshot["option2"],
     questionsSnapshot["option3"],
     questionsSnapshot["option4"],
   ];
   options.shuffle();
   questionModel.option1=options[0];
   questionModel.option2=options[1];
   questionModel.option3=options[2];
   questionModel.option4=options[3];
   questionModel.correctOption =questionsSnapshot["option1"];
   questionModel.answered =false;

   return questionModel;
   
 }

  @override
  void initState() {
    databaseservice.getQuizzData(widget.quizId).then((value){
      questionsSnapshot= value;
      _notattempted=0;
      _correct=0;
      _incorrect=0;
      
      total =questionsSnapshot!.docs.length;

      print("$total this is total");
      setState(() {
        
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
        backgroundColor: Colors.transparent,
      ),
       body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                 questionsSnapshot == null ?
                     Container(
                       child: Center(child: CircularProgressIndicator(),),
                     )
                    : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: questionsSnapshot!.docs.length,
                        itemBuilder: (context, index) {
                          
                          return QuizPlayTile(
                            questionModel: getQuestionModelFromDatasnapShot(questionsSnapshot!.docs[index]), 
                            index: index,
                          );
                        },
                    )
              ],
            ),
          ),     
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(
              builder:(context)=>Result(
                correct1: _correct,
                incorrect: _incorrect,
                total: total,
              )));
          } ),
    );
  }
  

  
  
  
  
}


class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;
  QuizPlayTile({required this.questionModel,required this.index});

  @override
  State<QuizPlayTile> createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {

  String optionSelected = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Q${widget.index+1} ${widget.questionModel.question}",style: TextStyle(fontSize: 18,color: Colors.black87),),
          SizedBox(height: 12,),
          GestureDetector(

            onTap: (){
              if(!widget.questionModel.answered){
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption){
                      optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                     _correct = _correct + 1;
                    _notattempted = _notattempted - 1;
                    setState(() {
                      
                    });

                    }else{
                       optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect= _incorrect+1;
                     _notattempted = _notattempted - 1;
                    setState(() {
                      
                    });

                    }
              }
            },


            child: OptionTile(option: "A",
             description: widget.questionModel.option1, 
             correctanswer: widget.questionModel.correctOption, 
             optionSelected: optionSelected,),
          ),

           SizedBox(height: 12,),
           
          GestureDetector(

            onTap: (){
              if(!widget.questionModel.answered){
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption){
                      optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                     _correct = _correct + 1;
                    _notattempted = _notattempted - 1;
                    print("${widget.questionModel.correctOption}");
                    setState(() {
                      
                    });

                    }else{
                       optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect= _incorrect+1;
                     _notattempted = _notattempted - 1;
                    setState(() {
                      
                    });

                    }
              }
            },

            child: OptionTile(option: "B",
             description: widget.questionModel.option2, 
             correctanswer: widget.questionModel.correctOption, 
             optionSelected: optionSelected,),
          ),

           SizedBox(height: 12,),


          GestureDetector(

            onTap: (){
              if(!widget.questionModel.answered){
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption){
                      optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                     _correct = _correct + 1;
                    _notattempted = _notattempted - 1;
                    setState(() {
                      
                    });

                    }else{
                       optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect= _incorrect+1;
                     _notattempted = _notattempted - 1;
                    setState(() {
                      
                    });

                    }
              }
            },
            child: OptionTile(option: "C",
             description: widget.questionModel.option3, 
             correctanswer: widget.questionModel.correctOption, 
             optionSelected: optionSelected,),
          ),

           SizedBox(height: 12,),

           
          GestureDetector(
            onTap: (){
              if(!widget.questionModel.answered){
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption){
                      optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                     _correct = _correct + 1;
                    _notattempted = _notattempted - 1;
                    setState(() {
                      
                    });

                    }else{
                       optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect= _incorrect+1;
                     _notattempted = _notattempted - 1;
                    setState(() {
                      
                    });

                    }
              }
            },


            child: OptionTile(option: "D",
             description: widget.questionModel.option4, 
             correctanswer: widget.questionModel.correctOption, 
             optionSelected: optionSelected,),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}