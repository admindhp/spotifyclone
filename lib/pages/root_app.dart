// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spotify/pages/home_page.dart';
import 'package:spotify/theme/colors.dart';

import 'library_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        LibraryPage(),
        const Center(
          child: Text("Search",style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ) ,),
        ),
        const Center(
          child: Text("Settings",style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ) ,),
        )
      ],
    );
  }


  Widget getFooter(){
    List items = [
      Icons.home,
      Icons.book,
      Icons.search,
      Icons.settings,
    ];
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.black ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(onPressed: (){
              setState(() {
                activeTab = index;
              });
            }, icon: Icon(
              items[index],
              color: activeTab == index ? primary : Colors.grey,
            ));
          }),
        ),
      ),
    );
  }
}
