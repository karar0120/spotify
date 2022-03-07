
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify/json/songs_json.dart';
import 'package:spotify/pages/music_page.dart';

import '../themes/colors.dart';

class AlbumPage extends StatefulWidget {
  @override
  final dynamic songs;
  const AlbumPage({Key? key, this.songs}) : super(key: key);
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getbody(),
    );
  }
  Widget getbody(){
    List songsAlbum=widget.songs['songs'];
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.songs['img']),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.songs['title']}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: white
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
                        child: Text("Subscribe",style: TextStyle(color: white),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Row(
                    children: List.generate(songs.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(
                                alignment:Alignment.bottomCenter,
                                child: musicPage(
                                  image: songs[index]['img'],
                                  title: songs[index]['title'],
                                    songsUrl: songs[index]['song_url'],
                                  color:songs[index]['color'],
                                  descraption: songs[index]['description'] ,
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
                                width:size.width-210,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(songs[index]['song_count'],
                                      maxLines:1,
                                      textAlign:TextAlign.center,
                                      //overflow:TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: grey,

                                      ),),
                                    Text(songs[index]['date'],
                                      maxLines:1,
                                      textAlign:TextAlign.center,
                                      //overflow:TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: grey,

                                      ),),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(songsAlbum.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            alignment:Alignment.bottomCenter,
                            child: musicPage(
                              image:  widget.songs['img'],
                              title:  widget.songs['title'],
                            songsUrl: widget.songs['song_url'],
                              color:  widget.songs['color'],
                        descraption:  widget.songs['description'] ,
                            ), type: PageTransitionType.scale));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: (size.width-60)*0.77,
                            height: 50,
                            child: Text('${index+1}  '+songsAlbum[index]['title'],
                            style: TextStyle(
                              color: white,
                            ),),
                          ),
                          Container(
                            width: (size.width-60)*0.23,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(songsAlbum[index]['duration'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: grey,
                                  ),),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: grey.withOpacity(0.8)
                                  ),
                                  child:Icon(
                                    Icons.play_arrow,
                                    size: 16,
                                    color: white,
                                  ) ,
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, icon:Icon(Icons.arrow_back_ios,
                color: white,)),
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, icon:Icon(Feather.more_vertical,
                  color: white,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
