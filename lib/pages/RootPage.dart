

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify/pages/Homepage.dart';
import 'package:spotify/themes/colors.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var ontap=0;
  List Iconss=[
    Feather.home,
    Feather.book,
    Feather.search,
    Feather.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: getBotton(),
      body: getBody(),
    );
  }
  Widget getBotton(){
    return Container(
      height: 80,
      color: black,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(Iconss.length, (index) {
            return IconButton(onPressed: (){
              setState(() {
                ontap=index;
              });
            },
                icon: Icon(Iconss[index],
                  color:ontap==index?primary:white,));

          }),
        ),
      ),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: ontap,
      children: [
        Homepage(),
        Center (
          child: Text("Book",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),),
        ),
        Center (
          child: Text("Search",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),),
        ),
        Center (
          child: Text("Settings",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),),
        )
      ],
    );
  }
}
