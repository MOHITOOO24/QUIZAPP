import 'package:application1/Services/auth.dart';
import 'package:application1/components/home.dart';
import 'package:application1/components/signup.dart';
import 'package:application1/helper/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  late String email, password;
  AuthServices authservice = new AuthServices();

  bool _isloading = false;

  signin() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });

      await authservice.signinpassword(email, password).then((val) {
        if (val != null) {
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/login.jpg"),
                ),
                Text("Welcome",
                    style: TextStyle(
                      fontSize: 20,
                    )),
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
                                  return val!.isEmpty
                                      ? "Enter  Password"
                                      : null;
                                },
                                decoration:
                                    InputDecoration(hintText: "Password"),
                                onChanged: (val) {
                                  password = val;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  signin();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30)),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Sign in ",
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
                                    "Dont have naccount ??",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                   Navigator.pushReplacement(context, MaterialPageRoute(
                                     builder: (context)=> Signup()
                                   ));
                                 },
                                    child: Text(
                                    "Sign up",
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
            ),
          )),
    );
  }
}
