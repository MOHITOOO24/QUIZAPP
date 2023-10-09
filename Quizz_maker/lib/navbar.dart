import 'package:application1/components/createquiz.dart';
import 'package:flutter/material.dart';
 
 class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NavBarState();
}

class _NavBarState extends State<NaviBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text("Welcome",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),), 
          accountEmail: Text(""),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network("https://media.newyorker.com/photos/5f01e383b975762d612e0ff3/2:2/w_746,h_746,c_limit/Barasch-Avatar.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.cover,),
              
            ),
          ),),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("home"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("CreateQuizz"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>CreateQuizz()

              ));
            },
          )
          
         
        ],
      ),
    );
  }
}