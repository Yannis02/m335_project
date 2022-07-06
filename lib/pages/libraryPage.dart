import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:m335_project/pages/normalStartPage.dart';
import 'package:m335_project/pages/carModePage.dart';
import 'package:m335_project/model/songLibrary.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();

}

class _LibraryPageState extends State<LibraryPage> {
  final myController = TextEditingController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var songs = Provider.of<SongLibrary>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Music Library"),
        foregroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: songList(context)),
            Expanded(child: songForm(context))
          ],
        ),
      ),
    );
  }

  Widget songList(BuildContext context) {
    var songData = Provider.of<SongLibrary>(context);
    return Scrollbar(child: ListView.builder(
        itemCount: songData.songs.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              tileColor: Color((index / 11 * 0xFFFFFF).toInt()).withOpacity(
                  0.5),
              title: Center(child: Text(songData.songs[index])),
            ),
          );
        }));
  }
    Widget songForm(BuildContext context){
      var songData = Provider.of<SongLibrary>(context);
      return Column(
        children: [
          TextField(
            controller: myController,
          ),
          ElevatedButton(
              onPressed: (){
                if(myController.text.isNotEmpty){
                  songData.add(myController.text);
                  myController.clear();
                }
              }, child: Text("add"))
        ],
      );
    }

  }


