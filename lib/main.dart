import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import 'package:m335_project/pages/normalStartPage.dart';
import 'package:m335_project/pages/carModePage.dart';
import 'package:m335_project/pages/libraryPage.dart';
import 'package:m335_project/model/songLibrary.dart';
import 'package:m335_project/model/urlLibrary.dart';

/**
 * async method where the VideoApp is being started
 */
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final player = AudioPlayer();
  UrlLibrary urlData = UrlLibrary();
  SongLibrary data = SongLibrary();

  runApp(VideoApp(data, player, urlData));
}

/**
 * class where the VideoApp is being created
 */
class VideoApp extends StatelessWidget {

  final SongLibrary data;
  final UrlLibrary urlData;
  final AudioPlayer audioData;

  VideoApp(this.data,this.audioData,this.urlData, {Key? key}) : super(key: key);

  /**
   * Widget that is the root of this application, and where the start page is being defined
   */
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<SongLibrary>(
      create: (_) => data, child: MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NormalStartPage(audioData),
    ), );
  }
}

/**
 * class with a constructor for my homepage
 */
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  /**
   * creating a state
   */
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/**
 * class for the homepage that extends it's state
 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  /**
   * class that has an increasing counter
   */
  void _incrementCounter() {
    setState(() {

      _counter++;

    });
  }

  /**
   * basic widget for my homepage
   */
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
