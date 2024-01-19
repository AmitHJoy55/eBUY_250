import 'package:ebuy_250/Pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ebuy_250/components/my_button.dart';
import 'package:ebuy_250/components/my_textfield.dart';
import 'package:ebuy_250/components/square_tile.dart';
import 'forget_pass.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}
class _LoginPage extends State<LoginPage>{
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //Error Massage
  void DisplayError(String Msg){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(Msg),
        )
    );
  }
  // sign user in method
  void signUserIn ()async{
    //loading
    showDialog(
      context: context,
      builder: (context)=> const Center(child: CircularProgressIndicator(),),
    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      DisplayError(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('assets/login.png'),
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
                // welcome back
                const SizedBox(height: 10),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),
                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
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

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPass()) );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),
                // sign in button
                MyButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),

                const SizedBox(height: 12),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/google.png'),
                    SizedBox(width: 10),
                    // apple button
                    SquareTile(imagePath: 'assets/apple.png')
                  ],
                ),

                const SizedBox(height: 10),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 3),
                    TextButton(
                      child: Text(
                        'Register now',
                        style: TextStyle(color : Colors.blue,
                          fontWeight: FontWeight.bold,),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegPage()) );
                      },
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
      ),
    );
  }
}