import 'package:application1/Services/database.dart';
import 'package:application1/Supporting_files/title.dart';
import 'package:application1/components/addQuestion.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateQuizz extends StatefulWidget {
  const CreateQuizz({super.key});

  @override
  State<CreateQuizz> createState() => _CreateQuizzState();
}

class _CreateQuizzState extends State<CreateQuizz> {
  final _formkey = GlobalKey<FormState>();
  late String quizimageurl, quizTitle, quizDescription, quizId;
  Databaseservice databaseservice = new Databaseservice();

  bool _isloading = false;

  CreateQuizOnline() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });

      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quiId": quizId,
        "quizimageurl": quizimageurl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription,
      };
      await databaseservice.addquizdata(quizMap, quizId).then((value) {
        setState(() {
          _isloading = false;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AddQuestion(
                        quizId: quizId,
                      )));
        });
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        iconTheme: IconThemeData(color: Colors.black45),
      ),
      body: _isloading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formkey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Enter  image URL" : null;
                      },
                      decoration: InputDecoration(hintText: "Enter image Url"),
                      onChanged: (val) {
                        quizimageurl = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Enter title" : null;
                      },
                      decoration: InputDecoration(hintText: "Enter Title"),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Enter  Description" : null;
                      },
                      decoration: InputDecoration(hintText: "Enter Decription"),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          CreateQuizOnline();
                        },
                        child: blueButton(
                          context,
                          "Create Quiz",
                        )),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
