import 'package:ebuy_250/Pages/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavBar extends StatelessWidget{

  const NavBar({super.key});

  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(
                  'Amit Hassan Joy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                  'test@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xfff57BEE7),
              image: DecorationImage(
                image: AssetImage('assets/navbar_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),



          ListTile(
            leading: Icon(Icons.person),
            title: Text('P R O F I L E'),
            onTap:  (){
              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => ProfilePage())
              );
            },
          ),


          ListTile(
            leading: Icon(Icons.message),
            title: Text('M E S S A G E S'),
            onTap:  () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),

                  ),
                ),
              ),
            ),
          ),


          ListTile(
            leading: Icon(Icons.share),
            title: Text('S H A R E'),
            onTap:  () => null,
          ),


          ListTile(
            leading: Icon(Icons.settings),
            title: Text('S E T T I N G S'),
            onTap:  () => null,
          ),


          ListTile(
            leading: Icon(Icons.policy),
            title: Text('P O L I C E S'),
            onTap:  () => null,
          ),


          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('D A S H B O A R D'),
            onTap:  () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '11',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),

                  ),
                ),
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('L O G O U T'),
            onTap:  signOut,
          ),
        ],
      ),
    );
  }
}