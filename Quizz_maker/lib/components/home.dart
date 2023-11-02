import 'package:application1/Services/database.dart';
import 'package:application1/Supporting_files/title.dart';
import 'package:application1/components/createquiz.dart';
import 'package:application1/components/playquiz.dart';
import 'package:application1/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Stream ?  quizStream;
  Databaseservice databaseservice= new Databaseservice();

  Widget quizlist(){
    return Container(
      
      child:StreamBuilder(
      stream: quizStream,  
      builder: (context,snapshot) {
        if (snapshot.data == null) {
          return Container();
        } else {
          return ListView.builder(
          itemCount:snapshot.data.docs.length,
          itemBuilder :(context,index){
            return QuizTile(imgUrl: snapshot.data.docs[index].data()["quizimageurl"],
             title: snapshot.data.docs[index].data()["quizTitle"], 
             desc: snapshot.data.docs[index].data()["quizDescription"],
             quizid:snapshot.data.docs[index].data()["quiId"],
             ); 
           } );
        }

      },
    ),
    );
  }
 @override
  void initState() {
    databaseservice.getQuizData().then((val){
       setState(() {
         quizStream=val;
       });

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
       drawer: NaviBar(),
      appBar: AppBar(
        
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
        title: appBar(context),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: quizlist(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CreateQuizz()
          ));

        },
      ),
    );
  }
}
 
 class QuizTile extends StatelessWidget {

  late final String imgUrl,title,desc;
  final String quizid;

  QuizTile({required this.imgUrl,required this.title,required this.desc,required this.quizid});
  

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => playQuiz(
            quizId: quizid,
          )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 150,
       padding: EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(imgUrl,width: MediaQuery.of(context).size.width,fit:BoxFit.cover,)),
            Container(
              
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                  SizedBox(height: 6,),
                  Text(desc,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                ],
              ),
            )
          ],
          
          ),
      ),
    );
  }
}