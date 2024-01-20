import 'package:ebuy_250/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ebuy_250/components/my_button.dart';
import 'package:ebuy_250/components/my_textfield.dart';
import 'package:ebuy_250/components/square_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart';


class RegPage extends StatefulWidget{

  @override
  State<RegPage> createState() => _RegPage();
}

class _RegPage extends State<RegPage>{
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //Error msg
  void DisplayError(String Msg){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(Msg),
        )
    );
  }

  void signUp() async {
    showDialog(
      context: context,
      builder: (context)=> const Center(
        child: CircularProgressIndicator(),
      ),
    );
    if(passwordController.text != confirmpasswordController.text){
      Navigator.pop(context);
      DisplayError("Passwords don't match");
      return;
    }

    try{

      //Trying to Creat a new user
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //After creating the user creat a new document in cloud firestore called users
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
      .set({
        'userName' :usernameController.text ,//initial username
        'bio' : 'Empty bio..'
      });



      FirebaseFirestore.instance.collection('users').add({
        'username': usernameController.text,
        'email': emailController.text,
      });

      if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      DisplayError(e.code);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage()) );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:  Colors.white,
        body: Container(
            decoration: BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage('assets/register.png'),
                  fit: BoxFit.cover,
                )
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // logo
                    Image(image: AssetImage('assets/eBuy_logo.png'),
                      width: 100,
                    ),

                    const SizedBox(height: 10),

                    // welcome back, you've been missed!
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // username textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // username textfield
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),
                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    // password textfield
                    MyTextField(
                      controller: confirmpasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    MyButton(onTap: signUp, text: 'Sign Up'),
                  ]
              ),
              ),
            )
        )


    );

  }
}