import 'package:ebuy_250/Pages/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/HomePage/BidList.dart';
import '../widgets/HomePage/NavBar.dart';
import '../widgets/HomePage/PostLinkWidget.dart';
import '../widgets/HomePage/StatusWidget.dart';
import '../widgets/HomePage/searchWidget.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();

  void onTap() {
  }
}

class _HomePage extends State<HomePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e5e7) ,
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Share Experiences"),
        centerTitle: true,
        backgroundColor: Color(0xfff57BEE7),
      ),
      body:Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Search(),
              PostLinkWiget(),
              //BidList(),
              StatusWiget(),
              StatusWiget(),
              StatusWiget(),
            ],
          ),
        ),
      ),
    );
  }
  signUserIn() {
  }
}