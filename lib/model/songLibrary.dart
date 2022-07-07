import 'dart:math';
import 'package:flutter/material.dart';

/**
 * library for all the song titles
 */
class SongLibrary extends ChangeNotifier {

  late List<String> _songs;

  //saved song titles
  SongLibrary() {
    _songs = [
      "Congratulations",
      "Circles",
      "Rockstar",
      "Wow",
      "One right now"
    ];
  }

  /**
   * method to get the songs
   */
  List<String> get songs => List.unmodifiable(_songs);

  /**
   * method to get a random song
   */
  String get randomSong {
    return _songs[Random().nextInt(_songs.length)];
  }

  /**
   * method to get a specific song by index
   */
  String getSong (int index){
    return _songs[index];
  }

  /**
   * method to get the number of songs (array length)
   */
  int getLength(){
    return _songs.length;
  }

  /**
   * method to add a song title to the list
   */
  add(String wisdom) {
    _songs.add(wisdom);
    notifyListeners();
  }
}