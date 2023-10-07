import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthServices{
  FirebaseAuth _auth=FirebaseAuth.instance;
  User1?  _userfromfirebaseUser(User user){
    // ignore: unnecessary_null_comparison
    if (user != null) {
      return User1(uid : user.uid);
    } else {
      return null;
    }
  }
  Future signinpassword(String email,String password) async{
    try{ 
      UserCredential authResult =await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? firebaseUser =authResult.user;
      return _userfromfirebaseUser(firebaseUser!);
    }catch(e){
      print(e.toString());
    }
}
 Future signupwithemailpassword(String email,String password ) async{
   try{
     UserCredential  authResult= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser =authResult.user;
      return _userfromfirebaseUser(firebaseUser!);
   }catch(e){
      print(e.toString());
      }
 }
 Future SignoutI() async{
   try {
     return await _auth.signOut();
   } catch (e) {
     print(e.toString());
     return null;
   }
 }

  }