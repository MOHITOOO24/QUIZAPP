import 'package:shared_preferences/shared_preferences.dart';

class Helperfn{

  static String userloggedinkey ="Userloggedinkey";
   
  static saveuserlogindetail({required bool isloggedin}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userloggedinkey, isloggedin);

  }
  static Future<Object?> getuserloggedindetail({required bool isloggedin}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.get(userloggedinkey);
  }
}