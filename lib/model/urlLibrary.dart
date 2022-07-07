import 'dart:math';
import 'package:flutter/material.dart';

/**
 * library for all the url's of the songs
 */
class UrlLibrary extends ChangeNotifier {

  late List<String> _urls;

  //saved song url's
  UrlLibrary() {
    _urls = [
      "https://www.mboxdrive.com/congratulations.mp3",
      "https://www.mboxdrive.com/circles.mp3",
      "https://www.mboxdrive.com/rockstar.mp3",
      "https://www.mboxdrive.com/wow.mp3",
      "https://www.mboxdrive.com/oneRightNow.mp3"
    ];
  }

  /**
   * method to get an url by index
   */
  String getUrl (int index){
    return _urls[index];
  }
}