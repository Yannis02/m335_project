import 'dart:math';
import 'package:flutter/material.dart';

class SongLibrary extends ChangeNotifier {
  late List<String> _songs;

  SongLibrary() {
    _songs = [
      "Congratulations",
      "Layla",
      "Where are you now",
      "Middle of the Night",
      "One Kiss"

    ];
  }

  List<String> get songs => List.unmodifiable(_songs);

  String get randomSong => _songs[Random().nextInt(_songs.length)];

  add(String wisdom) {
    _songs.add(wisdom);
    notifyListeners();
  }

}