import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:spotify/json/songs_json.dart';
import 'package:spotify/pages/album_page.dart';
import 'package:spotify/theme/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activemenu1 = 0;
  int activemenu2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10,
        title: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Explore",style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Icon(Icons.list),
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,top: 50),
                  child: Row(
                    children: List.generate(song_type_1.length, (index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              activemenu1 = index;

                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(song_type_1[index],style: TextStyle(
                                fontSize: 15,
                                color: activemenu1 == index ? primary : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),),
                              SizedBox(height: 3,),
                              activemenu1 == index ? Container(
                                width: 10,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ) : Container()

                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: List.generate(songs.length-5, (index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, PageTransition(
                                alignment: Alignment.bottomCenter,
                                child: AlbumPage(
                                  song: songs[index],
                                ),
                                type: PageTransitionType.fade) );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(songs[index]['img']),fit: BoxFit.cover),
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text(songs[index]['title'],style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.w600,
                              ),),
                              SizedBox(height: 5,),
                              Container(
                                width: 180,
                                child: Text(songs[index]['description'],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                  fontSize: 12,
                                  color: grey,
                                  fontWeight: FontWeight.w600,
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
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,top: 50),
                  child: Row(
                    children: List.generate(song_type_2.length, (index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              activemenu2 = index;

                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(song_type_2[index],style: TextStyle(
                                fontSize: 15,
                                color: activemenu2 == index ? primary : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),),
                              SizedBox(height: 3,),
                              activemenu2 == index ? Container(
                                width: 10,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ) : Container()

                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: List.generate(songs.length-5, (index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, PageTransition(
                                alignment: Alignment.bottomCenter,
                                child: AlbumPage(
                                  song: songs[index + 5],
                                ),
                                type: PageTransitionType.fade) );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(songs[index + 5]['img']),fit: BoxFit.cover),
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text(songs[index + 5]['title'],style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.w600,
                              ),),
                              SizedBox(height: 5,),
                              Container(
                                width: 180,
                                child: Text(songs[index + 5]['description'],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: grey,
                                    fontWeight: FontWeight.w600,
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
        ],
      ),
    );
  }
}
