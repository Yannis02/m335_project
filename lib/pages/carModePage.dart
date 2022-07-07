import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';

import 'package:m335_project/pages/normalStartPage.dart';
import 'package:m335_project/model/songLibrary.dart';
import 'package:m335_project/pages/libraryPage.dart';

/**
 * class for the page "Car Mode"
 */
class CarModePage extends StatefulWidget {

  AudioPlayer player;
  CarModePage(this.player);

  /**
   * creating a state
   */
  @override
  State<CarModePage> createState() => _CarModePageState();
}
/**
 * class for "Car Mode" that extends it's state
 */
class _CarModePageState extends State<CarModePage> {

  var stateSong = 0;
  String? songName;

  /**
   * method that gets called when opening that page
   */
  @override
  void initState() {
    super.initState();

    ShakeDetector detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return NormalStartPage(widget.player);
            }),
          );
        }
    );
  }

  /**
   * the widget of the page "Car Mode"
   */
  @override
  Widget build(BuildContext context) {

    var songs = Provider.of<SongLibrary>(context);

    if (songName == null) {
      songName = songs.randomSong;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Car Mode"),
        foregroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            child: Image.asset('lib/media/posty.jpg'),
            height: 220,
            width: 220,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                songName = songs.randomSong;
              });
            },
            child: Center(
              child: Text(
                songName ?? "",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    stateSong++;
                  });
                  (stateSong % 2 == 0)
                      ? pause(widget.player)
                      : play(widget.player);
                  if (stateSong % 2 == 0) {
                    reset(widget.player);
                  }
                },
                icon: (stateSong % 2 == 0)
                    ? Icon(Icons.play_circle_outline)
                    : Icon(Icons.stop),
                iconSize: 100,
              ),
              SizedBox(width: 20),
            ],
          ))
        ],
      ),
    );
  }

  /**
   * async method to start playing a song
   */
  play(AudioPlayer player) async {
    await player.play();
  }

  /**
   * async method to pause a song
   */
  pause(AudioPlayer player) async {
    await player.pause();
  }

  /**
   * async method to set the speed of the song to 1.0
   */
  reset(AudioPlayer player) async {
    await player.setSpeed(1.0);
  }
}
