import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:m335_project/pages/normalStartPage.dart';
import 'package:m335_project/pages/carModePage.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();

}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Library"),
        foregroundColor: Colors.tealAccent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return NormalStartPage();
                  }),
                );
              },
              icon: Icon(Icons.play_circle_outline)),
        ],
      ),
      body: Container(),
    );
  }

}

