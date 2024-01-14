import 'package:flutter/material.dart';
import 'package:ebuy_250/components/my_button.dart';
import 'package:ebuy_250/components/my_textfield.dart';
import 'package:ebuy_250/components/square_tile.dart';

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
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage()) );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]
                )
            )
        )


    );

  }
}