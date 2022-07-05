import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


import 'package:m335_project/pages/normalStartPage.dart';

class CarModePage extends StatefulWidget {
  @override
  State<CarModePage> createState() => _CarModePageState();

}

class _CarModePageState extends State<CarModePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Mode"),
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
              icon: Icon(Icons.directions_walk)),
        ],
      ),
    );
  }

}

