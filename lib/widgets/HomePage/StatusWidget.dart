
import 'package:ebuy_250/widgets/HomePage/BidList.dart';
import 'package:ebuy_250/widgets/HomePage/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MsgButton.dart';
class StatusWiget extends StatefulWidget{
  const StatusWiget({super.key});
  @override
  State<StatusWiget> createState() => _StatusWiget();
}

class _StatusWiget extends State<StatusWiget>{

  @override
  Widget build(BuildContext context) {

    return Container(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox( height: 6 ),
                    Text(
                        "Mr. XYZ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox( height: 2 ),
                    Text(
                      "9:15 PM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox( height: 20, ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16,0,16,0),
              child: Column(
                children: [
                  Text("#Asking_for_sale Full fresh & new in condition. Use only 3 months.\nPrice- 5800/- \nAlso provide cash memo if you want.\nI will inbox you.\nThank you ❤️"),
                  SizedBox( height:  10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage('assets/weardrobe.jpg'),
                    ),
                  ),
                  SizedBox( height: 10),

                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext){
                            return BidList();
                          },
                        );
                      },
                      child: Text(
                        'See Others Bid',
                        textAlign: TextAlign.left,
                      ),
                  ),
                padding: EdgeInsets.fromLTRB(16,0,16,10),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16,0,16,10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Place Your Bid \$ ',
                        hintStyle: TextStyle(fontSize: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff57BEE7)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Button(
                    text: 'Bid',
                    onTap: () {  },
                  ),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}