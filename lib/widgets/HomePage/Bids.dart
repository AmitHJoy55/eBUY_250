//this is for statefull
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class OthersBid extends StatefulWidget{
  const OthersBid({super.key});
  @override
  State<OthersBid> createState() => _OthersBid();
}

class _OthersBid extends State<OthersBid>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xfff57BEE7), // Set the border color
          width: .8, // Set the border width
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child : ClipOval(
                    child: Image.network(
                      'https://img.freepik.com/free-photo/handsome-corporate-man-real-estate-agent-assistant-smiling-hold-hands-together-how-may-i-help-you-smiling-friendly-polite-assist-customer-white-background_176420-45257.jpg?w=996&t=st=1705735955~exp=1705736555~hmac=8b6d7cf85c43fd116810e69314d8ce0b51d61574c6a967676b88b87b41396b11',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox( height: 6 ),
                    Text(
                      "Mr. XYZ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    Text(
                      "8:17 PM",
                    ),

                    Container(
                      width: 100, // Set the width to ensure the Divider spans the full width
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                    Text(
                      " \$-12.60",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox( height: 5),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}