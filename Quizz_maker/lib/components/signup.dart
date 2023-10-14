import 'package:application1/Services/auth.dart';
import 'package:application1/components/home.dart';
import 'package:application1/helper/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:application1/components/signin.dart';
import 'package:application1/Supporting_files/title.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  late String email, password, name;
  AuthServices authServices = new AuthServices();

  bool _isloading = false;

  signup() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      authServices.signupwithemailpassword(email, password).then((value) {
        if (value != null) {
          setState(() {
            _isloading = false;
          });
          Helperfn.saveuserlogindetail(isloggedin: true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Padding(
          padding: const EdgeInsets.all(90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                child: _isloading
                    ? Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (val) {
                                return val!.isEmpty ? "Enter  name" : null;
                              },
                              decoration: InputDecoration(hintText: "name"),
                              onChanged: (val) {
                                name = val;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                return val!.isEmpty ? "Enter  Emailid" : null;
                              },
                              decoration: InputDecoration(hintText: "email"),
                              onChanged: (val) {
                                email = val;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val!.isEmpty ? "Enter  Password" : null;
                              },
                              decoration: InputDecoration(hintText: "Password"),
                              onChanged: (val) {
                                password = val;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                signup();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 59, 180, 255),
                                    borderRadius: BorderRadius.circular(30)),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Sign up ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Wrap(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account",
                                  style: TextStyle(fontSize: 12),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Signin()));
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
              )
            ],
          )),
    );
  }
}
