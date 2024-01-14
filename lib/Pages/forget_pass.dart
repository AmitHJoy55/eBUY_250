import 'package:ebuy_250/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ebuy_250/components/my_button.dart';
import 'package:ebuy_250/components/my_textfield.dart';
import 'package:ebuy_250/components/square_tile.dart';

class ForgetPass extends StatefulWidget{
  const ForgetPass({super.key});
  @override
  State<ForgetPass> createState() => _ForgetPass();
}
void Confirm() {

}
class _ForgetPass extends State<ForgetPass>{

  final usernameController = TextEditingController();
  final newpasswordController = TextEditingController();
  final oldpasswordController = TextEditingController();
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
    'Forgotten Password!',
    style: TextStyle(
    color: Colors.deepOrangeAccent,
    fontSize: 16,
    ),
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
    controller: oldpasswordController,
    hintText: 'Old Password',
    obscureText: true,
    ),
      const SizedBox(height: 10),
      // password textfield
      MyTextField(
        controller: newpasswordController,
        hintText: 'New Password',
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
                "Confirm",
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