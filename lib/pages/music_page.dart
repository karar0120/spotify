


import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify/themes/colors.dart';

class musicPage extends StatefulWidget {
  final String title;
  final String songsUrl;
  final String image;
  final String descraption;
  final Color color;

  const musicPage({Key? key, required this.title, required this.songsUrl, required this.image, required this.descraption, required this.color}) : super(key: key);

  @override
  _musicPageState createState() => _musicPageState();
}

class _musicPageState extends State<musicPage> {
  @override
  double sliderTextController=20;
  AudioPlayer ?advancedPlayer;
  AudioCache ?audioCache;
  bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songsUrl);
  }

  playSound(localPath) async {
    await audioCache?.play(localPath);
  }

  stopSound(localPath) async {
    Uri audioFile = await audioCache!.load(localPath);
    await advancedPlayer?.setUrl(audioFile.path);
    advancedPlayer?.stop();
  }

  seekSound() async {
    Uri audioFile = await audioCache!.load(widget.songsUrl);
    await advancedPlayer!.setUrl(audioFile.path);
    advancedPlayer?.seek(Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stopSound(widget.songsUrl);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: PreferredSize(preferredSize:Size.fromHeight(60),child: getAppbar(),),
      body: getbody(),
    );
  }
  Widget getAppbar(){
    return AppBar(
      backgroundColor: black,
      elevation: 0.0,
      actions: [
        IconButton(
            onPressed:(){},
            icon:Icon(Feather.more_vertical,color: white,))
      ],
    );
  }
  Widget getbody(){
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                  child: Container(
                    height:size.width-100 ,
                    width: size.width-100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius:50,
                          spreadRadius: 5,
                          color: widget.color,
                          offset: Offset(-10,40)
                        )
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                  child: Container(
                    height:size.width-60 ,
                    width: size.width-60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          widget.image,
                        ),
                        fit:BoxFit.cover,
                      )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right:10),
              child: Container(
                width: size.width-80,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(AntDesign.addfolder,color: white,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.title,style: TextStyle(
                          fontSize: 18,
                          color: white,
                          fontWeight: FontWeight.bold
                        ),),
                        Container(
                          width: 150,
                          child: Text(
                            widget.descraption,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: white.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                    ),
                    Icon(Feather.more_vertical,color: white,),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Slider(
              activeColor: primary,
                value: sliderTextController,
                min: 0,
                max: 200,
                onChanged: (value){
                setState(() {
                  sliderTextController=value;
                });
                seekSound();
                }),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1:50",style: TextStyle(color: white.withOpacity(0.5)),),
                  Text("4:68",style: TextStyle(color: white.withOpacity(0.5)),),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Feather.shuffle,size: 25,color: white.withOpacity(0.8),)),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Feather.skip_back,size: 25,color: white.withOpacity(0.8),)),
                  IconButton(
                    iconSize: 50,
                      onPressed: (){
                      if (isPlaying){
                        stopSound(widget.songsUrl);
                        setState(() {
                          isPlaying=false;
                        });

                      }else{
                        playSound(widget.songsUrl);
                        setState(() {
                          isPlaying=true;
                        });
                      }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          color: primary,
                          shape: BoxShape.circle
                        ),
                        child: Center(
                          child:isPlaying?
                          Icon(
                            Entypo.controller_stop,
                            size: 28,
                            color: white,
                          ):Icon(
                            Entypo.controller_play,
                            size: 28,
                            color: white,
                          ),
                        ),
                      )),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Feather.skip_forward,size: 25,color: white.withOpacity(0.8),)),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(AntDesign.retweet,size: 25,color: white.withOpacity(0.8),))
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Feather.tv,
                color: primary,
                size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text("Chromecast is ready",style: TextStyle(
                    color: primary
                  ),),
                )
              ],
            )
          ],

        )

    );
  }
}
