import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:shake/shake.dart';

import 'package:m335_project/model/urlLibrary.dart';
import 'package:m335_project/model/songLibrary.dart';
import 'package:m335_project/pages/libraryPage.dart';
import 'package:m335_project/pages/carModePage.dart';

/**
 * class of the "Music Player" (or start) page
 */
class NormalStartPage extends StatefulWidget {

  AudioPlayer player;
  NormalStartPage(this.player);

  /**
   * creating a state
   */
  @override
  State<NormalStartPage> createState() => _NormalStartPageState();
}

/**
 * class for "Music Player" that extends it's state
 */
class _NormalStartPageState extends State<NormalStartPage> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  //rotation of the animation counter-clock wise
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  //rotation of the animation clock wise
  final Tween<double> doesNotTurnTween = Tween<double>(
    begin: 0,
    end: 1,
  );

  var zustand = 0;
  String? songName;

  /**
   * method that gets called when opening that page
   */
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn,);
    _controller.repeat();

    ShakeDetector detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return CarModePage(widget.player);
            }),
          );
        }
    );
  }

  /**
   * method that gets called when the page is closed
   */
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /**
   * the widget of the page "Music Player"
   */
  @override
  Widget build(BuildContext context) {

    var songs = Provider.of<SongLibrary>(context);

    if (songName == null) {
      songName = "Congratulations";
    }

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
                    return CarModePage(widget.player);
                  }),
                );
              },
              icon: Icon(Icons.car_crash_outlined)),
        ],
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

      organizeSong(widget.player);

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
          RotationTransition(turns:
          turnsTween.animate(_controller),
            child: IconButton(
              icon: Image.asset('lib/media/schildkrote.png'),
              iconSize: 80,
               onPressed: () {
                slow(widget.player);
         },
       ),
     ),
     SizedBox(width: 20),
      IconButton(
        onPressed: () {
          setState(() {
           zustand++;
      });

    (zustand % 2 == 0)
    ? pause(widget.player)
        : play(widget.player);

     if (zustand % 2 == 0) {
       reset(widget.player);
     }
    },
    icon: (zustand % 2 == 0)
    ? Icon(Icons.play_circle_outline)
        : Icon(Icons.stop),
    iconSize: 100,
     ),
     SizedBox(width: 20),

      RotationTransition(turns:
        doesNotTurnTween.animate(_controller),
         child: IconButton(
          icon: Image.asset('lib/media/hase.png'),
          iconSize: 80,
          onPressed: () {
            fast(widget.player);
                },
              ),
             ),
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
    await player.setUrl('https://www.mboxdrive.com/congratulations.mp3');
    await player.play();
  }

  /**
   * async method to pause a song
   */
  pause(AudioPlayer player) async {
    await player.pause();
  }

  /**
   * async method to inrease the speed of the song
   */
  fast(AudioPlayer player) async {
    await player.setSpeed(1.2);
  }

  /**
   * async method to decrease the speed of the song
   */
  slow(AudioPlayer player) async {
    await player.setSpeed(0.8);
  }

  /**
   * async method to reset the speed of the song to 1.0
   */
  reset(AudioPlayer player) async {
    await player.setSpeed(1.0);
  }

  /**
   * method to match song name and it's url
   */
  organizeSong(AudioPlayer player){

    var songs = Provider.of<SongLibrary>(context, listen: false);

     UrlLibrary urls = UrlLibrary();

    int randomInt = Random().nextInt(songs.getLength());

    songName = songs.getSong(randomInt);

    player.setUrl(urls.getUrl(randomInt));

  }
}
