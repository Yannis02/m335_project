import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import '../model/speedometer.dart';
//import 'package:sensors/sensors.dart';
import 'dart:math';

import 'package:m335_project/model/songLibrary.dart';
import 'package:m335_project/pages/libraryPage.dart';
import 'package:m335_project/pages/carModePage.dart';

class NormalStartPage extends StatefulWidget {

  @override
  State<NormalStartPage> createState() => _NormalStartPageState();

  }

class _NormalStartPageState extends State<NormalStartPage>{
  forceRedraw(){
    setState(() => {});
  }
  final player = AudioPlayer();
  //final duration = await player.setUrl(           // Load a URL
  //'lib/media/congratulations.mp3');
  @override
  Widget build(BuildContext context) {
    var songs = Provider.of<SongLibrary>(context);
    String songName = songs.randomSong;
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        foregroundColor: Colors.tealAccent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LibraryPage();
                  }),
                );
              },
                icon: Icon(Icons.music_note_outlined)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CarModePage();
                  }),
                );
              },
              icon: Icon(Icons.car_crash_outlined)),
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
                IconButton(
                  icon: Image.asset('lib/media/schildkrote.png'),
                  iconSize: 80,

                  onPressed: () {},
                ),
                SizedBox(width: 20),
                IconButton(
                icon: Icon(Icons.play_circle_outline),
                  iconSize: 100,

                  onPressed: () {},
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Image.asset('lib/media/hase.png'),
                  iconSize: 80,

                  onPressed: () {},
                ),
              ],
            )
            )

              ],

            ),


    );
  }

}


