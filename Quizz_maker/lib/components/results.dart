
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int correct1,incorrect,total;
   Result({required this.correct1,required this.incorrect,required this.total});

  @override
  State<Result> createState() => _ResultsState();
}

class _ResultsState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.correct1}/${widget.incorrect}",style: TextStyle(fontSize: 25)),
              SizedBox(height: 10,),
              Text("You answered ${widget.correct1} answers  correctly " " and ${widget.incorrect} answers incorrectly",style: TextStyle(fontSize: 15,color: Colors.grey,),
              textAlign: TextAlign.center,),
              SizedBox(height: 14,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                   
                },
                 child: Container(

                   margin: EdgeInsets.all(40),
                   
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)
                         ),
                         height: 50,
                         width: MediaQuery.of(context).size.width,
                         child: Text("Go To Home ",style: TextStyle(color: Colors.white, fontSize: 15),),
                         ),)
            ],
          ),
        ),
      ),
    );
  }
}