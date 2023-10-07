import 'package:application1/components/home.dart';
import 'package:application1/helper/function.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'components/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool _isloggedin=false;

  @override
  void initState() {
    checkuserloggedinstatus();
    super.initState();
  }

  checkuserloggedinstatus() async {
    await Helperfn.getuserloggedindetail(isloggedin: _isloggedin);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: _isloggedin ?  Home() : const Signin(),
    );
  }
}

