
import 'package:flutter/material.dart';
import 'Button.dart';
import 'PostWidget.dart';
class PostLinkWiget extends StatefulWidget{
  const PostLinkWiget({super.key});
  @override
  State<PostLinkWiget> createState() => _PostLinkWiget();
}

class _PostLinkWiget extends State<PostLinkWiget>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child : ClipOval(
                      child: Image.network(
                        'https://img.freepik.com/free-photo/handsome-corporate-man-real-estate-agent-assistant-smiling-hold-hands-together-how-may-i-help-you-smiling-friendly-polite-assist-customer-white-background_176420-45257.jpg?w=996&t=st=1705735955~exp=1705736555~hmac=8b6d7cf85c43fd116810e69314d8ce0b51d61574c6a967676b88b87b41396b11',
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded (
                    child: TextField(

                      decoration: InputDecoration(
                        hintText: 'Buy/Sell your Experience',
                        hintStyle: TextStyle(fontSize: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff353D77)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Icon(Icons.attach_file),
                  SizedBox(width: 16.0),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                child: Button(
                  text:'Post',
                  onTap: (){},
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  PostWiget()) );
      },
    );
  }
}