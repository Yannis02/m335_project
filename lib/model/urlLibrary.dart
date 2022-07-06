import 'dart:math';
import 'package:flutter/material.dart';
import 'package:m335_project/model/urlLibrary.dart';

class UrlLibrary extends ChangeNotifier {
  late List<String> _urls;

  UrlLibrary() {
    _urls = [
      "https://www.mboxdrive.com/congratulations.mp3",
      "https://www.mboxdrive.com/circles.mp3",
      "https://www.mboxdrive.com/rockstar.mp3",
      "https://www.mboxdrive.com/wow.mp3",
      "https://www.mboxdrive.com/oneRightNow.mp3"
    ];
  }
  String getUrl (int index){
    return _urls[index];
  }






}