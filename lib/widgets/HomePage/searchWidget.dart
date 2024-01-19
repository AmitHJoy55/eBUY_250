
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Search extends StatefulWidget{
  const Search({super.key});
  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search>{
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
                // Padding(
                //   padding: EdgeInsets.all(16),
                //   child : ClipOval(
                //     child: Image.network(
                //       'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600',
                //       width: 55,
                //       height: 55,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(1.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Your Favourite Deal!',
                        hintStyle: TextStyle(fontSize: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff57BEE7)),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Icon(Icons.search),
                SizedBox(width: 10.0),
              ],

            ),
          ],
        ),
      ),
    );
  }
}