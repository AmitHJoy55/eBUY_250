import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy_250/components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget{
  const ProfilePage ({ super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>{
  final currentUser = FirebaseAuth.instance.currentUser!;
  //All users
  final usersCollection = FirebaseFirestore.instance.collection("Users");


  //Edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text("Edit "+ field ,
            style: TextStyle(color:Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (value){
              newValue = value ;
            },
          ),
          actions: [
            //Cancel button
            TextButton(
                child: Text('Cancel', style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context),
            ),
            //Save button
            TextButton(
              child: Text('Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(newValue),
            ),
          ],
        ),
    );
    //Update in firestore
    if(newValue.trim().isNotEmpty ){
      //only update if there is something in the text field
      await usersCollection.doc(currentUser.email).update({field: newValue}) ;
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("User Profile"),
        backgroundColor: Colors.grey[400],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            //get user data
            final userData = snapshot.data!.data() as Map<String ,dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 50),
                //Profile Picture
                Icon(
                  Icons.person,
                  size: 72,
                ),

                const SizedBox(height: 10),
                //User Email
                Text(currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),

                const SizedBox(height: 50),
                //User details
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child:Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[600]),
                  ) ,
                ),

                //User name
                MyTextBox(
                  text: userData['userName'],
                  sectionName: 'username',
                  onPressed: () => editField('username'),
                ),
                //Bio
                MyTextBox(
                  text: userData['bio'],
                  sectionName: 'bio',
                  onPressed: () => editField('bio'),
                ),
              ],
            );
            }
          else if(snapshot.hasError){
            return Center(child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(child: CircularProgressIndicator(),
            );
          },
        ) ,
      );
  }
}