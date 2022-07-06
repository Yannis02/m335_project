import 'dart:math';
import 'package:flutter/material.dart';

class SongLibrary extends ChangeNotifier {
  late List<String> _songs;

  SongLibrary() {
    _songs = [
      "Congratulations",
      "Circles",
      "Rockstar",
      "Wow",
      "One right now"
    ];
  }

  List<String> get songs => List.unmodifiable(_songs);

  String get randomSong {
    return _songs[Random().nextInt(_songs.length)];

  }

  String getSong (int index){
    return _songs[index];
}
int getLength(){
    return _songs.length;
}

  add(String wisdom) {
    _songs.add(wisdom);
    notifyListeners();
  }

}