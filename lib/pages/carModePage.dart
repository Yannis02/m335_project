import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';


import 'package:m335_project/pages/normalStartPage.dart';
import 'package:m335_project/model/songLibrary.dart';
import 'package:m335_project/pages/libraryPage.dart';

class CarModePage extends StatefulWidget {
  @override
  State<CarModePage> createState() => _CarModePageState();

}

class _CarModePageState extends State<CarModePage>{
  var stateSong = 0;
  forceRedraw(){
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    var songs = Provider.of<SongLibrary>(context);
    String songName = songs.randomSong;
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Mode"),
        foregroundColor: Colors.tealAccent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return NormalStartPage();
                  }),
                );
              },
              icon: Icon(Icons.directions_walk)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Container(
            child: Image.asset('lib/media/posty.jpg'),
            height: 220,
            width: 220,

          ), SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          GestureDetector(
            onTap: forceRedraw,
            child: Center(
              child: Text(songName,
                style: TextStyle(
                  fontSize: 40,
                ),),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: (){
                      setState((){
                        stateSong++;
                        print(stateSong);
                      });

                    },
                    icon: (stateSong % 2 == 0) ? Icon(Icons.play_circle_outline) :  Icon(Icons.stop),
                    iconSize: 100,
                  ),
                  SizedBox(width: 20),
                ],
              )
          )

        ],

      ),
    );
  }

}

