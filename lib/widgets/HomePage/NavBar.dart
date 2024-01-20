import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy_250/Pages/home_page.dart';
import 'package:ebuy_250/Pages/login_page.dart';
import 'package:ebuy_250/Pages/message_page.dart';
import 'package:ebuy_250/Pages/notification_page.dart';
import 'package:ebuy_250/Pages/policy_page.dart';
import 'package:ebuy_250/Pages/setting_page.dart';
import 'package:ebuy_250/Pages/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavBar extends StatelessWidget{

    NavBar({super.key});
   final currentUser = FirebaseAuth.instance.currentUser!;
   //All users
   final usersCollection = FirebaseFirestore.instance.collection("Users");


  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Color(0xfff57BEE7),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text( 'Amit Hassan Joy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                currentUser.email!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://img.freepik.com/free-photo/handsome-corporate-man-real-estate-agent-assistant-smiling-hold-hands-together-how-may-i-help-you-smiling-friendly-polite-assist-customer-white-background_176420-45257.jpg?w=996&t=st=1705735955~exp=1705736555~hmac=8b6d7cf85c43fd116810e69314d8ce0b51d61574c6a967676b88b87b41396b11',
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
            title: Text('P R O F I L E', ),
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
            onTap:  () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagePage()) ),
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
            leading: Icon(Icons.notification_add),
            title: Text('N O T I F I C A T I O N S'),
            onTap:  () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()) ),
          ),


          ListTile(
            leading: Icon(Icons.settings),
            title: Text('S E T T I N G S'),
            onTap:  () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()) ),
          ),


          ListTile(
            leading: Icon(Icons.policy),
            title: Text('P O L I C E S'),
            onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => PoliciesPage()) ),
          ),


          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('D A S H B O A R D'),
            onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()) ),
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
            onTap:  (){
              signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()) );
            },
          ),
        ],
      ),
    );
  }
}