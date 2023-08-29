import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/theme/colors.dart';

class MusicPlayer extends StatefulWidget {
  final String title;
  final String descriptiion;
  final Color color;
  final String img;
  final String songUrl;

  const MusicPlayer({Key? key,
    required this.title,
    required this.descriptiion,
    required this.color,
    required this.img,
    required this.songUrl})
      :super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double currentslidervalue = 20;

  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;
  bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  initPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songUrl);
  }
  playSound(localPath) async {
    await audioCache.play(localPath);

  }
  stopSound(localPath) async{
    File audioFile = await audioCache.load(localPath);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.stop();
  }
  seekSound() async{
    File audioFile = await audioCache.load(widget.songUrl);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.seek(Duration(milliseconds: 2000));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        actions: [
          IconButton(onPressed: null,
              icon: Icon(Icons.more_vert,
              color: white,))
        ],
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                child: Container(
                  width: size.width-100,
                  height: size.width-100,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: widget.color,
                      blurRadius: 50,
                      spreadRadius: 5,
                      offset: Offset(-10, 10)
                    )],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                child: Container(
                  width: size.width-60,
                  height: size.width-60,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.img),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),

                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              width: size.width-80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.add_box_outlined,
                  color: white,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.title,
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),),
                      Container(
                        width: 150,
                        child: Text(widget.descriptiion,
                          maxLines: 2,
                          textAlign: TextAlign.center ,
                          style: TextStyle(
                          fontSize: 18,
                          color: white.withOpacity(0.5),

                        ),),
                      )
                    ],
                  ),
                  Icon(Icons.more_vert,
                    color: white,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Slider(
              activeColor: primary,
              value: currentslidervalue ,
              min: 0,
              max: 200,
              onChanged: (value){
            setState(() {
              currentslidervalue = value;
            });
            seekSound();
              }),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("0.58",
                style: TextStyle(color: white.withOpacity(0.5)),),
                Text("4.20",
                  style: TextStyle(color: white.withOpacity(0.5)),)
              ],
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: null,
                    icon: Icon(Icons.shuffle,
                        color: white.withOpacity(0.8),
                        size: 25),
                  ),
                IconButton(onPressed: null,
                  icon: Icon(Icons.skip_previous_rounded,color: white.withOpacity(0.8),
                      size: 35),
                ),
                IconButton(onPressed: (){
                  if(isPlaying){
                    stopSound(widget.songUrl);
                    setState(() {
                      isPlaying = false;
                    });
                  }
                  else{
                    playSound(widget.songUrl);
                    setState(() {
                      isPlaying = true;
                    });
                  }
                },
                   iconSize: 50,
                   icon: Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: primary,),
                     child: Center(
                       child: Icon(isPlaying ? Icons.stop : Icons.play_arrow,
                       size: 20,
                       color: white,),
                     ),
                   ),),
                IconButton(onPressed: null,
                  icon: Icon(Icons.skip_next_rounded,
                      color: white.withOpacity(0.8),
                      size: 35),
                  ),
                IconButton(onPressed: null,
                  icon: Icon(Icons.repeat_rounded,
                      color: white.withOpacity(0.8),
                      size: 25),
                  )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.tv_rounded,color: primary,size: 25,),
              SizedBox(width: 25,),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text("Chromecast is Ready",style: TextStyle(
                  color: primary,

                ),),
              )
            ],
          )

        ],
      ),
    );
  }
}
