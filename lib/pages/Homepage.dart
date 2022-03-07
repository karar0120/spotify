


import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify/json/songs_json.dart';
import 'package:spotify/themes/colors.dart';

import 'Album_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  var activecolor1=0;
  var activecolor2=0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: PreferredSize(preferredSize: Size.fromHeight(60),child: getAppbar(),),
      body: getbody(),
    );
  }
  Widget getAppbar(){
   return AppBar(
     elevation: 0,
     backgroundColor: black,
     title: Padding(
       padding: const EdgeInsets.only(right: 10,left: 10),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text("Explore",style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20,
             color: white,
           ),),
           Icon(Entypo.list)
         ],
       ),
     ),
   );
  }
  Widget getbody(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,top:20),
                  child: Row(
                    children: List.generate(song_type_1.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              activecolor1=index;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text("${song_type_1[index]}",style: TextStyle(
                                fontSize: 15,color:activecolor1==index?primary:grey,fontWeight: FontWeight.w600
                              ),),
                              SizedBox(
                                height: 3,
                              ),
                              activecolor1==index?Container(
                                width: 10,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ):Container(),

                            ]
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Row(
                    children: List.generate(songs.length-5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(
                              alignment:Alignment.bottomCenter,
                                child: AlbumPage(
                              songs:songs[index] ,
                            ), type: PageTransitionType.scale));
                          },
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(songs[index]['img']),
                                    fit: BoxFit.cover
                                  ),
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(songs[index]['title'],style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: white,
                              ),),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 180,
                                child: Text(songs[index]['description'],
                                  maxLines:1,
                                  textAlign:TextAlign.center,
                                  //overflow:TextOverflow.ellipsis,
                                  style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: grey,

                                ),),
                              )

                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ]
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30,top:20),
              child: Row(
                children: List.generate(song_type_2.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          activecolor2=index;
                        });
                      },
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text("${song_type_2[index]}",style: TextStyle(
                                fontSize: 15,color:activecolor2==index?primary:grey,fontWeight: FontWeight.w600
                            ),),
                            SizedBox(
                              height: 3,
                            ),
                            activecolor2==index?Container(
                              width: 10,
                              height: 3,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ):Container(),

                          ]
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 20,),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left:30),
              child: Row(
                children: List.generate(songs.length-5, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            alignment:Alignment.bottomCenter,
                            child: AlbumPage(
                              songs:songs[index+5] ,
                            ), type: PageTransitionType.scale));
                      },
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(songs[index+5]['img']),
                                    fit: BoxFit.cover
                                ),
                                color: primary,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(songs[index+5]['title'],style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 180,
                            child: Text(songs[index+5]['description'],
                              maxLines:1,
                              textAlign:TextAlign.center,
                              //overflow:TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: grey,

                              ),),
                          )

                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
