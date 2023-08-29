
import 'package:flutter/material.dart';
import 'package:spotify/theme/colors.dart';


class LibraryPage extends StatefulWidget {
  final dynamic song;
  const LibraryPage({Key? key, this.song}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: black,
        toolbarHeight: 100,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Library",style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Icon(Icons.library_add,color: primary,),
            ],
          ),
        ),
      ),
      body: getBody(),
    );

  }
  Widget getBody(){
    return Container(
      child: Text("Library"),
    );
  }
}
