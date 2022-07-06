import 'dart:math';
import 'package:flutter/material.dart';

class SongLibrary extends ChangeNotifier {
  late List<String> _songs;

  SongLibrary() {
    _songs = [
      "Congratulations",
      "Rockstar",
      "Wow",
      "One right now",
      "Circles"

    ];
  }

  List<String> get songs => List.unmodifiable(_songs);

  String get randomSong {
    return _songs[Random().nextInt(_songs.length)];

  }

  add(String wisdom) {
    _songs.add(wisdom);
    notifyListeners();
  }

}