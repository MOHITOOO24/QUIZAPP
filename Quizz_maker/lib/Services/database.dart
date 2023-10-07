
import 'package:cloud_firestore/cloud_firestore.dart';

class Databaseservice{
  String? get quizId => null;


  Future<void> addquizdata(Map quizData, String quizId) async{
    await FirebaseFirestore.instance.collection("Quiz").doc(quizId).set(quizData as Map<String, String>).catchError((e){
      print(e.toString());
    });
  }
  Future<void> addQuestionData(Map questionData,String quizId) async{
    // ignore: body_might_complete_normally_catch_error
    await FirebaseFirestore.instance.collection("Quiz").doc(quizId).collection("QNA").add(questionData as Map<String, String>).catchError((e){
      print(e);
    });
    
  }

   getQuizData( ) async {
      // ignore: await_only_futures
      return await FirebaseFirestore.instance.collection("Quiz").snapshots();
    }

    getQuizzData(String quizId) async{
      return await FirebaseFirestore.instance.collection("Quiz").doc(quizId).collection("QNA").get();
    }

  

  
}