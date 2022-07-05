import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:m335_project/pages/libraryPage.dart';
import 'package:m335_project/pages/carModePage.dart';

class NormalStartPage extends StatefulWidget {
  @override
  State<NormalStartPage> createState() => _NormalStartPageState();

  }

class _NormalStartPageState extends State<NormalStartPage>{
  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Text("Music Title",
              style: TextStyle(
                fontSize: 40,
              ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('lib/media/schildkrote.png'),
                  iconSize: 100,

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
                  iconSize: 100,

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


